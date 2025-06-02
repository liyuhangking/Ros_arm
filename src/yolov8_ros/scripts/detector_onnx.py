#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
import pyrealsense2 as rs
import tf2_ros
import onnxruntime as ort
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from yolov8_ros.msg import Detection3D
from visualization_msgs.msg import Marker
from geometry_msgs.msg import TransformStamped

class YOLOv8Detector:
    def __init__(self):
        # 初始化 ROS 节点
        rospy.init_node('yolov8_detector', anonymous=True)

        # 加载参数
        self.model_path = rospy.get_param('~model_path', '$(find yolov8_ros)/models/best.onnx')
        self.conf_thres = rospy.get_param('~conf_thres', 0.5)
        self.iou_thres = rospy.get_param('~iou_thres', 0.5)
        self.input_size = (640, 640)  # YOLOv8 默认输入尺寸
        self.num_classes = 6  # 显式指定类别数

        # 获取类别名称
        class_names_str = rospy.get_param('~class_names', 'circle_blue,circle_green,circle_red,object_blue,object_green,object_red')
        self.class_names = class_names_str.split(',')

        # 初始化 ONNX Runtime（默认 CPU 推理）
        providers = ['CPUExecutionProvider']  # 强制使用 CPU
        self.session = ort.InferenceSession(self.model_path, providers=providers)
        self.input_name = self.session.get_inputs()[0].name
        self.output_names = [output.name for output in self.session.get_outputs()]

        # 初始化相机和转换工具
        self.bridge = CvBridge()
        self.pipeline = rs.pipeline()
        self.config = rs.config()
        self.config.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)
        self.config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
        self.pipe_profile = self.pipeline.start(self.config)
        self.align = rs.align(rs.stream.color)
        self.spatial = rs.spatial_filter()

        # 发布器和 TF 相关
        self.detection_pub = rospy.Publisher('/yolov8/detections', Detection3D, queue_size=10)
        self.tf_broadcaster = tf2_ros.TransformBroadcaster()
        self.marker_pub = rospy.Publisher('/visualization_marker', Marker, queue_size=10)
        self.object_id_counter = 0
        self.active_objects = {}

        rospy.on_shutdown(self.shutdown_hook)

    def preprocess(self, img):
        """图像预处理"""
        img = cv2.resize(img, self.input_size)
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        img = np.transpose(img, (2, 0, 1))  # HWC -> CHW
        img = np.expand_dims(img, 0)  # 添加批次维度
        return img.astype(np.float32) / 255.0

    def postprocess(self, outputs, original_shape, input_shape):
        """解析模型输出（适配维度 [1, 10, 8400]）"""
        predictions = outputs[0]  # 假设输出为 [1, 10, 8400]
        rospy.logdebug(f"Output shape: {predictions.shape}")  # 修正为 logdebug

        # 假设每个锚点包含 4坐标+1置信度+6类别 = 11 个参数
        per_anchor_params = 4 + 1 + self.num_classes
        if predictions.shape[-1] != per_anchor_params:
            rospy.logerr(f"Invalid output parameters: expected {per_anchor_params}, got {predictions.shape[-1]}")
            return [], [], []

        # 拆分坐标、置信度、类别
        coords = predictions[..., :4]         # [1, 10, 4]
        conf = predictions[..., 4:5]          # [1, 10, 1]
        cls = predictions[..., 5:5+self.num_classes]  # [1, 10, 6]

        # 转换为 [锚点, 参数] 格式
        coords = coords.reshape(-1, 4)
        conf = conf.reshape(-1)
        cls = cls.reshape(-1, self.num_classes)

        # 计算分数和类别索引
        scores = np.max(cls, axis=1)
        class_indices = np.argmax(cls, axis=1)

        # 过滤低置信度
        keep = scores > self.conf_thres
        coords = coords[keep]
        scores = scores[keep]
        class_indices = class_indices[keep]

        # 坐标缩放回原始图像
        ratio_h, ratio_w = original_shape[0]/input_shape[0], original_shape[1]/input_shape[1]
        coords[:, [0, 2]] *= ratio_w  # x1, x2
        coords[:, [1, 3]] *= ratio_h  # y1, y2

        # 应用 NMS
        indices = self._nms(coords, scores, self.iou_thres)
        return coords[indices], scores[indices], class_indices[indices]

    def _nms(self, boxes, scores, iou_threshold):
        """非极大值抑制"""
        x1 = boxes[:, 0]
        y1 = boxes[:, 1]
        x2 = boxes[:, 2]
        y2 = boxes[:, 3]
        areas = (x2 - x1 + 1) * (y2 - y1 + 1)
        order = scores.argsort()[::-1]
        keep = []

        while order.size > 0:
            i = order[0]
            keep.append(i)
            xx1 = np.maximum(x1[i], x1[order[1:]])
            yy1 = np.maximum(y1[i], y1[order[1:]])
            xx2 = np.minimum(x2[i], x2[order[1:]])
            yy2 = np.minimum(y2[i], y2[order[1:]])
            w = np.maximum(0.0, xx2 - xx1 + 1)
            h = np.maximum(0.0, yy2 - yy1 + 1)
            inter = w * h
            ovr = inter / (areas[i] + areas[order[1:]] - inter)
            inds = np.where(ovr <= iou_threshold)[0]
            order = order[inds + 1]
        return keep

    def get_aligned_images(self):
        """获取对齐的深度和彩色图像"""
        try:
            frames = self.pipeline.wait_for_frames(timeout_ms=1000)
            aligned_frames = self.align.process(frames)
            depth_frame = aligned_frames.get_depth_frame()
            color_frame = aligned_frames.get_color_frame()
            if not depth_frame or not color_frame:
                return None, None, None
            filtered_depth = self.spatial.process(depth_frame)
            depth_intrin = filtered_depth.profile.as_video_stream_profile().intrinsics
            img_color = np.asanyarray(color_frame.get_data())
            img_depth = np.asanyarray(filtered_depth.get_data())
            return depth_intrin, img_color, filtered_depth
        except Exception as e:
            rospy.logerr(f"Error getting frames: {e}")
            return None, None, None

    def publish_tf(self, position, class_name):
        """发布 TF 变换"""
        if class_name not in self.active_objects:
            self.active_objects[class_name] = self.object_id_counter
            self.object_id_counter += 1
        object_id = self.active_objects[class_name]
        tf_msg = TransformStamped()
        tf_msg.header.stamp = rospy.Time.now()
        tf_msg.header.frame_id = "camera_frame"
        tf_msg.child_frame_id = f"object_{class_name}_{object_id}"
        tf_msg.transform.translation.x = position[0]
        tf_msg.transform.translation.y = position[1]
        tf_msg.transform.translation.z = position[2]
        tf_msg.transform.rotation.w = 1.0
        self.tf_broadcaster.sendTransform(tf_msg)

    def publish_marker(self, position, class_name, score):
        """发布可视化 Marker"""
        marker = Marker()
        marker.header.frame_id = "camera_frame"
        marker.header.stamp = rospy.Time.now()
        marker.ns = class_name
        marker.id = hash(class_name + str(position))
        marker.type = Marker.CUBE
        marker.action = Marker.ADD
        marker.pose.position.x = position[0]
        marker.pose.position.y = position[1]
        marker.pose.position.z = position[2]
        marker.pose.orientation.w = 1.0
        marker.scale.x = marker.scale.y = marker.scale.z = 0.1

        # 颜色映射
        color_map = {
            'circle_blue': (0, 0, 1), 'circle_green': (0, 1, 0), 'circle_red': (1, 0, 0),
            'object_blue': (0, 0, 0.8), 'object_green': (0, 0.8, 0), 'object_red': (0.8, 0, 0)
        }
        r, g, b = color_map.get(class_name, (0.5, 0.5, 0.5))
        marker.color.r, marker.color.g, marker.color.b = r, g, b
        marker.color.a = min(0.9, score * 2)
        marker.lifetime = rospy.Duration(0.5)
        self.marker_pub.publish(marker)

    def shutdown_hook(self):
        """关闭回调"""
        self.pipeline.stop()
        cv2.destroyAllWindows()
        rospy.loginfo("Shutting down detector...")

    def run(self):
        rate = rospy.Rate(30)
        while not rospy.is_shutdown():
            depth_intrin, img_color, depth_frame = self.get_aligned_images()
            if img_color is None:
                rate.sleep()
                continue

            # 推理
            input_tensor = self.preprocess(img_color)
            outputs = self.session.run(self.output_names, {self.input_name: input_tensor})

            # 后处理
            boxes, scores, class_indices = self.postprocess(outputs, img_color.shape[:2], self.input_size)

            # 绘制结果
            im_array = img_color.copy()
            for i, (box, score, cls_idx) in enumerate(zip(boxes, scores, class_indices)):
                if cls_idx >= self.num_classes:
                    rospy.logwarn(f"Invalid class index {cls_idx}, skipped")
                    continue

                class_name = self.class_names[cls_idx]
                x1, y1, x2, y2 = map(int, box)
                ux, uy = (x1+x2)//2, (y1+y2)//2
                dis = depth_frame.get_distance(ux, uy)

                if dis <= 0 or dis > 10:
                    continue

                # 计算 3D 坐标
                xyz = rs.rs2_deproject_pixel_to_point(depth_intrin, (ux, uy), dis)
                xyz = np.round(xyz, 3)

                # 发布消息
                self.detection_pub.publish(Detection3D(
                    header=rospy.Header(frame_id="camera_frame"),
                    class_name=class_name,
                    confidence=float(score),
                    bbox=[x1, y1, x2, y2],
                    position=list(xyz)
                ))
                self.publish_tf(xyz, class_name)
                self.publish_marker(xyz, class_name, score)

                # 绘制 2D 框和标签
                cv2.rectangle(im_array, (x1, y1), (x2, y2), (0, 255, 0), 2)
                cv2.putText(im_array, f"{class_name} {score:.2f}", (x1, y1-10),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)
                cv2.circle(im_array, (ux, uy), 4, (255, 255, 255), -1)
                cv2.putText(im_array, f"({xyz[0]:.2f}, {xyz[1]:.2f}, {xyz[2]:.2f})m",
                            (ux+20, uy+10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1)

            cv2.imshow("Detection", im_array)
            cv2.waitKey(1)
            rate.sleep()

if __name__ == '__main__':
    try:
        detector = YOLOv8Detector()
        detector.run()
    except rospy.ROSInterruptException:
        pass

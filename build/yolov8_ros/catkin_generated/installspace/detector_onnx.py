#!/usr/bin/env python3
import rospy
import cv2
import numpy as np
import pyrealsense2 as rs
import onnxruntime as ort
from sensor_msgs.msg import Image
from yolov8_ros.msg import Detection3D
from cv_bridge import CvBridge
from geometry_msgs.msg import TransformStamped
from visualization_msgs.msg import Marker
import tf2_ros

class YOLOv8Detector:
    def __init__(self):
        rospy.init_node('yolov8_onnx_detector', anonymous=True)
        
        # 参数配置
        self.model_path = rospy.get_param('~model_path', 'models/best.onnx')
        self.confidence_thres = rospy.get_param('~confidence', 0.5)
        self.iou_thres = rospy.get_param('~iou_threshold', 0.5)
        self.input_size = rospy.get_param('~input_size', (640, 640))
        
        # **关键修改：定义类别列表和颜色映射**
        self.classes = {
            "0": "circle_blue",
            "1": "circle_green",
            "2": "circle_red",
            "3": "object_blue",
            "4": "object_green",
            "5": "object_red"
        }
        self.class_names = list(self.classes.values())  # 转换为列表便于索引
        self.color_palette = self._get_color_palette()  # 定义颜色
        
        # 初始化 ONNX Runtime
        self.session = self._init_onnx_session()
        
        # RealSense 配置
        self.pipeline = rs.pipeline()
        self.config = rs.config()
        self.config.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)
        self.config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
        self.pipe_profile = self.pipeline.start(self.config)
        self.align = rs.align(rs.stream.color)
        self.bridge = CvBridge()
        
        # 发布器初始化
        self.detection_pub = rospy.Publisher('/yolov8/detections', Detection3D, queue_size=10)
        self.tf_broadcaster = tf2_ros.TransformBroadcaster()
        self.marker_pub = rospy.Publisher('/visualization_marker', Marker, queue_size=10)

    def _init_onnx_session(self):
        """初始化 ONNX Runtime 会话"""
        session_options = ort.SessionOptions()
        session_options.graph_optimization_level = ort.GraphOptimizationLevel.ORT_ENABLE_ALL
        session_options.intra_op_num_threads = 8  # 设置线程数
        
        return ort.InferenceSession(
            self.model_path,
            sess_options=session_options,
            providers=['CPUExecutionProvider']
        )

    def _get_color_palette(self):
        """根据类别名称生成颜色（蓝色、绿色、红色区分）"""
        color_map = {
            "blue": (255, 0, 0),   # BGR 蓝色
            "green": (0, 255, 0),  # BGR 绿色
            "red": (0, 0, 255)     # BGR 红色
        }
        colors = []
        for name in self.class_names:
            for key in color_map:
                if key in name:
                    colors.append(color_map[key])
                    break
        return colors

    def preprocess(self, image):
        """图像预处理"""
        height, width = image.shape[:2]
        r = min(self.input_size[0]/height, self.input_size[1]/width)
        new_unpad = (int(width*r), int(height*r))
        dw, dh = (self.input_size[1]-new_unpad[0])/2, (self.input_size[0]-new_unpad[1])/2
        
        # 缩放图像
        image = cv2.resize(image, new_unpad, interpolation=cv2.INTER_LINEAR)
        # 添加黑边
        image = cv2.copyMakeBorder(
            image, int(dh), int(dh), int(dw), int(dw),
            cv2.BORDER_CONSTANT, value=(114, 114, 114)
        )
        # 归一化并调整维度
        image = image.astype(np.float32) / 255.0
        image = np.transpose(image, (2, 0, 1))
        image = np.expand_dims(image, axis=0)
        return image, (dh, dw, height, width)

    def postprocess(self, outputs, original_h, original_w, pad):
        """模型输出后处理"""
        detections = []
        outputs = np.transpose(np.squeeze(outputs))
        
        dh, dw, height, width = pad
        gain = min(self.input_size[0]/height, self.input_size[1]/width)
        
        for row in outputs:
            scores = row[4:]
            class_id = np.argmax(scores)
            confidence = scores[class_id]
            
            if confidence > self.confidence_thres:
                x, y, w, h = row[:4]
                x = (x - dw) / gain
                y = (y - dh) / gain
                w = w / gain
                h = h / gain
                
                # 坐标约束
                x1 = max(0, int(x - w/2))
                y1 = max(0, int(y - h/2))
                x2 = min(width, int(x + w/2))
                y2 = min(height, int(y + h/2))
                
                detections.append({
                    'class_id': class_id,
                    'confidence': float(confidence),
                    'bbox': (x1, y1, x2 - x1, y2 - y1)
                })
        
        # NMS 非极大值抑制
        nms_boxes = np.array([d['bbox'] for d in detections])
        nms_scores = np.array([d['confidence'] for d in detections])
        indices = cv2.dnn.NMSBoxes(nms_boxes, nms_scores, self.confidence_thres, self.iou_thres)
        
        return [detections[i] for i in indices]

    def get_3d_coordinates(self, depth_frame, depth_intrin, bbox):
        """计算 3D 坐标"""
        ux = int(bbox[0] + bbox[2]/2)
        uy = int(bbox[1] + bbox[3]/2)
        depth = depth_frame.get_distance(ux, uy)
        xyz = rs.rs2_deproject_pixel_to_point(depth_intrin, (ux, uy), depth)
        return [xyz[0]*1000, xyz[1]*1000, xyz[2]*1000]  # 转换为毫米

    def publish_detections(self, detections, depth_intrin, depth_frame, img_color):
        """发布检测结果及可视化"""
        for det in detections:
            x1, y1, w, h = det['bbox']
            class_id = det['class_id']
            class_name = self.class_names[class_id]
            color = self.color_palette[class_id]  # 获取对应颜色
            
            # 计算 3D 坐标
            try:
                coords = self.get_3d_coordinates(depth_frame, depth_intrin, det['bbox'])
            except:
                continue
            
            # 发布 Detection3D 消息
            msg = Detection3D()
            msg.header = self.get_header()
            msg.class_name = class_name
            msg.confidence = det['confidence']
            msg.bbox = [x1, y1, w, h]
            msg.position = coords
            self.detection_pub.publish(msg)
            
            # 发布 TF 变换
            self.publish_tf(coords, class_name)
            
            # 发布 Marker（颜色与类别对应）
            self.publish_marker(coords, class_name, color)
            
            # 在图像上绘制边界框和标签
            cv2.rectangle(img_color, (x1, y1), (x1+w, y1+h), color, 2)
            label = f"{class_name}: {det['confidence']:.2f}"
            cv2.putText(img_color, label, (x1, y1-10), 
                       cv2.FONT_HERSHEY_SIMPLEX, 0.5, color, 2)

    def get_header(self):
        """生成消息头"""
        header = Image().header
        header.stamp = rospy.Time.now()
        header.frame_id = "camera_color_optical_frame"
        return header

    def publish_tf(self, position, class_name):
        """发布 TF 坐标变换"""
        tf_msg = TransformStamped()
        tf_msg.header = self.get_header()
        tf_msg.child_frame_id = f"object_{class_name}_{rospy.Time.now().to_nsecs()}"
        tf_msg.transform.translation.x = position[0]/1000  # 转换为米
        tf_msg.transform.translation.y = position[1]/1000
        tf_msg.transform.translation.z = position[2]/1000
        tf_msg.transform.rotation.w = 1.0
        self.tf_broadcaster.sendTransform(tf_msg)

    def publish_marker(self, position, class_name, color):
        """发布可视化 Marker（带颜色）"""
        marker = Marker()
        marker.header = self.get_header()
        marker.ns = "yolov8_detections"
        marker.id = hash(class_name) % 1000
        marker.type = Marker.CUBE
        marker.action = Marker.ADD
        marker.pose.position.x = position[0]/1000
        marker.pose.position.y = position[1]/1000
        marker.pose.position.z = position[2]/1000
        marker.pose.orientation.w = 1.0
        marker.scale.x = 0.1
        marker.scale.y = 0.1
        marker.scale.z = 0.1
        
        # **关键修改：设置 Marker 颜色**
        marker.color.r = color[2]/255.0  # BGR 转 RGB
        marker.color.g = color[1]/255.0
        marker.color.b = color[0]/255.0
        marker.color.a = 1.0
        
        marker.lifetime = rospy.Duration(1.0)
        self.marker_pub.publish(marker)

    def run(self):
        rate = rospy.Rate(30)
        while not rospy.is_shutdown():
            frames = self.pipeline.wait_for_frames()
            aligned_frames = self.align.process(frames)
            depth_frame = aligned_frames.get_depth_frame()
            color_frame = aligned_frames.get_color_frame()
            
            if not depth_frame or not color_frame:
                continue
            
            depth_intrin = depth_frame.profile.as_video_stream_profile().intrinsics
            img_color = np.asanyarray(color_frame.get_data())
            
            # 图像预处理
            input_tensor, pad = self.preprocess(img_color)
            
            # ONNX 推理
            outputs = self.session.run(None, {self.session.get_inputs()[0].name: input_tensor})
            
            # 后处理检测结果
            detections = self.postprocess(outputs[0], *img_color.shape[:2], pad)
            
            # 发布检测结果和可视化
            self.publish_detections(detections, depth_intrin, depth_frame, img_color)
            
            # 显示图像
            cv2.imshow("YOLOv8 Detection", img_color)
            cv2.waitKey(1)
            
            rate.sleep()

        self.pipeline.stop()
        cv2.destroyAllWindows()

if __name__ == '__main__':
    try:
        detector = YOLOv8Detector()
        detector.run()
    except rospy.ROSInterruptException:
        pass

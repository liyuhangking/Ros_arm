#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
import pyrealsense2 as rs
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from yolov8_ros.msg import Detection3D
from ultralytics import YOLO

class YOLOv8Detector:
    def __init__(self):
        # 初始化 ROS 节点
        rospy.init_node('yolov8_detector', anonymous=True)

        # 加载 YOLOv8 模型
        self.model_path = rospy.get_param('~model_path', '$(find yolov8_ros)/models/best.pt')
        self.model = YOLO(self.model_path)

        # 初始化 OpenCV 和 ROS 图像转换工具
        self.bridge = CvBridge()

        # 初始化 RealSense 相机
        self.pipeline = rs.pipeline()
        self.config = rs.config()
        self.config.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)
        self.config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
        self.pipe_profile = self.pipeline.start(self.config)
        self.align = rs.align(rs.stream.color)

        # 发布检测结果
        self.detection_pub = rospy.Publisher('/yolov8/detections', Detection3D, queue_size=10)

    def get_aligned_images(self):
        # 获取对齐的 RGB 图像和深度图像
        frames = self.pipeline.wait_for_frames()
        aligned_frames = self.align.process(frames)
        aligned_depth_frame = aligned_frames.get_depth_frame()
        aligned_color_frame = aligned_frames.get_color_frame()

        if not aligned_depth_frame or not aligned_color_frame:
            return None, None, None

        # 获取相机内参
        depth_intrin = aligned_depth_frame.profile.as_video_stream_profile().intrinsics

        # 转换为 OpenCV 图像
        img_color = np.asanyarray(aligned_color_frame.get_data())
        img_depth = np.asanyarray(aligned_depth_frame.get_data())

        return depth_intrin, img_color, aligned_depth_frame

    def run(self):
        rate = rospy.Rate(30)  # 30 Hz
        while not rospy.is_shutdown():
            # 获取对齐的 RGB 图像和深度图像
            depth_intrin, img_color, aligned_depth_frame = self.get_aligned_images()

            if img_color is None or aligned_depth_frame is None:
                rospy.logwarn("Failed to get aligned images.")
                continue

            # 使用 YOLOv8 进行目标检测
            results = self.model.predict(source=img_color, save=False, show_conf=False,conf=0.9)

            for result in results:
                boxes = result.boxes.xywh.tolist()
                im_array = result.plot()  # 绘制检测结果

                for i in range(len(boxes)):
                    ux, uy = int(boxes[i][0]), int(boxes[i][1])  # 计算像素坐标系的中心点
                    dis = aligned_depth_frame.get_distance(ux, uy)  # 获取深度值
                    camera_xyz = rs.rs2_deproject_pixel_to_point(depth_intrin, (ux, uy), dis)  # 计算相机坐标系的 XYZ
                    camera_xyz = np.round(np.array(camera_xyz), 3)  # 保留 3 位小数
                    camera_xyz = list(camera_xyz * 1000)  # 转换为毫米

                    # 创建 Detection3D 消息
                    detection_msg = Detection3D()
                    detection_msg.header.stamp = rospy.Time.now()
                    detection_msg.header.frame_id = "camera_frame"
                    detection_msg.class_name = self.model.names[int(result.boxes.cls[i])]
                    detection_msg.confidence = float(result.boxes.conf[i])
                    detection_msg.bbox = [int(boxes[i][0]), int(boxes[i][1]), int(boxes[i][2]), int(boxes[i][3])]
                    detection_msg.position = camera_xyz

                    # 发布检测结果
                    self.detection_pub.publish(detection_msg)

                    # 在图像上绘制中心点和坐标
                    cv2.circle(im_array, (ux, uy), 4, (255, 255, 255), 5)
                    cv2.putText(im_array, str(camera_xyz), (ux + 20, uy + 10), 0, 0.5, [225, 255, 255], thickness=1, lineType=cv2.LINE_AA)

            # 显示检测结果
            cv2.imshow("YOLOv8 Detection", im_array)
            cv2.waitKey(1)

            rate.sleep()

        # 停止相机流
        self.pipeline.stop()
        cv2.destroyAllWindows()

if __name__ == '__main__':
    try:
        detector = YOLOv8Detector()
        detector.run()
    except rospy.ROSInterruptException:
        pass

#!/usr/bin/env python3

import rospy
import moveit_commander
from geometry_msgs.msg import Pose
from yolov8_ros.msg import Detection3D

class VisualGrasping:
    def __init__(self):
        # 初始化 ROS 节点
        rospy.init_node('visual_grasping', anonymous=True)

        # 初始化 MoveIt!
        self.robot = moveit_commander.RobotCommander()
        self.group = moveit_commander.MoveGroupCommander("arm")  # 替换为你的机械臂组名

        # 订阅检测结果话题
        self.detection_sub = rospy.Subscriber("/yolov8/detections", Detection3D, self.detection_callback)

    def detection_callback(self, msg):
        # 获取目标位置
        target_position = msg.position  # [x, y, z] 单位：毫米
        target_position = [p / 1000.0 for p in target_position]  # 转换为米

        # 设置目标姿态
        target_pose = Pose()
        target_pose.position.x = target_position[0]
        target_pose.position.y = target_position[1]
        target_pose.position.z = target_position[2]
        target_pose.orientation.w = 1.0  # 默认朝向

        # 规划并执行运动
        self.group.set_pose_target(target_pose)
        plan = self.group.plan()
        if plan:
            self.group.execute(plan)
            rospy.loginfo("Grasping completed!")
        else:
            rospy.logwarn("Failed to plan motion.")

if __name__ == '__main__':
    try:
        grasping = VisualGrasping()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

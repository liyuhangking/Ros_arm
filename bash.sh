#!/bin/bash

# 启动机械臂模型和MoveIt!
echo "启动机械臂模型和MoveIt!..."
roslaunch config demo.launch &
sleep 3  # 等待MoveIt!完全启动

# 启动YOLOv8目标识别节点
echo "启动YOLOv8目标识别节点..."
roslaunch yolov8_ros yolov8.launch &
sleep 3  # 等待识别节点启动


rosrun arm_control visual_grasping.py
# 启动RViz可视化界面
# echo "启动RViz可视化界面..."
rosrun rviz rviz -d $(rospack find my_robot_moveit_config)/launch/moveit.rviz &
sleep 2  # 等待RViz启动

echo "所有节点已启动完成！"
echo "现在可以在RViz中查看机械臂和识别到的物体。"

# 保持脚本运行，直到用户按下Ctrl+C
while true; do
    sleep 1
done

# Ros_arm
This is a project about robotic arm. This project is developed on the basis of https://github.com/jiuyewxy/ros_arm_tutorials/tree/noetic-devel.

# Introduction
| Software package              |Content                                               |
| ------------------- | ------------------------------------------------------------ |
| camera_driver         | 相机驱动包                                    |
| yolov8_ros    | YOLOv8检测包                              |
| arm_control  | 机械臂控制包包  |
| coordinate_transformer    | 坐标转换包 |
| my_robot_description         | 机械臂URDF模型包|
# Development log
| Date |  Task   |
| ---  |  ---     |
|2025.03.01-2025.03.16|构建开发框架,选定机械臂仿真模型,D435i深度相机与yolov8结合识别|
|2025.03.17-2025.03.23|初步完成视觉机械臂的仿真抓取，目前过于粗糙，有待改进|
# Supplement
|Issue|Debug|
|Conda虚拟环境下libp11-kit.so.0: undefined symbol: ffi_type_pointer...| https://blog.csdn.net/qq_38606680/article/details/129118491 |

# Ros_arm
This is a project about robotic arm. This project is developed on the basis of https://github.com/jiuyewxy/ros_arm_tutorials/tree/noetic-devel.

# Introduction
| Software package              |Content                                               |
| ------------------- | ------------------------------------------------------------ |
| camera_driver         | 相机驱动包                                    |
| yolov8_ros    | YOLOv8检测包                              |
| arm_control  | 机械臂控制包包  |
|  coordinate_transformer    | 坐标转换包 |
| my_robot_description         | 机械臂URDF模型包|
# Development log
| Date |  Task   |
| ---  |  ---     |
|2025.01.14|将需要的包导入，并构建开发框架|

# File directory
ros_ws/                     # ROS工作空间
├── src/                    # 源代码目录
│   ├── camera_driver/      # 相机驱动包
│   │   ├── launch/         # 相机启动文件
│   │   │   └── d435i.launch
│   │   └── config/         # 相机参数配置
│   │       └── realsense.yaml
│   │
│   ├── yolov8_ros/         # YOLOv8检测包
│   │   ├── models/         # 模型文件
│   │   │   └── yolov8n.pt
│   │   ├── scripts/        # Python节点
│   │   │   └── detector.py
│   │   ├── launch/         # 检测启动文件
│   │   ├── msg/            # 自定义消息
│   │   │   └── Detection3D.msg
│   │   └── config/         # 检测参数
│   │       └── yolov8.yaml
│   │
│   ├── arm_control/        # 机械臂控制包
│   │   ├── launch/
│   │   │   └── moveit_control.launch
│   │   ├── config/
│   │   │   ├── kinematics.yaml  # 运动学参数
│   │   │   └── rviz_config.rviz # RViz预设
│   │   └── scripts/
│   │       └── moveit_planner.py
│   │
│   ├── coordinate_transformer/ # 坐标转换包
│   │   ├── src/            # C++节点
│   │   │   └── pointcloud_processor.cpp
│   │   └── include/
│   │
│   ├── my_robot_description/  # 机械臂URDF模型包
│   │   ├── urdf/           # URDF/SRDF文件
│   │   │   └── my_robot.urdf.xacro
│   │   ├── meshes/         # 机械臂3D模型
│   │   └── config/
│   │
│   └── third_party/        # 第三方依赖（可选）
│       ├── realsense-ros/  # git子模块
│       └── moveit/         # 定制化配置
│
├── launch/                 # 全局启动文件
│   └── main.launch         # 总启动文件
│
├── docs/                   # 文档
│   ├── setup_guide.md      # 环境配置指南
│   └── api_reference.md    # 接口说明
│
├── scripts/                # 实用脚本
│   ├── build.sh            # 一键编译脚本
│   └── calibration_tool.py # 手眼标定工具
│
├── test/                   # 测试目录
│   ├── unit_tests/         # 单元测试
│   └── integration_tests/  # 集成测试
│
└── CMakeLists.txt          # 工作空间级编译配置

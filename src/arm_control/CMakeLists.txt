cmake_minimum_required(VERSION 3.0.2)
project(arm_control)

# 查找并加载 catkin 和其他依赖项
find_package(catkin REQUIRED COMPONENTS
  rospy
  moveit_commander
  geometry_msgs
  yolov8_ros
)

# 定义 catkin 包
catkin_package()

# 安装 Python 脚本
catkin_install_python(PROGRAMS
  scripts/visual_grasping.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

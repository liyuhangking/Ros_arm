cmake_minimum_required(VERSION 3.0.2)
project(yolov8_ros)

# 查找并加载 catkin 和其他依赖项
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  sensor_msgs
  cv_bridge
  message_generation
)

# 生成自定义消息
add_message_files(
  FILES
  Detection3D.msg
)

# 生成消息和服务
generate_messages(
  DEPENDENCIES
  std_msgs
)

# 定义 catkin 包
catkin_package(
  CATKIN_DEPENDS
    roscpp
    rospy
    std_msgs
    sensor_msgs
    cv_bridge
    message_runtime
)

# 安装 Python 脚本
catkin_install_python(PROGRAMS
  scripts/detector.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

# 安装 Launch 文件
install(DIRECTORY launch/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
)

# 安装配置文件
install(DIRECTORY config/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/config
)

# 安装模型文件
install(DIRECTORY models/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/models
)

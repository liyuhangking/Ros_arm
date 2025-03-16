cmake_minimum_required(VERSION 3.0.2)
project(my_robot_description)  # 确保这里有 project() 命令

# 查找并加载 catkin 和其他依赖项
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  urdf
  xacro
  tf
  tf2_ros
  rviz
  moveit_core
  moveit_ros_planning
  moveit_ros_planning_interface
)

# 启用 C++11 标准
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 定义 catkin 包
catkin_package(
  CATKIN_DEPENDS
    roscpp
    rospy
    std_msgs
    urdf
    xacro
    tf
    tf2_ros
    rviz
    moveit_core
    moveit_ros_planning
    moveit_ros_planning_interface
)

# 安装 URDF 文件
install(
  DIRECTORY urdf/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/urdf
)

# 安装 Mesh 文件
# install(
#   DIRECTORY meshes/
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/meshes
# )

# 安装 Launch 文件
install(
  DIRECTORY launch/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
)

# 安装 RViz 配置文件
install(
  DIRECTORY config/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/config
)

# 安装脚本文件（如果有）
# install(
#   DIRECTORY scripts/
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/scripts
#   USE_SOURCE_PERMISSIONS
# )

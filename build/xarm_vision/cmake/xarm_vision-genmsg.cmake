# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "xarm_vision: 0 messages, 1 services")

set(MSG_I_FLAGS "-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(xarm_vision_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv" NAME_WE)
add_custom_target(_xarm_vision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "xarm_vision" "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv" "std_msgs/Empty"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(xarm_vision
  "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm_vision
)

### Generating Module File
_generate_module_cpp(xarm_vision
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm_vision
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(xarm_vision_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(xarm_vision_generate_messages xarm_vision_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv" NAME_WE)
add_dependencies(xarm_vision_generate_messages_cpp _xarm_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xarm_vision_gencpp)
add_dependencies(xarm_vision_gencpp xarm_vision_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xarm_vision_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(xarm_vision
  "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm_vision
)

### Generating Module File
_generate_module_eus(xarm_vision
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm_vision
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(xarm_vision_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(xarm_vision_generate_messages xarm_vision_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv" NAME_WE)
add_dependencies(xarm_vision_generate_messages_eus _xarm_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xarm_vision_geneus)
add_dependencies(xarm_vision_geneus xarm_vision_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xarm_vision_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(xarm_vision
  "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm_vision
)

### Generating Module File
_generate_module_lisp(xarm_vision
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm_vision
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(xarm_vision_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(xarm_vision_generate_messages xarm_vision_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv" NAME_WE)
add_dependencies(xarm_vision_generate_messages_lisp _xarm_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xarm_vision_genlisp)
add_dependencies(xarm_vision_genlisp xarm_vision_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xarm_vision_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(xarm_vision
  "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm_vision
)

### Generating Module File
_generate_module_nodejs(xarm_vision
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm_vision
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(xarm_vision_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(xarm_vision_generate_messages xarm_vision_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv" NAME_WE)
add_dependencies(xarm_vision_generate_messages_nodejs _xarm_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xarm_vision_gennodejs)
add_dependencies(xarm_vision_gennodejs xarm_vision_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xarm_vision_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(xarm_vision
  "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm_vision
)

### Generating Module File
_generate_module_py(xarm_vision
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm_vision
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(xarm_vision_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(xarm_vision_generate_messages xarm_vision_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv" NAME_WE)
add_dependencies(xarm_vision_generate_messages_py _xarm_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xarm_vision_genpy)
add_dependencies(xarm_vision_genpy xarm_vision_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xarm_vision_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm_vision
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(xarm_vision_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(xarm_vision_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm_vision
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(xarm_vision_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(xarm_vision_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm_vision
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(xarm_vision_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(xarm_vision_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm_vision
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(xarm_vision_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(xarm_vision_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm_vision)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm_vision\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm_vision
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(xarm_vision_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(xarm_vision_generate_messages_py std_msgs_generate_messages_py)
endif()

# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/liyuhang/Ros_arm/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/liyuhang/Ros_arm/build

# Utility rule file for xarm_vision_generate_messages_cpp.

# Include the progress variables for this target.
include xarm_vision/CMakeFiles/xarm_vision_generate_messages_cpp.dir/progress.make

xarm_vision/CMakeFiles/xarm_vision_generate_messages_cpp: /home/liyuhang/Ros_arm/devel/include/xarm_vision/CallPickPlaceDemo.h


/home/liyuhang/Ros_arm/devel/include/xarm_vision/CallPickPlaceDemo.h: /opt/ros/melodic/lib/gencpp/gen_cpp.py
/home/liyuhang/Ros_arm/devel/include/xarm_vision/CallPickPlaceDemo.h: /home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv
/home/liyuhang/Ros_arm/devel/include/xarm_vision/CallPickPlaceDemo.h: /opt/ros/melodic/share/std_msgs/msg/Empty.msg
/home/liyuhang/Ros_arm/devel/include/xarm_vision/CallPickPlaceDemo.h: /opt/ros/melodic/share/gencpp/msg.h.template
/home/liyuhang/Ros_arm/devel/include/xarm_vision/CallPickPlaceDemo.h: /opt/ros/melodic/share/gencpp/srv.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/liyuhang/Ros_arm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating C++ code from xarm_vision/CallPickPlaceDemo.srv"
	cd /home/liyuhang/Ros_arm/src/xarm_vision && /home/liyuhang/Ros_arm/build/catkin_generated/env_cached.sh /usr/bin/python2 /opt/ros/melodic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/liyuhang/Ros_arm/src/xarm_vision/srv/CallPickPlaceDemo.srv -Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg -Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg -Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg -p xarm_vision -o /home/liyuhang/Ros_arm/devel/include/xarm_vision -e /opt/ros/melodic/share/gencpp/cmake/..

xarm_vision_generate_messages_cpp: xarm_vision/CMakeFiles/xarm_vision_generate_messages_cpp
xarm_vision_generate_messages_cpp: /home/liyuhang/Ros_arm/devel/include/xarm_vision/CallPickPlaceDemo.h
xarm_vision_generate_messages_cpp: xarm_vision/CMakeFiles/xarm_vision_generate_messages_cpp.dir/build.make

.PHONY : xarm_vision_generate_messages_cpp

# Rule to build all files generated by this target.
xarm_vision/CMakeFiles/xarm_vision_generate_messages_cpp.dir/build: xarm_vision_generate_messages_cpp

.PHONY : xarm_vision/CMakeFiles/xarm_vision_generate_messages_cpp.dir/build

xarm_vision/CMakeFiles/xarm_vision_generate_messages_cpp.dir/clean:
	cd /home/liyuhang/Ros_arm/build/xarm_vision && $(CMAKE_COMMAND) -P CMakeFiles/xarm_vision_generate_messages_cpp.dir/cmake_clean.cmake
.PHONY : xarm_vision/CMakeFiles/xarm_vision_generate_messages_cpp.dir/clean

xarm_vision/CMakeFiles/xarm_vision_generate_messages_cpp.dir/depend:
	cd /home/liyuhang/Ros_arm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liyuhang/Ros_arm/src /home/liyuhang/Ros_arm/src/xarm_vision /home/liyuhang/Ros_arm/build /home/liyuhang/Ros_arm/build/xarm_vision /home/liyuhang/Ros_arm/build/xarm_vision/CMakeFiles/xarm_vision_generate_messages_cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : xarm_vision/CMakeFiles/xarm_vision_generate_messages_cpp.dir/depend


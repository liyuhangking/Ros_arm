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

# Utility rule file for xarm_vision_gencfg.

# Include the progress variables for this target.
include xarm_vision/CMakeFiles/xarm_vision_gencfg.dir/progress.make

xarm_vision/CMakeFiles/xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/include/xarm_vision/HSVColorDetectionConfig.h
xarm_vision/CMakeFiles/xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision/cfg/HSVColorDetectionConfig.py
xarm_vision/CMakeFiles/xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/include/xarm_vision/SetTFOffsetConfig.h
xarm_vision/CMakeFiles/xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision/cfg/SetTFOffsetConfig.py


/home/liyuhang/Ros_arm/devel/include/xarm_vision/HSVColorDetectionConfig.h: /home/liyuhang/Ros_arm/src/xarm_vision/cfg/HSVColorDetection.cfg
/home/liyuhang/Ros_arm/devel/include/xarm_vision/HSVColorDetectionConfig.h: /opt/ros/melodic/share/dynamic_reconfigure/templates/ConfigType.py.template
/home/liyuhang/Ros_arm/devel/include/xarm_vision/HSVColorDetectionConfig.h: /opt/ros/melodic/share/dynamic_reconfigure/templates/ConfigType.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/liyuhang/Ros_arm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating dynamic reconfigure files from cfg/HSVColorDetection.cfg: /home/liyuhang/Ros_arm/devel/include/xarm_vision/HSVColorDetectionConfig.h /home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision/cfg/HSVColorDetectionConfig.py"
	cd /home/liyuhang/Ros_arm/build/xarm_vision && ../catkin_generated/env_cached.sh /home/liyuhang/Ros_arm/build/xarm_vision/setup_custom_pythonpath.sh /home/liyuhang/Ros_arm/src/xarm_vision/cfg/HSVColorDetection.cfg /opt/ros/melodic/share/dynamic_reconfigure/cmake/.. /home/liyuhang/Ros_arm/devel/share/xarm_vision /home/liyuhang/Ros_arm/devel/include/xarm_vision /home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision

/home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/HSVColorDetectionConfig.dox: /home/liyuhang/Ros_arm/devel/include/xarm_vision/HSVColorDetectionConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/HSVColorDetectionConfig.dox

/home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/HSVColorDetectionConfig-usage.dox: /home/liyuhang/Ros_arm/devel/include/xarm_vision/HSVColorDetectionConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/HSVColorDetectionConfig-usage.dox

/home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision/cfg/HSVColorDetectionConfig.py: /home/liyuhang/Ros_arm/devel/include/xarm_vision/HSVColorDetectionConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision/cfg/HSVColorDetectionConfig.py

/home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/HSVColorDetectionConfig.wikidoc: /home/liyuhang/Ros_arm/devel/include/xarm_vision/HSVColorDetectionConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/HSVColorDetectionConfig.wikidoc

/home/liyuhang/Ros_arm/devel/include/xarm_vision/SetTFOffsetConfig.h: /home/liyuhang/Ros_arm/src/xarm_vision/cfg/SetTFOffset.cfg
/home/liyuhang/Ros_arm/devel/include/xarm_vision/SetTFOffsetConfig.h: /opt/ros/melodic/share/dynamic_reconfigure/templates/ConfigType.py.template
/home/liyuhang/Ros_arm/devel/include/xarm_vision/SetTFOffsetConfig.h: /opt/ros/melodic/share/dynamic_reconfigure/templates/ConfigType.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/liyuhang/Ros_arm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating dynamic reconfigure files from cfg/SetTFOffset.cfg: /home/liyuhang/Ros_arm/devel/include/xarm_vision/SetTFOffsetConfig.h /home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision/cfg/SetTFOffsetConfig.py"
	cd /home/liyuhang/Ros_arm/build/xarm_vision && ../catkin_generated/env_cached.sh /home/liyuhang/Ros_arm/build/xarm_vision/setup_custom_pythonpath.sh /home/liyuhang/Ros_arm/src/xarm_vision/cfg/SetTFOffset.cfg /opt/ros/melodic/share/dynamic_reconfigure/cmake/.. /home/liyuhang/Ros_arm/devel/share/xarm_vision /home/liyuhang/Ros_arm/devel/include/xarm_vision /home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision

/home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/SetTFOffsetConfig.dox: /home/liyuhang/Ros_arm/devel/include/xarm_vision/SetTFOffsetConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/SetTFOffsetConfig.dox

/home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/SetTFOffsetConfig-usage.dox: /home/liyuhang/Ros_arm/devel/include/xarm_vision/SetTFOffsetConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/SetTFOffsetConfig-usage.dox

/home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision/cfg/SetTFOffsetConfig.py: /home/liyuhang/Ros_arm/devel/include/xarm_vision/SetTFOffsetConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision/cfg/SetTFOffsetConfig.py

/home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/SetTFOffsetConfig.wikidoc: /home/liyuhang/Ros_arm/devel/include/xarm_vision/SetTFOffsetConfig.h
	@$(CMAKE_COMMAND) -E touch_nocreate /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/SetTFOffsetConfig.wikidoc

xarm_vision_gencfg: xarm_vision/CMakeFiles/xarm_vision_gencfg
xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/include/xarm_vision/HSVColorDetectionConfig.h
xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/HSVColorDetectionConfig.dox
xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/HSVColorDetectionConfig-usage.dox
xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision/cfg/HSVColorDetectionConfig.py
xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/HSVColorDetectionConfig.wikidoc
xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/include/xarm_vision/SetTFOffsetConfig.h
xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/SetTFOffsetConfig.dox
xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/SetTFOffsetConfig-usage.dox
xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/lib/python2.7/dist-packages/xarm_vision/cfg/SetTFOffsetConfig.py
xarm_vision_gencfg: /home/liyuhang/Ros_arm/devel/share/xarm_vision/docs/SetTFOffsetConfig.wikidoc
xarm_vision_gencfg: xarm_vision/CMakeFiles/xarm_vision_gencfg.dir/build.make

.PHONY : xarm_vision_gencfg

# Rule to build all files generated by this target.
xarm_vision/CMakeFiles/xarm_vision_gencfg.dir/build: xarm_vision_gencfg

.PHONY : xarm_vision/CMakeFiles/xarm_vision_gencfg.dir/build

xarm_vision/CMakeFiles/xarm_vision_gencfg.dir/clean:
	cd /home/liyuhang/Ros_arm/build/xarm_vision && $(CMAKE_COMMAND) -P CMakeFiles/xarm_vision_gencfg.dir/cmake_clean.cmake
.PHONY : xarm_vision/CMakeFiles/xarm_vision_gencfg.dir/clean

xarm_vision/CMakeFiles/xarm_vision_gencfg.dir/depend:
	cd /home/liyuhang/Ros_arm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liyuhang/Ros_arm/src /home/liyuhang/Ros_arm/src/xarm_vision /home/liyuhang/Ros_arm/build /home/liyuhang/Ros_arm/build/xarm_vision /home/liyuhang/Ros_arm/build/xarm_vision/CMakeFiles/xarm_vision_gencfg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : xarm_vision/CMakeFiles/xarm_vision_gencfg.dir/depend


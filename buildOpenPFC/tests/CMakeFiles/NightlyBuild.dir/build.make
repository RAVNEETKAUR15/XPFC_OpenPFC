# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Core/cmake/3.27.7/bin/cmake

# The command to remove a file.
RM = /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Core/cmake/3.27.7/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/rk015/dev/OpenPFC

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/rk015/dev/buildOpenPFC

# Utility rule file for NightlyBuild.

# Include any custom commands dependencies for this target.
include tests/CMakeFiles/NightlyBuild.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/NightlyBuild.dir/progress.make

tests/CMakeFiles/NightlyBuild:
	cd /home/rk015/dev/buildOpenPFC/tests && /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Core/cmake/3.27.7/bin/ctest -D NightlyBuild

NightlyBuild: tests/CMakeFiles/NightlyBuild
NightlyBuild: tests/CMakeFiles/NightlyBuild.dir/build.make
.PHONY : NightlyBuild

# Rule to build all files generated by this target.
tests/CMakeFiles/NightlyBuild.dir/build: NightlyBuild
.PHONY : tests/CMakeFiles/NightlyBuild.dir/build

tests/CMakeFiles/NightlyBuild.dir/clean:
	cd /home/rk015/dev/buildOpenPFC/tests && $(CMAKE_COMMAND) -P CMakeFiles/NightlyBuild.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/NightlyBuild.dir/clean

tests/CMakeFiles/NightlyBuild.dir/depend:
	cd /home/rk015/dev/buildOpenPFC && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/rk015/dev/OpenPFC /home/rk015/dev/OpenPFC/tests /home/rk015/dev/buildOpenPFC /home/rk015/dev/buildOpenPFC/tests /home/rk015/dev/buildOpenPFC/tests/CMakeFiles/NightlyBuild.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tests/CMakeFiles/NightlyBuild.dir/depend


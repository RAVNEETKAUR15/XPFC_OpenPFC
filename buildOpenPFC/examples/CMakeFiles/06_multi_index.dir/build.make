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

# Include any dependencies generated for this target.
include examples/CMakeFiles/06_multi_index.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/CMakeFiles/06_multi_index.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/06_multi_index.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/06_multi_index.dir/flags.make

examples/CMakeFiles/06_multi_index.dir/06_multi_index.cpp.o: examples/CMakeFiles/06_multi_index.dir/flags.make
examples/CMakeFiles/06_multi_index.dir/06_multi_index.cpp.o: /home/rk015/dev/OpenPFC/examples/06_multi_index.cpp
examples/CMakeFiles/06_multi_index.dir/06_multi_index.cpp.o: examples/CMakeFiles/06_multi_index.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/rk015/dev/buildOpenPFC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/06_multi_index.dir/06_multi_index.cpp.o"
	cd /home/rk015/dev/buildOpenPFC/examples && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/CMakeFiles/06_multi_index.dir/06_multi_index.cpp.o -MF CMakeFiles/06_multi_index.dir/06_multi_index.cpp.o.d -o CMakeFiles/06_multi_index.dir/06_multi_index.cpp.o -c /home/rk015/dev/OpenPFC/examples/06_multi_index.cpp

examples/CMakeFiles/06_multi_index.dir/06_multi_index.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/06_multi_index.dir/06_multi_index.cpp.i"
	cd /home/rk015/dev/buildOpenPFC/examples && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/rk015/dev/OpenPFC/examples/06_multi_index.cpp > CMakeFiles/06_multi_index.dir/06_multi_index.cpp.i

examples/CMakeFiles/06_multi_index.dir/06_multi_index.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/06_multi_index.dir/06_multi_index.cpp.s"
	cd /home/rk015/dev/buildOpenPFC/examples && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/rk015/dev/OpenPFC/examples/06_multi_index.cpp -o CMakeFiles/06_multi_index.dir/06_multi_index.cpp.s

# Object files for target 06_multi_index
06_multi_index_OBJECTS = \
"CMakeFiles/06_multi_index.dir/06_multi_index.cpp.o"

# External object files for target 06_multi_index
06_multi_index_EXTERNAL_OBJECTS =

examples/06_multi_index: examples/CMakeFiles/06_multi_index.dir/06_multi_index.cpp.o
examples/06_multi_index: examples/CMakeFiles/06_multi_index.dir/build.make
examples/06_multi_index: /home/rk015/dev/opt/heffte/2.4/lib64/libheffte.so.2.4.1
examples/06_multi_index: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3_omp.so
examples/06_multi_index: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3f_omp.so
examples/06_multi_index: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3.so
examples/06_multi_index: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3f.so
examples/06_multi_index: /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/lib/gcc/x86_64-pc-linux-gnu/12/libgomp.so
examples/06_multi_index: /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/lib64/libpthread.a
examples/06_multi_index: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/lib/libmpi_cxx.so
examples/06_multi_index: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/lib/libmpi.so
examples/06_multi_index: examples/CMakeFiles/06_multi_index.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/rk015/dev/buildOpenPFC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable 06_multi_index"
	cd /home/rk015/dev/buildOpenPFC/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/06_multi_index.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/06_multi_index.dir/build: examples/06_multi_index
.PHONY : examples/CMakeFiles/06_multi_index.dir/build

examples/CMakeFiles/06_multi_index.dir/clean:
	cd /home/rk015/dev/buildOpenPFC/examples && $(CMAKE_COMMAND) -P CMakeFiles/06_multi_index.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/06_multi_index.dir/clean

examples/CMakeFiles/06_multi_index.dir/depend:
	cd /home/rk015/dev/buildOpenPFC && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/rk015/dev/OpenPFC /home/rk015/dev/OpenPFC/examples /home/rk015/dev/buildOpenPFC /home/rk015/dev/buildOpenPFC/examples /home/rk015/dev/buildOpenPFC/examples/CMakeFiles/06_multi_index.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : examples/CMakeFiles/06_multi_index.dir/depend


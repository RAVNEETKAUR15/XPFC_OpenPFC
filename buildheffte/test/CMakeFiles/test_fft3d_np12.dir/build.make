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
CMAKE_SOURCE_DIR = /home/rk015/dev/heffte

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/rk015/dev/buildheffte

# Include any dependencies generated for this target.
include test/CMakeFiles/test_fft3d_np12.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/test_fft3d_np12.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/test_fft3d_np12.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/test_fft3d_np12.dir/flags.make

test/CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.o: test/CMakeFiles/test_fft3d_np12.dir/flags.make
test/CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.o: /home/rk015/dev/heffte/test/test_fft3d_np12.cpp
test/CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.o: test/CMakeFiles/test_fft3d_np12.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/rk015/dev/buildheffte/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.o"
	cd /home/rk015/dev/buildheffte/test && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.o -MF CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.o.d -o CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.o -c /home/rk015/dev/heffte/test/test_fft3d_np12.cpp

test/CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.i"
	cd /home/rk015/dev/buildheffte/test && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/rk015/dev/heffte/test/test_fft3d_np12.cpp > CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.i

test/CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.s"
	cd /home/rk015/dev/buildheffte/test && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/rk015/dev/heffte/test/test_fft3d_np12.cpp -o CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.s

# Object files for target test_fft3d_np12
test_fft3d_np12_OBJECTS = \
"CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.o"

# External object files for target test_fft3d_np12
test_fft3d_np12_EXTERNAL_OBJECTS =

test/test_fft3d_np12: test/CMakeFiles/test_fft3d_np12.dir/test_fft3d_np12.cpp.o
test/test_fft3d_np12: test/CMakeFiles/test_fft3d_np12.dir/build.make
test/test_fft3d_np12: libheffte.so.2.4.1
test/test_fft3d_np12: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/lib/libmpi_cxx.so
test/test_fft3d_np12: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/lib/libmpi.so
test/test_fft3d_np12: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3_omp.so
test/test_fft3d_np12: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3f_omp.so
test/test_fft3d_np12: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3.so
test/test_fft3d_np12: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3f.so
test/test_fft3d_np12: /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/lib/gcc/x86_64-pc-linux-gnu/12/libgomp.so
test/test_fft3d_np12: /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/lib64/libpthread.a
test/test_fft3d_np12: test/CMakeFiles/test_fft3d_np12.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/rk015/dev/buildheffte/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_fft3d_np12"
	cd /home/rk015/dev/buildheffte/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_fft3d_np12.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/test_fft3d_np12.dir/build: test/test_fft3d_np12
.PHONY : test/CMakeFiles/test_fft3d_np12.dir/build

test/CMakeFiles/test_fft3d_np12.dir/clean:
	cd /home/rk015/dev/buildheffte/test && $(CMAKE_COMMAND) -P CMakeFiles/test_fft3d_np12.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/test_fft3d_np12.dir/clean

test/CMakeFiles/test_fft3d_np12.dir/depend:
	cd /home/rk015/dev/buildheffte && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/rk015/dev/heffte /home/rk015/dev/heffte/test /home/rk015/dev/buildheffte /home/rk015/dev/buildheffte/test /home/rk015/dev/buildheffte/test/CMakeFiles/test_fft3d_np12.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/test_fft3d_np12.dir/depend

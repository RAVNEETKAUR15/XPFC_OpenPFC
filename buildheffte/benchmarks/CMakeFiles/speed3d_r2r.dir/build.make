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
include benchmarks/CMakeFiles/speed3d_r2r.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include benchmarks/CMakeFiles/speed3d_r2r.dir/compiler_depend.make

# Include the progress variables for this target.
include benchmarks/CMakeFiles/speed3d_r2r.dir/progress.make

# Include the compile flags for this target's objects.
include benchmarks/CMakeFiles/speed3d_r2r.dir/flags.make

benchmarks/CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.o: benchmarks/CMakeFiles/speed3d_r2r.dir/flags.make
benchmarks/CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.o: /home/rk015/dev/heffte/benchmarks/speed3d_r2r.cpp
benchmarks/CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.o: benchmarks/CMakeFiles/speed3d_r2r.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/rk015/dev/buildheffte/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object benchmarks/CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.o"
	cd /home/rk015/dev/buildheffte/benchmarks && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT benchmarks/CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.o -MF CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.o.d -o CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.o -c /home/rk015/dev/heffte/benchmarks/speed3d_r2r.cpp

benchmarks/CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.i"
	cd /home/rk015/dev/buildheffte/benchmarks && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/rk015/dev/heffte/benchmarks/speed3d_r2r.cpp > CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.i

benchmarks/CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.s"
	cd /home/rk015/dev/buildheffte/benchmarks && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/rk015/dev/heffte/benchmarks/speed3d_r2r.cpp -o CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.s

# Object files for target speed3d_r2r
speed3d_r2r_OBJECTS = \
"CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.o"

# External object files for target speed3d_r2r
speed3d_r2r_EXTERNAL_OBJECTS =

benchmarks/speed3d_r2r: benchmarks/CMakeFiles/speed3d_r2r.dir/speed3d_r2r.cpp.o
benchmarks/speed3d_r2r: benchmarks/CMakeFiles/speed3d_r2r.dir/build.make
benchmarks/speed3d_r2r: libheffte.so.2.4.1
benchmarks/speed3d_r2r: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/lib/libmpi_cxx.so
benchmarks/speed3d_r2r: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/lib/libmpi.so
benchmarks/speed3d_r2r: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3_omp.so
benchmarks/speed3d_r2r: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3f_omp.so
benchmarks/speed3d_r2r: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3.so
benchmarks/speed3d_r2r: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3f.so
benchmarks/speed3d_r2r: /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/lib/gcc/x86_64-pc-linux-gnu/12/libgomp.so
benchmarks/speed3d_r2r: /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/lib64/libpthread.a
benchmarks/speed3d_r2r: benchmarks/CMakeFiles/speed3d_r2r.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/rk015/dev/buildheffte/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable speed3d_r2r"
	cd /home/rk015/dev/buildheffte/benchmarks && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/speed3d_r2r.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
benchmarks/CMakeFiles/speed3d_r2r.dir/build: benchmarks/speed3d_r2r
.PHONY : benchmarks/CMakeFiles/speed3d_r2r.dir/build

benchmarks/CMakeFiles/speed3d_r2r.dir/clean:
	cd /home/rk015/dev/buildheffte/benchmarks && $(CMAKE_COMMAND) -P CMakeFiles/speed3d_r2r.dir/cmake_clean.cmake
.PHONY : benchmarks/CMakeFiles/speed3d_r2r.dir/clean

benchmarks/CMakeFiles/speed3d_r2r.dir/depend:
	cd /home/rk015/dev/buildheffte && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/rk015/dev/heffte /home/rk015/dev/heffte/benchmarks /home/rk015/dev/buildheffte /home/rk015/dev/buildheffte/benchmarks /home/rk015/dev/buildheffte/benchmarks/CMakeFiles/speed3d_r2r.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : benchmarks/CMakeFiles/speed3d_r2r.dir/depend


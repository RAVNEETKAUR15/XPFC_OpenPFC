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
include examples/CMakeFiles/mpi_worker.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/CMakeFiles/mpi_worker.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/mpi_worker.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/mpi_worker.dir/flags.make

examples/CMakeFiles/mpi_worker.dir/mpi_worker.cpp.o: examples/CMakeFiles/mpi_worker.dir/flags.make
examples/CMakeFiles/mpi_worker.dir/mpi_worker.cpp.o: /home/rk015/dev/OpenPFC/examples/mpi_worker.cpp
examples/CMakeFiles/mpi_worker.dir/mpi_worker.cpp.o: examples/CMakeFiles/mpi_worker.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/rk015/dev/buildOpenPFC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/mpi_worker.dir/mpi_worker.cpp.o"
	cd /home/rk015/dev/buildOpenPFC/examples && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/CMakeFiles/mpi_worker.dir/mpi_worker.cpp.o -MF CMakeFiles/mpi_worker.dir/mpi_worker.cpp.o.d -o CMakeFiles/mpi_worker.dir/mpi_worker.cpp.o -c /home/rk015/dev/OpenPFC/examples/mpi_worker.cpp

examples/CMakeFiles/mpi_worker.dir/mpi_worker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/mpi_worker.dir/mpi_worker.cpp.i"
	cd /home/rk015/dev/buildOpenPFC/examples && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/rk015/dev/OpenPFC/examples/mpi_worker.cpp > CMakeFiles/mpi_worker.dir/mpi_worker.cpp.i

examples/CMakeFiles/mpi_worker.dir/mpi_worker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/mpi_worker.dir/mpi_worker.cpp.s"
	cd /home/rk015/dev/buildOpenPFC/examples && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/rk015/dev/OpenPFC/examples/mpi_worker.cpp -o CMakeFiles/mpi_worker.dir/mpi_worker.cpp.s

# Object files for target mpi_worker
mpi_worker_OBJECTS = \
"CMakeFiles/mpi_worker.dir/mpi_worker.cpp.o"

# External object files for target mpi_worker
mpi_worker_EXTERNAL_OBJECTS =

examples/mpi_worker: examples/CMakeFiles/mpi_worker.dir/mpi_worker.cpp.o
examples/mpi_worker: examples/CMakeFiles/mpi_worker.dir/build.make
examples/mpi_worker: /home/rk015/dev/opt/heffte/2.4/lib64/libheffte.so.2.4.1
examples/mpi_worker: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3_omp.so
examples/mpi_worker: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3f_omp.so
examples/mpi_worker: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3.so
examples/mpi_worker: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3f.so
examples/mpi_worker: /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/lib/gcc/x86_64-pc-linux-gnu/12/libgomp.so
examples/mpi_worker: /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/lib64/libpthread.a
examples/mpi_worker: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/lib/libmpi_cxx.so
examples/mpi_worker: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/lib/libmpi.so
examples/mpi_worker: examples/CMakeFiles/mpi_worker.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/rk015/dev/buildOpenPFC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable mpi_worker"
	cd /home/rk015/dev/buildOpenPFC/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mpi_worker.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/mpi_worker.dir/build: examples/mpi_worker
.PHONY : examples/CMakeFiles/mpi_worker.dir/build

examples/CMakeFiles/mpi_worker.dir/clean:
	cd /home/rk015/dev/buildOpenPFC/examples && $(CMAKE_COMMAND) -P CMakeFiles/mpi_worker.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/mpi_worker.dir/clean

examples/CMakeFiles/mpi_worker.dir/depend:
	cd /home/rk015/dev/buildOpenPFC && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/rk015/dev/OpenPFC /home/rk015/dev/OpenPFC/examples /home/rk015/dev/buildOpenPFC /home/rk015/dev/buildOpenPFC/examples /home/rk015/dev/buildOpenPFC/examples/CMakeFiles/mpi_worker.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : examples/CMakeFiles/mpi_worker.dir/depend


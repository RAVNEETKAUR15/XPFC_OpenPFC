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
include examples/CMakeFiles/02_domain_decomposition.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/CMakeFiles/02_domain_decomposition.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/02_domain_decomposition.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/02_domain_decomposition.dir/flags.make

examples/CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.o: examples/CMakeFiles/02_domain_decomposition.dir/flags.make
examples/CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.o: /home/rk015/dev/OpenPFC/examples/02_domain_decomposition.cpp
examples/CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.o: examples/CMakeFiles/02_domain_decomposition.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/rk015/dev/buildOpenPFC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.o"
	cd /home/rk015/dev/buildOpenPFC/examples && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.o -MF CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.o.d -o CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.o -c /home/rk015/dev/OpenPFC/examples/02_domain_decomposition.cpp

examples/CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.i"
	cd /home/rk015/dev/buildOpenPFC/examples && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/rk015/dev/OpenPFC/examples/02_domain_decomposition.cpp > CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.i

examples/CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.s"
	cd /home/rk015/dev/buildOpenPFC/examples && /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/rk015/dev/OpenPFC/examples/02_domain_decomposition.cpp -o CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.s

# Object files for target 02_domain_decomposition
02_domain_decomposition_OBJECTS = \
"CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.o"

# External object files for target 02_domain_decomposition
02_domain_decomposition_EXTERNAL_OBJECTS =

examples/02_domain_decomposition: examples/CMakeFiles/02_domain_decomposition.dir/02_domain_decomposition.cpp.o
examples/02_domain_decomposition: examples/CMakeFiles/02_domain_decomposition.dir/build.make
examples/02_domain_decomposition: /home/rk015/dev/opt/heffte/2.4/lib64/libheffte.so.2.4.1
examples/02_domain_decomposition: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3_omp.so
examples/02_domain_decomposition: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3f_omp.so
examples/02_domain_decomposition: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3.so
examples/02_domain_decomposition: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/fftw/3.3.10/lib/libfftw3f.so
examples/02_domain_decomposition: /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/lib/gcc/x86_64-pc-linux-gnu/12/libgomp.so
examples/02_domain_decomposition: /cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/lib64/libpthread.a
examples/02_domain_decomposition: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/lib/libmpi_cxx.so
examples/02_domain_decomposition: /cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/lib/libmpi.so
examples/02_domain_decomposition: examples/CMakeFiles/02_domain_decomposition.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/rk015/dev/buildOpenPFC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable 02_domain_decomposition"
	cd /home/rk015/dev/buildOpenPFC/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/02_domain_decomposition.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/02_domain_decomposition.dir/build: examples/02_domain_decomposition
.PHONY : examples/CMakeFiles/02_domain_decomposition.dir/build

examples/CMakeFiles/02_domain_decomposition.dir/clean:
	cd /home/rk015/dev/buildOpenPFC/examples && $(CMAKE_COMMAND) -P CMakeFiles/02_domain_decomposition.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/02_domain_decomposition.dir/clean

examples/CMakeFiles/02_domain_decomposition.dir/depend:
	cd /home/rk015/dev/buildOpenPFC && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/rk015/dev/OpenPFC /home/rk015/dev/OpenPFC/examples /home/rk015/dev/buildOpenPFC /home/rk015/dev/buildOpenPFC/examples /home/rk015/dev/buildOpenPFC/examples/CMakeFiles/02_domain_decomposition.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : examples/CMakeFiles/02_domain_decomposition.dir/depend


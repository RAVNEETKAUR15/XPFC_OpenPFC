
# the -e options means "quit on the first encountered error"
set -e

mkdir -p heffte_post_install_test
cd heffte_post_install_test

rm -f CMakeCache.txt

heffte_mpic_compiler=""
heffte_mpif_compiler=""
if [[ ! -z "" ]]; then
    heffte_mpic_compiler="-DMPI_C_COMPILER="
fi
if [[ ! -z "" ]]; then
    heffte_mpif_compiler="-DMPI_Fortran_COMPILER="
fi

/cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Core/cmake/3.27.7/bin/cmake \
    -DCMAKE_CXX_COMPILER=/cvmfs/soft.computecanada.ca/gentoo/2023/x86-64-v3/usr/x86_64-pc-linux-gnu/gcc-bin/12/c++ \
    -DCMAKE_CXX_FLAGS="" \
    -DHeffte_DIR=/home/rk015/dev/opt/heffte/2.4/lib64/cmake/Heffte \
    -DMPI_CXX_COMPILER="/cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/bin/mpicxx" \
    -DMPIEXEC_EXECUTABLE="/cvmfs/soft.computecanada.ca/easybuild/software/2023/x86-64-v3/Compiler/gcc12/openmpi/4.1.5/bin/mpiexec" \
    $heffte_mpic_compiler \
    $heffte_mpif_compiler \
    -DMPIEXEC_NUMPROC_FLAG="-n" \
    -DMPIEXEC_PREFLAGS="" \
    -DMPIEXEC_POSTFLAGS="" \
    /home/rk015/dev/opt/heffte/2.4/share/heffte/testing/

make -j4
ctest -V

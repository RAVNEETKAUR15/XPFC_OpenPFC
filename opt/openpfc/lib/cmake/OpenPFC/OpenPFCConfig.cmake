
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was OpenPFCConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

####################################################################################

if (NOT TARGET MPI::MPI_CXX)
    find_package(MPI REQUIRED)
endif()

if (NOT TARGET Heffte::Heffte)
    find_package(Heffte REQUIRED PATHS /home/rk015/dev/opt/heffte/2.4/lib64/cmake/Heffte)
endif()

include ( "${CMAKE_CURRENT_LIST_DIR}/OpenPFCTargets.cmake" )

message(STATUS "Found OpenPFC: /home/rk015/dev/opt/openpfc (found version 0.1.0)")

if(EXISTS "/home/rk015/dev/buildOpenPFC/apps/aluminumNew/aluminumTest_tests-b12d07c.cmake")
  include("/home/rk015/dev/buildOpenPFC/apps/aluminumNew/aluminumTest_tests-b12d07c.cmake")
else()
  add_test(aluminumTest_NOT_BUILT-b12d07c aluminumTest_NOT_BUILT-b12d07c)
endif()
add_executable(
  beacon_test
  beacon_test.cpp
)

target_link_libraries(
  beacon_test
  GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(beacon_test)


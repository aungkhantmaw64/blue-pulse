add_executable(
  mqtt_handler_test
  mqtt_handler_test.cpp
)

target_link_libraries(
  mqtt_handler_test
  GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(mqtt_handler_test)


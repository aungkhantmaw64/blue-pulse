#include <gtest/gtest.h>

// Demonstrate some basic assertions.
TEST(MqttHandler, BasicAssertions) {
  // Expect two strings not to be equal.
  EXPECT_STRNE("hello", "world");
  // Expect equality.
  if (1)
    ;
  EXPECT_EQ(1, 1);
}

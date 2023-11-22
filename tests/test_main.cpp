#include "gtest/gtest.h"

TEST(test1, test0)
{
    ASSERT_EQ(1 + 2, 3);
}

int main(int argc, char** argv)
{
    printf("Running main() from %s\n", __FILE__);
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
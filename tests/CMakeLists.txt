add_executable(test_main test_main.cpp)

find_package(GTest CONFIG REQUIRED)
target_link_libraries(test_main PRIVATE GTest::gtest GTest::gtest_main GTest::gmock GTest::gmock_main)

add_test(
    NAME AllTestsInMain
    COMMAND test_main)
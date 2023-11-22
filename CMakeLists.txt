cmake_minimum_required(VERSION 3.18 FATAL_ERROR)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic")
endif()

# cxx standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# project
project(hello-world LANGUAGES CXX)

# cmake module path
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

# trdparty dir
set(PROJECT_TRDPARTY_DIR "${PROJECT_SOURCE_DIR}/3rd_party")

message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")
message(STATUS "CXX flags: ${CMAKE_CXX_FLAGS}")

# options
option(ENABLE_CLANG_TIDY "Enable clang-tidy" OFF)
option(ENABLE_CLANG_FORMAT "Enable clang-format" OFF)
option(BUILD_TESTS "Build tests" OFF)
option(ENABLE_SANITIZER "Enable sanitizer" OFF)

# sanitizer
if(ENABLE_SANITIZER)
    include(${PROJECT_SOURCE_DIR}/cmake/sanitizer.cmake)
endif()

# clang-tidy
if(ENABLE_CLANG_TIDY)
 set(CMAKE_CXX_CLANG_TIDY clang-tidy --config-file=${PROJECT_SOURCE_DIR}/.clang-tidy)
endif()

# clang-format
if(ENABLE_CLANG_FORMAT)
    include(${PROJECT_SOURCE_DIR}/cmake/clang-format.cmake)
endif()

# Configure CCache if available
find_program(CCACHE_FOUND ccache)

if(CCACHE_FOUND)
   set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
   set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
endif(CCACHE_FOUND)

# add subdirectory
add_subdirectory(src)

# tests
if(BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()
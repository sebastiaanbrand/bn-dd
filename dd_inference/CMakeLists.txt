cmake_minimum_required(VERSION 3.1)

project(BayesianNetworkInferenceDDs)

# use included version of Sylvan, not installed version
include_directories(. ../lib/sylvan-1.6.1/src/)

add_executable(bn-test bn-test.cpp wpbdd_inference.cpp)
target_link_libraries(bn-test ${CMAKE_SOURCE_DIR}/../lib/sylvan-1.6.1/build/src/libsylvan.so)


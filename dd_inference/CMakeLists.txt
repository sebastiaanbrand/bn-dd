cmake_minimum_required(VERSION 3.1)

project(BayesianNetworkInferenceDDs)

# use included version of Sylvan, not installed version
include_directories(. ../lib/sylvan-1.6.1/src/)

add_executable(test_inference test_inference.cpp wpbdd_inference.cpp)
target_link_libraries(test_inference ${CMAKE_SOURCE_DIR}/../lib/sylvan-1.6.1/build/src/libsylvan.so)
add_test(test_inference test_inference)

add_executable(analyze_bn analyze_bn.cpp wpbdd_inference.cpp)
target_link_libraries(analyze_bn ${CMAKE_SOURCE_DIR}/../lib/sylvan-1.6.1/build/src/libsylvan.so)




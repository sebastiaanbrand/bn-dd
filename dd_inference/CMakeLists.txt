cmake_minimum_required(VERSION 3.1)

project(BayesianNetworkInferenceDDs)

# use included version of Sylvan, not installed version
include_directories(. ../extern/sylvan/src/)

add_executable(test_inference test_inference.cpp wpbdd_inference.cpp)
target_link_libraries(test_inference ${CMAKE_SOURCE_DIR}/../extern/sylvan/build/src/libsylvan.so)
add_test(test_inference test_inference)

add_executable(analyze_bn analyze_bn.cpp wpbdd_inference.cpp)
target_link_libraries(analyze_bn ${CMAKE_SOURCE_DIR}/../extern/sylvan/build/src/libsylvan.so)




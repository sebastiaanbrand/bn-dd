#!/bin/bash

# script to compile sources on EDD machine (manually configures GMP dirs)

while getopts "r" opt; do
  case $opt in
    r) recompile=true
    ;;
    \?) echo "Invalid option -$OPTARG" >&1; exit 1;
    ;;
  esac
done

# (re)compile Sylvan (don't build in extern folder)
cd dd_inference
if [[ $recompile ]]; then rm -r -f sylvan_build; fi
mkdir -p sylvan_build
cd sylvan_build
cmake -DGMP_INCLUDE_DIR=../../include -DGMP_LIBRARIES=/usr/lib64/libgmp.so.10.3.2 ../../extern/sylvan
make
cd ../..

# (re)compile BN code
cd dd_inference
if [[ $recompile ]]; then rm -r -f build; fi
mkdir -p build
cd build
cmake ..
make
cd ../..


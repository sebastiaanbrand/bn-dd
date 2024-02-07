#!/bin/bash

export CC=/usr/bin/gcc-10
export CXX=/usr/bin/g++-10

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
cmake ../../extern/sylvan
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


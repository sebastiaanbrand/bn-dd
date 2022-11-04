#!/bin/bash

while getopts "r" opt; do
  case $opt in
    r) recompile=true
    ;;
    \?) echo "Invalid option -$OPTARG" >&1; exit 1;
    ;;
  esac
done

# (re)compile Sylvan
cd extern/sylvan
if [[ $recompile ]]; then rm -r -f build; fi
mkdir -p build
cd build
cmake ..
make
cd ../../..

# (re)compile BN code
cd dd_inference
if [[ $recompile ]]; then rm -r -f build; fi
mkdir -p build
cd build
cmake ..
make
cd ../..


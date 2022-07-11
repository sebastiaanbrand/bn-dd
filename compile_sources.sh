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
cd sylvan-1.6.1
if [[ $recompile ]]; then rm -r -f build; fi
mkdir -p build
cd build
cmake ..
make
cd ..
cd ..

# (re)compile BN code
cd src
if [[ $recompile ]]; then rm -r -f build; fi
mkdir -p build
cd build
cmake ..
make
cd ..
cd ..

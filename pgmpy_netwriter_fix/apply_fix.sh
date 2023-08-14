#!/bin/bash

# Script to (try to) automatically apply the fixed version of NET.py in pgmpy.
# (should be in .venv/lib/python3.10/site-packages/pgmpy/readwrite/NET.py)

NETpy_path=$(find .venv/ -name 'NET.py')

# create backup of old file
cp $NETpy_path ${NETpy_path}.bak

# overwrite with patched file
cp pgmpy_netwriter_fix/NET.py $NETpy_path

echo Overwriting $NETpy_path with pgmpy_netwriter_fix/NET.py

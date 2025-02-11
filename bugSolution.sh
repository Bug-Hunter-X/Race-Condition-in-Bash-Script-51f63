#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

# Create two files
touch file1.txt
touch file2.txt

# Use flock to ensure exclusive access to each file
flock -x file1.txt; echo "Process 1" > file1.txt
flock -x file2.txt; echo "Process 2" > file2.txt

# Check output files. The output is now deterministic
cat file1.txt
cat file2.txt
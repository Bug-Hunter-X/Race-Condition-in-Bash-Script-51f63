#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes simultaneously.  Each process attempts to write a unique string to file1 and file2
# Note that file descriptors are not closed
(echo "Process 1" > file1.txt & pid1=$!) 
(echo "Process 2" > file2.txt & pid2=$!)

# Wait for both processes to finish
wait $pid1 $pid2

# Check output files.  Sometimes both processes write their string to the same file, other times only one process writes to each file
cat file1.txt
cat file2.txt
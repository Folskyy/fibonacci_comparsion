#!/bin/bash
# Compile, run and comparsion between recursive and iterative fibonacci algorithm in C language

# file existence
out_file="output/results.csv"

if [ ! -f "$out_file" ]; then
	echo "Execution time." > "$out_file"
else
	> "$out_file"
fi

# compile
if gcc recursive_fib.c -o output/recursive_fib.out; then
	echo "recursive_fib.c has been compiled."
else
	echo "Cannot compile recursive_fib.c."
	exit 1
fi

if gcc iterative_fib.c -o output/iterative_fib.out; then
	echo "iterative_fib.c has been compiled."
else
	echo "Cannot compile iterative_fib.c."
	exit 1
fi


echo "Iterative fibonacci: " >> "$out_file"
./output/recursive_fib.out 60

echo "Recursive fibonacci: " >> "$out_file"
./output/recursive_fib.out 60

# if ./output/recursive_fib.out; then
# 	echo "recursive_fib.out has been executed."
# else
# 	echo "Cannot run recursive_fib.out."
#	exit 1

#if ./output/iterative_fib.out; then
#	echo "iterative_fib.out has been executed."
#else
#	echo "Cannot run iterative_fib.out."
#	exit 1


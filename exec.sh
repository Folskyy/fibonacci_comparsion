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

echo ">Type the Fibonacci's number you want to calculate:"
read n

echo "Iterative fibonacci: " >> "$out_file"
echo "itertive_fib running..."

if ./output/iterative_fib.out "$n"; then
	echo "Succefully executed."
else
	echo "Unable to execute."
	exit 1
fi


echo "Recursive fibonacci: " >> "$out_file"
echo "recursive_fib running..."

if ./output/recursive_fib.out "$n"; then
	echo "Succefully executed."
else
	echo "Unable to execute."
	exit 1
fi

	echo -e "\n\n----------RESULTS----------"
cat output/results.csv


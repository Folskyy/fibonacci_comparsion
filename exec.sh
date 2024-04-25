#!/bin/bash
# Compile, run and comparsion between recursive and iterative fibonacci algorithm in C language

# file existence
out_file="output/results.csv"
number=30

if [ ! -f "$out_file" ]; then
	touch "$out_file"
	echo "algorithm_name,number,time" > "$out_file"
fi


# compile recursive file
if gcc recursive_fib.c -o output/recursive_fib.out; then
	echo "recursive_fib.c has been compiled."
else
	echo "Cannot compile recursive_fib.c."
	exit 1
fi

# compile iterative file
if gcc iterative_fib.c -o output/iterative_fib.out; then
	echo "iterative_fib.c has been compiled."
else
	echo "Cannot compile iterative_fib.c."
	exit 1
fi

# run recursive file
for ((i=1; i<number; i++))
do
	echo "recursive_fib($i) running..."

	if ./output/recursive_fib.out "$i"; then
		echo "Succefully executed."
	else
		echo "Unable to execute."
		exit 1
	fi
done

# run iterative file
for ((i=1; i<number; i++))
do
	echo "itertive_fib($i) running..."

	if ./output/iterative_fib.out "$i"; then
		echo "Succefully executed."
	else
		echo "Unable to execute."
		exit 1
	fi
done

echo -e "\n\n----------RESULTS----------"
cat output/results.csv


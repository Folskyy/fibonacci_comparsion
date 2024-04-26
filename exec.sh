#!/bin/bash
# Compile, run and comparsion between recursive and iterative fibonacci algorithm in C language

out_file="output/results.csv"
number=30

# file existence check
if [ ! -f "$out_file" ]; then
	touch "$out_file"
	echo "algorithm_name,number,time" > "$out_file"
fi


# compile recursive C file
if gcc recursive_fib.c -o output/recursive_fib.out; then
	echo "recursive_fib.c has been compiled."
else
	echo "Cannot compile recursive_fib.c."
	exit 1
fi

# compile iterative C file
if gcc iterative_fib.c -o output/iterative_fib.out; then
	echo "iterative_fib.c has been compiled."
else
	echo "Cannot compile iterative_fib.c."
	exit 1
fi

# run the recursive Fibonacci program $number times
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

# run the iterative Fibonacci program $number times
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

# show the results obtained
echo -e "\n\n----------RESULTS----------"
cat output/results.csv

# run the python file to create, show and save a graph
echo -e "\n\n\nCreating a graph..."

if python3 graph.py; then
	echo "Program succefully finished."
else
	echo "Unable to execute."
fi

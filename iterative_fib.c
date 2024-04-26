#include<stdio.h>
#include<stdlib.h>
#include<time.h>

/// @brief Iterative Fibonacci's function
/// @param n Fibonacci's number to calculate
/// @return nst number from FIbonacci's sequence
int fibonacci(int n){
	if(n <= 0)
		return 0;	
	else if(n == 1)
		return 1;

	int n1 = 1, n2 = 0, n0 = 2;

	for(int i = 2; i <= n; i++){
		n0 = n1 + n2;
		n2 = n1;
		n1 = n0;
	}

	return n0;
}

/// @brief Run fibonacci's algorithm and count the execution time
/// @param argc number of arguments given on program's input
/// @param argv vector w all the arguments obtained on program's input
/// @return algorithm's name, run time and param used
int main(int argc, char *argv[]){
	if(argc <= 1 && argc > 2){ // program need just one argument to run
		printf("Invalid param\n");
		return 0;
	}

	int n = atoi(argv[1]); // conversion char to int

	clock_t start_t = clock();

	fibonacci(n);

	clock_t end_t = clock();

	// calculate the time taken and converte clocks per sec to seconds
	long double time_taken = ((long double)(end_t - start_t)) / CLOCKS_PER_SEC;

	FILE *file;
	file = fopen("output/results.csv", "a");

	if(file == NULL){
		printf("Cannot open the file.\n");
		return 0;
	}

	fprintf(file, "iterative,%d,%Lf\n", n, time_taken); // CSV format: algorithm_name, fibonacci_number, time_taken
	
	fclose(file);

	return 0;
}

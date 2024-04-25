#include<stdio.h>
#include<stdlib.h>
#include<time.h>

/// @brief Recursive Fibonacci's function
/// @param n Fibonacci's number to calculate
/// @return nst number from FIbonacci's sequence
int fibonacci(int n){
	if(n <= 0)
		return 0;
	else if(n == 1)
		return 1;

	return (fibonacci(n - 1) + fibonacci(n - 2));
}
/// @brief Run fibonacci's algorithm and count the execution time
/// @param argc 
/// @param argv 
/// @return algorithm's name, run time and param used
int main(int argc, char *argv[]){
	if(argc <= 1){
		printf("Invalid param\n");
		return 0;
	}
	
	int n = atoi(argv[1]);

	clock_t start_t = clock();

	fibonacci(n);

	clock_t end_t = clock();

	double time_taken = ((long double)(end_t - start_t)) / CLOCKS_PER_SEC;

	FILE *file;
	file = fopen("output/results.csv", "a");

	if(file	== NULL){
		printf("Cannot open the file.\n");
		return 0;
	}

	fprintf(file, "recursive,%d,%lf\n", n, time_taken);

	fclose(file);
	
	return 0;
}

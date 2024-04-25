#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int fibonacci(int n){
	if(n <= 0)
		return 0;
	else if(n == 1)
		return 1;

	return (fibonacci(n - 1) + fibonacci(n - 2));
}

int main(int argc, char *argv[]){
	int n = atoi(argv[1]);

	clock_t start_t = clock();

	fibonacci(n);

	clock_t end_t = clock();

	double time_taken = ((double)(end_t - start_t)) / CLOCKS_PER_SEC;

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

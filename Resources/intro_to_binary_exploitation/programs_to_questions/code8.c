#include<stdio.h>

unsigned long int factorial_rec(int n);
unsigned long int factorial_iter(int n);

int main() {
	
	int n;
	unsigned long int f;
	printf("\nEnter n(only positive numbers): ");
	scanf("%d", &n);

	int choice;
	printf("\nIterative(0) / Recursive(1) : ");
	scanf("%d", &choice);

	if(choice == 0) 
		f = factorial_iter(n);
	else if(choice == 1) 
		f = factorial_rec(n);
	else
		printf("Invalid choice entered\n");

	printf("Factorial of %d = %lu\n", n, f);

	return 0;
}

unsigned long int factorial_rec(int n) {

	if(n == 1) {
		return 1;
	}
	else
		return n * factorial_rec(n-1);
}

unsigned long int factorial_iter(int n) {

	int i;
	unsigned long int f = 1;
	
	for(i = 1; i <= n; i++) {
		f = f * i;
	}

	return f;
}



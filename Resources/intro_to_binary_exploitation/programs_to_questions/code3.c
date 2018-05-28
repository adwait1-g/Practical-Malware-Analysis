#include<stdio.h>
int main() {

	printf("This statement should get printed!\n");
	goto label1;
	printf("This statement should not get printed :(\n");

label1:
	printf("This again will get printed!\n");

	return 0;
}

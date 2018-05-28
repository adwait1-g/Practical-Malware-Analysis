#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main() {

	char buffer[100];
	gets(buffer);

	printf("\n%s\n", buffer);

	return 0;
}

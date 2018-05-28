#include<stdio.h>
#include<stdlib.h>
#include<string.h>

void func1();

int main() {
	
	func1();

	return 0;
}

void func1() {

	char buffer[100];
	gets(buffer);

	printf("\n%s\n", buffer);

}

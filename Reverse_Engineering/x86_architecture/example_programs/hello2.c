#include<stdio.h>
#include<stdlib.h>

char *str = "Hello world";
char *new_line = "\n";

void print_string();
void exit_prog();

void main() {
	
	print_string();
	exit_prog();

}

void print_string() {

	char *rdi = str;		//The pointer is named rdi so that it will be easy to correlate between this and the assembly program.
	

	do {

		write(1, rdi, 1);	//First write system call, which will write a character on stdout.

		write(1, new_line, 1);	//Second write system call, which will write a '\n' / newline on stdout.

		rdi++;			// This is same as inc rdi. A NOTE about this below.
	} while( *rdi != '\0');		// Same as cmp byte[rdi], 0x00

	return;
}

void exit_prog() {

	exit(1);	//exit(1) is the wrapper of the exit system call. 
}


/*
 * NOTE about inc rdi and rdi++ :
 *	
 * At the assembly level, everything is a stream of bytes. So, in hello2.asm, rdi which points to the string, when incremented(inc rdi), it will increment only by 1 byte. That is because everything is a stream of bytes there.
 *
 * But in a C program, If there a int *ptr and ptr++ is done, ptr is incremented by 4 bytes. This is because int is of 4 bytes. 
 *
 *
 * For the rdi pointer used in this C program, rdi++ is done. It is sure that it increments by only one unit because it is a char pointer. As size of a character is 1 byte, it's pointer when incremented will increment by 1 unit.
 *
 */
 
 

#include<stdio.h>
#include<stdlib.h>

char str[400];
char *new_line = "\n";

void reverse_string(int r9);
void exit_prog();


void main() {

	int r9;

	r9 = read(0, str, 400);
	
	r9 = r9 - 1;

	r9 - r9 - 1;

	reverse_string(r9);

	r9 = r9 + 1;

	write(1, str, r9);

	write(1, new_line, 1);

	return;
}

void reverse_string(int r9) {

	char *rdi, *rsi;
	
	rdi = str;
	rsi = str + r9;

	char rcx, rax;

	do {
		rcx = *rdi;
		rax = *rsi;

		*rdi = rax;
		*rsi = rcx;

		rdi++;
		rsi--;
	} while( rdi >= rsi);

	return;
}

void exit_prog() {
	
	exit(1);
}



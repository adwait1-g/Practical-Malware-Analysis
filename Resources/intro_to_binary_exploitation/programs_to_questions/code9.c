#include<stdio.h>
#include<stdlib.h>
#include<string.h>

void print_buffer(char *input);

int main(int argc, char **argv) {

	if(argc != 2) {
		fprintf(stderr, "Usage: $%s <arbitrary_string>\n", argv[0]);
		exit(1);
	}

	
	print_buffer(argv[1]);

	return 0;
}

void print_buffer(char *input) {
	
	char buffer[100];
	strcpy(buffer, input);

	printf("%s\n", buffer);
}

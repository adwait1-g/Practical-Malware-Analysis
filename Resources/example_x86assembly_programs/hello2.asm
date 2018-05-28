section .data

str: db "Hello world", 0x00

new_line: db 0x0a

section .text
	global _start

_start:
	call print_string	
	jmp end_prog



print_string:
	
	lea rdi, [str]

_loop:
	mov rax, 0x04
	mov rbx, 0x01
	mov rcx, rdi
	mov rdx, 0x01
	int 0x80

	mov rax, 0x04
	mov rbx, 0x01
	lea rcx, [new_line]
	mov rdx, 0x01
	int 0x80

	inc rdi
	cmp byte [rdi], 0x00
	je return
	jmp _loop
	

return:
	ret


end_prog: 
	mov rax, 0x01
	mov rbx, 0x00
	int 0x80


;Explanation:
;1. This program prints hello world, one character at a time. Every character is printed in a newline.
;2. A function print_string is called to get the job done.
;3. When lea rdi, [str] is executed, rdi has the starting address of the string. It is pointing to the first character 'H'.
;_loop:
;	Execution of write() system call writing to stdout. Look at rcx, It has the address of the string(rdi) . And rdx, the number of bytes to be printed. As we want to print 1 character at a time, rdx = 1. So, the 1 character pointed by rdi is printed. 
;	
;	Execution of write() system call writng to stdout. It is printing a '\n' after every character, so that 1 character is printed per line.
;
;	Incrementing rdi by 1. So, rdi points to the next character.('e' in the second iteration)
; 	
;	As rdi points to a character, the loop terminates when that character is a NULL character('\0' or 0x00). Every string ends with a NULL character. 
;	If rdi points to NULL, the function print_string returns.
;	Else, It will jmp _loop.
;
;
;Refer hello2.c to get the equivalent C program. 
;
;




;This program finds the length of input string(assembly equivalent of strlen() function).
;This might help in solving the palindrome problem.(question c, assignment 1)

section .bss
	
str: resd 100		;Reserving 100 dwords(400 bytes) for a str. This is an uninitialized variable.

section .text
	global _start

_start:
	lea rcx, [str]
	mov rdx, 400
	call stdin_read

	
	mov r15, 0x00	
	call strlen

	mov rax, r15

	call exit_prog




strlen :
	lea rdi, [str]

_loop:
	cmp byte [rdi],0x0a
	je return 
	inc r15
	inc rdi
	jmp _loop


return:
	ret





stdin_read:
	mov rax, 0x03
	mov rbx, 0x00
	int 0x80

	ret

stdout_write:
	mov rax, 0x04
	mov rbx, 0x01
	int 0x80

	ret

exit_prog:
	mov rax, 0x01
	mov rbx, 0x00
	int 0x80


;EXPLANATION:
;
;1. 400 bytes is reserved for a string entered by the user.
;
;program:
;
;1. Execute the read() syscall on stdin, so that the user can enter any string. If you look at rax after execution of read() system call(in gdb), rax would have the value length_of_entered_string+1	. The read() system call appends a '\n' at the end of the string entered. We can actually use this to find the length of string, which is rax - 1, But we will write a function which calculates the string length.
;
;2. Logic is, iterate through the whole string, till you get the '\n'. That is it. r15 is the counter. So, it is initialized to 0. 
;
;3. A function 'strlen' is called. 
;
;4. Check if the character pointer by rdi is '\n'. If yes, jump to return. Else, inc r15(counter should be incremented) and inc rdi(pointer is incremented).
;
;5. Loop continues till it reaches '\n'.
;
;6. Finally, register rax and r15 will have the string length.


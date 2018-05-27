; This program reverses a given string.
;This might help in solving the palindrome problem.(question c, assignment 1)

section .bss
	
str: resd 100		;Reserving 400 bytes for a str. This is an uninitialized variable.


section .data

new_line: db 0x0a, 0x00


section .text
	global _start

_start:

	lea rcx, [str]
	mov rdx, 400
	call stdin_read

	mov r9, rax	;rax has the return value of read = string_length + 1. If we decrement it by 1, we will get the string length.
	dec r9		; Now, r9 has the length of the string. 
	
	dec r9		; Again r9 is decremented because,a string is 0 indexed.The last character is present at the index r9-1	.


	call reverse_string
	
	lea rcx, [str]
	inc r9
	mov rdx, r9
	call stdout_write

	lea rcx, [new_line]
	mov rdx, 0x02
	call stdout_write

	call exit_prog



reverse_string:
	
	lea rdi, [str]		; rdi has the address of the first character.
	
	lea rsi, [str + r9]	; rsi has the address of the last character.

	mov rcx, 0x00		; A temporary register1 used.
	mov rax, 0x00		; A temporary register2 used.

_loop:
	cmp rdi, rsi
	jge return

	mov cl, byte[rdi]
	mov al, byte[rsi]

	mov byte[rdi], al
	mov byte[rsi], cl

	inc rdi
	dec rsi

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


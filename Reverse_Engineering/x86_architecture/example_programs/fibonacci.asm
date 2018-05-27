; This program calculates the nth fibonacci number.


section .data

n: dw 11


section .text
	global _start

_start:


	mov cx, word[n]

	call fib;

	mov rax, rdi	;rax will have the 10th fibonacci number.

	call exit_prog;



fib:
	mov rsi, 0x00	; First fibonacci number.
	mov rdi, 0x01	; Second fibonacci number.

	mov rdx, 0x02	; Counter of the loop

_loop:
	cmp rdx, rcx	; Comparing the counter with n
	je return

	

	add rsi, rdi	; Now, rsi is the new fibonacci number.

	mov r9, rdi	;r9 is a temporary variable used.
	mov rdi, rsi
	mov rsi, r9
			; Always, rdi will have the nth fib number.
	inc rdx

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


%define MAIN _main

section .text
	global _main
	extern _printf

_main:
	push rbp
	mov rbp, rsp
	call open
	call close

open:
	mov eax, 2
	lea rdi, [rel filename]
	mov rsi, 0x601
	mov rdx, 644o
	syscall

close:
	mov rdi, rax
	mov eax, 3


section .data
	filename: db "Grace_kid.s", 0
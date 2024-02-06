%define MAIN _main
%define OPEN_CALL_NB 0x2000005
%define CLOSE_CALL_NB 0x2000006

section .text
	global _main
	extern _printf

_main:
	push rbp
	mov rbp, rsp
	call _open
	call _close
	call _exit

_open:
	mov eax, OPEN_CALL_NB
	lea rdi, [rel filename]
	mov rsi, 0x202
	mov rdx, 420
	syscall

_close:
	mov rdi, rax
	mov eax, CLOSE_CALL_NB
	syscall

_exit:
	leave
	ret


section .data
	filename: db "Grace_kid.s", 0
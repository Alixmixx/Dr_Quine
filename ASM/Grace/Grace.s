%define MAIN _main
%define OPEN_CALL_NB 0x2000005
%define CLOSE_CALL_NB 0x2000006

section .text
	global _main
	extern _dprintf

_main:
	push rbp
	mov rbp, rsp
	call _open
	call _write
	call _close
	call _exit

_open:
	mov eax, OPEN_CALL_NB
	lea rdi, [rel filename]
	mov rsi, 0x202
	mov rdx, 420
	syscall

_write:
	push rbp
	mov rbp, rsp
	mov rdi, rax
	lea rsi, [rel message]
	;mov rdx, 10
	;mov rcx, 34
	call _dprintf

_close:
	mov eax, CLOSE_CALL_NB
	syscall

_exit:
	leave
	ret


section .data
	filename: db "Grace_kid.s", 0
	message: db "Hello, World!", 0
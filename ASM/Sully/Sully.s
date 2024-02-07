;Quine
section .text
	global _main
	extern _dprintf
	extern _sprintf
	extern _system

_main:
	push rbp
	mov rbp, rsp
	call _checknum
	call _exit

_checknum:
	;if (filenum < 0 ) exit

_create_names:
	sub rsp, 8
	mov rdi, 5
	mov [rel filenum], rdi		; filenum = 5
	lea rdi, [rel source]
	lea rsi, [rel sourcename]
	mov rdx, [rel filenum]
	call _sprintf				; source = "Sully_5.c"
	lea rdi, [rel object]
	lea rsi, [rel objectname]
	mov rdx, [rel filenum]
	call _sprintf				; object = "Sully_5.o"
	lea rdi, [rel program]
	lea rsi, [rel outname]
	mov rdx, [rel filenum]
	call _sprintf				; program = "Sully_5"
	add rsp, 8

_open:
	mov eax, 0x2000005 			; open syscall
	lea rdi, [rel source]
	mov rsi, 0x202
	mov rdx, 420
	syscall

_write:
	push rbp
	mov rbp, rsp
	mov rdi, rax
	lea rsi, [rel msg]
	lea rdx, [rel program]
	mov rcx, 10			; new line
	mov r8, 34			; double quote
	mov r9, 9			; tab
	call _dprintf

_close:
	mov eax, 0x2000006			; close syscall
	syscall

_create_command:
	lea rdi, [rel command]
	lea rsi, [rel command_template]
	lea rsi, [rel source]
	lea rdx, [rel object]
	lea r8, [rel program]
	

_execute:
	lea rdi, [rel command]
	call _system

_exit:
	leave
	ret

section .data
	sourcename: db "Sully_%1$d.c", 0
	objectname: db "Sully_%1$d.o", 0
	outname: db "Sully_%d", 0
	command_template: db "nasm -f macho64 %1$s -o %2$s && gcc -o %3$s %2$s && ./%3$s", 0 
	msg: db "%s", 0
	
section .bss
	command: resb 100
	source: resb 15
	object: resb 15
	program: resb 15
	filenum: resb 4

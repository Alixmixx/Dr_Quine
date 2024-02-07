;Quine
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
	lea rsi, [rel msg]
	lea rdx, [rel msg]
	mov rcx, 10			; new line
	mov r8, 34			; double quote
	mov r9, 9			; tab
	call _dprintf

_close:
	mov eax, CLOSE_CALL_NB
	syscall

_exit:
	leave
	ret


section .data
	filename: db "Grace_kid.s", 0
	msg: db ";Quine%2$c%%define MAIN _main%2$c%%define OPEN_CALL_NB 0x2000005%2$c%%define CLOSE_CALL_NB 0x2000006%2$c%2$csection .text%2$c%4$cglobal _main%2$c%4$cextern _dprintf%2$c%2$c_main:%2$c%4$cpush rbp%2$c%4$cmov rbp, rsp%2$c%4$ccall _open%2$c%4$ccall _exit%2$c%2$c_open:%2$c%4$cmov eax, OPEN_CALL_NB%2$c%4$clea rdi, [rel filename]%2$c%4$cmov rsi, 0x202%2$c%4$cmov rdx, 420%2$c%4$csyscall%2$c%2$c_write:%2$c%4$cpush rbp%2$c%4$cmov rbp, rsp%2$c%4$cmov rdi, rax%2$c%4$clea rsi, [rel msg]%2$c%4$clea rdx, [rel msg]%2$c%4$cmov rcx, 10%4$c%4$c%4$c; new line%2$c%4$cmov r8, 34%4$c%4$c%4$c; double quote%2$c%4$cmov r9, 9%4$c%4$c%4$c; tab%2$c%4$ccall _dprintf%2$c%2$c_close:%2$c%4$cmov eax, CLOSE_CALL_NB%2$c%4$csyscall%2$c%2$c_exit:%2$c%4$cleave%2$c%4$cret%2$c%2$c%2$csection .data%2$c%4$cfilename: db %3$cGrace_kid.s%3$c, 0%2$c%4$cmsg: db %3$c%1$s%3$c, 0", 0
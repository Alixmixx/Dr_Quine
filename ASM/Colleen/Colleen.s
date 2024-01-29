; AMS Quine
section .text
	global _main
	extern _printf

_main:
	push rbp
	mov rbp, rsp
	lea rdi, [rel msg]
	lea rsi, [rel msg]
	mov rdx, 10
	mov rcx, 34
	mov r8, 9
	call _printf ; extern printf call
	pop rbp
	xor rax, rax
	ret

section .data
	msg db "; AMS Quine%2$csection .text%2$c%4$cglobal _main%2$c%4$cextern _printf%2$c%2$c_main:%2$c%4$cpush rbp%2$c%4$cmov rbp, rsp%2$c%4$clea rdi, [rel msg]%2$c%4$clea rsi, [rel msg]%2$c%4$cmov rdx, 10%2$c%4$cmov rcx, 34%2$c%4$cmov r8, 9%2$c%4$ccall _printf ; extern printf call%2$c%4$cpop rbp%2$c%4$cxor rax, rax%2$c%4$cret%2$c%2$csection .data%2$c%4$cmsg db %3$c%1$s%3$c, 0", 0
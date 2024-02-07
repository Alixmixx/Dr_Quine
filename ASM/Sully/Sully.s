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

_create_names:
	sub rsp, 8
	mov rdi, 5
	mov [rel filenum], rdi		; filenum = 5
	lea rdi, [rel source]
	lea rsi, [rel sourcename]
	mov rdx, [rel filenum]
	call _sprintf				; source = "Sully_5.s"
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
	lea rdx, [rel msg]
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
	lea rdx, [rel source]
	lea rcx, [rel object]
	lea r8, [rel program]
	call _sprintf
	

_execute:
	lea rdi, [rel command]
	call _system

_exit:
	leave
	ret

section .bss
	command: resb 100
	source: resb 15
	object: resb 15
	program: resb 15
	filenum: resb 4

section .data
	sourcename: db "Sully_%1$d.s", 0
	objectname: db "Sully_%1$d.o", 0
	outname: db "Sully_%d", 0
	command_template: db "nasm -f macho64 %1$s -o %2$s && gcc -o %3$s %2$s && ./%3$s", 0
	msg: db ";Quine%2$csection .text%2$c%4$cglobal _main%2$c%4$cextern _dprintf%2$c%4$cextern _sprintf%2$c%4$cextern _system%2$c%2$c_main:%2$c%4$cpush rbp%2$c%4$cmov rbp, rsp%2$c%4$ccall _checknum%2$c%4$ccall _exit%2$c%2$c_checknum:%2$c%2$c_create_names:%2$c%4$csub rsp, 8%2$c%4$cmov rdi, 5%2$c%4$cmov [rel filenum], rdi%4$c%4$c; filenum = 5%2$c%4$clea rdi, [rel source]%2$c%4$clea rsi, [rel sourcename]%2$c%4$cmov rdx, [rel filenum]%2$c%4$ccall _sprintf%4$c%4$c%4$c%4$c; source = %3$cSully_5.s%3$c%2$c%4$clea rdi, [rel object]%2$c%4$clea rsi, [rel objectname]%2$c%4$cmov rdx, [rel filenum]%2$c%4$ccall _sprintf%4$c%4$c%4$c%4$c; object = %3$cSully_5.o%3$c%2$c%4$clea rdi, [rel program]%2$c%4$clea rsi, [rel outname]%2$c%4$cmov rdx, [rel filenum]%2$c%4$ccall _sprintf%4$c%4$c%4$c%4$c; program = %3$cSully_5%3$c%2$c%4$cadd rsp, 8%2$c%2$c_open:%2$c%4$cmov eax, 0x2000005 %4$c%4$c%4$c; open syscall%2$c%4$clea rdi, [rel source]%2$c%4$cmov rsi, 0x202%2$c%4$cmov rdx, 420%2$c%4$csyscall%2$c%2$c_write:%2$c%4$cpush rbp%2$c%4$cmov rbp, rsp%2$c%4$cmov rdi, rax%2$c%4$clea rsi, [rel msg]%2$c%4$clea rdx, [rel msg]%2$c%4$cmov rcx, 10%4$c%4$c%4$c; new line%2$c%4$cmov r8, 34%4$c%4$c%4$c; double quote%2$c%4$cmov r9, 9%4$c%4$c%4$c; tab%2$c%4$ccall _dprintf%2$c%2$c_close:%2$c%4$cmov eax, 0x2000006%4$c%4$c%4$c; close syscall%2$c%4$csyscall%2$c%2$c_create_command:%2$c%4$clea rdi, [rel command]%2$c%4$clea rsi, [rel command_template]%2$c%4$clea rdx, [rel source]%2$c%4$clea rcx, [rel object]%2$c%4$clea r8, [rel program]%2$c%4$ccall _sprintf%2$c%4$c%2$c%2$c_execute:%2$c%4$clea rdi, [rel command]%2$c%4$ccall _system%2$c%2$c_exit:%2$c%4$cleave%2$c%4$cret%2$c%2$csection .bss%2$c%4$ccommand: resb 100%2$c%4$csource: resb 15%2$c%4$cobject: resb 15%2$c%4$cprogram: resb 15%2$c%4$cfilenum: resb 4%2$c%2$csection .data%2$c%4$csourcename: db %3$cSully_%%1$d.s%3$c, 0%2$c%4$cobjectname: db %3$cSully_%%1$d.o%3$c, 0%2$c%4$coutname: db %3$cSully_%%d%3$c, 0%2$c%4$ccommand_template: db %3$cnasm -f macho64 %%1$s -o %%2$s && gcc -o %%3$s %%2$s && ./%%3$s%3$c, 0%2$c%4$cmsg: db %3$c%1$s%3$c, 0", 0
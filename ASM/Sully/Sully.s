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
sub rdi, 1
cmp rdi, 0
je _exit
mov [rel filenum], rdi; filenum = 5
lea rdi, [rel source]
lea rsi, [rel sourcename]
mov rdx, [rel filenum]
call _sprintf; source = "Sully_5.s"
lea rdi, [rel object]
lea rsi, [rel objectname]
mov rdx, [rel filenum]
call _sprintf; object = "Sully_5.o"
lea rdi, [rel program]
lea rsi, [rel outname]
mov rdx, [rel filenum]
call _sprintf; program = "Sully_5"
add rsp, 8

_open:
mov eax, 0x2000005 ; open syscall
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
mov rcx, 10; new line
mov r8, 34; double quote
mov r9, [rel filenum]; file number
call _dprintf

_close:
mov eax, 0x2000006; close syscall
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
msg: db ";Quine%2$csection .text%2$cglobal _main%2$cextern _dprintf%2$cextern _sprintf%2$cextern _system%2$c%2$c_main:%2$cpush rbp%2$cmov rbp, rsp%2$ccall _checknum%2$ccall _exit%2$c%2$c_checknum:%2$c%2$c_create_names:%2$csub rsp, 8%2$cmov rdi, %4$d%2$csub rdi, 1%2$ccmp rdi, 0%2$cje _exit%2$cmov [rel filenum], rdi; filenum = 5%2$clea rdi, [rel source]%2$clea rsi, [rel sourcename]%2$cmov rdx, [rel filenum]%2$ccall _sprintf; source = %3$cSully_5.s%3$c%2$clea rdi, [rel object]%2$clea rsi, [rel objectname]%2$cmov rdx, [rel filenum]%2$ccall _sprintf; object = %3$cSully_5.o%3$c%2$clea rdi, [rel program]%2$clea rsi, [rel outname]%2$cmov rdx, [rel filenum]%2$ccall _sprintf; program = %3$cSully_5%3$c%2$cadd rsp, 8%2$c%2$c_open:%2$cmov eax, 0x2000005 ; open syscall%2$clea rdi, [rel source]%2$cmov rsi, 0x202%2$cmov rdx, 420%2$csyscall%2$c%2$c_write:%2$cpush rbp%2$cmov rbp, rsp%2$cmov rdi, rax%2$clea rsi, [rel msg]%2$clea rdx, [rel msg]%2$cmov rcx, 10; new line%2$cmov r8, 34; double quote%2$cmov r9, [rel filenum]; file number%2$ccall _dprintf%2$c%2$c_close:%2$cmov eax, 0x2000006; close syscall%2$csyscall%2$c%2$c_create_command:%2$clea rdi, [rel command]%2$clea rsi, [rel command_template]%2$clea rdx, [rel source]%2$clea rcx, [rel object]%2$clea r8, [rel program]%2$ccall _sprintf%2$c%2$c%2$c_execute:%2$clea rdi, [rel command]%2$ccall _system%2$c%2$c_exit:%2$cleave%2$cret%2$c%2$csection .bss%2$ccommand: resb 100%2$csource: resb 15%2$cobject: resb 15%2$cprogram: resb 15%2$cfilenum: resb 4%2$c%2$csection .data%2$csourcename: db %3$cSully_%%1$d.s%3$c, 0%2$cobjectname: db %3$cSully_%%1$d.o%3$c, 0%2$coutname: db %3$cSully_%%d%3$c, 0%2$ccommand_template: db %3$cnasm -f macho64 %%1$s -o %%2$s && gcc -o %%3$s %%2$s && ./%%3$s%3$c, 0%2$cmsg: db %3$c%1$s%3$c, 0", 0
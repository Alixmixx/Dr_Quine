section .text
    global _main
    extern _printf

_main:
    push rbp            ;save base pointer  
    mov rbp, rsp        ;create stack frame
    lea rdi, [rel msg]  ;load address of msg into rdi
    call _printf        ;call printf
    pop rbp             ;restore base pointer
    xor rax, rax        ;clear eax
    ret                 ;return

section .data
    msg db "Hello, world!", 0    

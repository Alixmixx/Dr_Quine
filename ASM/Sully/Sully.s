section .text
	global _main
	extern _printf

_main:

_check_num:


_open:
	mov eax, 5
	mov ebx, filename
	mov ecx, 0
	int 0x80
	mov fd, eax

_write_to_file:
	mov eax, 4
	mov ebx, fd
	mov ecx, buffer
	mov edx, 100
	int 0x80

_close:
	mov eax, 6
	mov ebx, fd
	int 0x80

_exit:
	mov eax, 1
	mov ebx, 0
	int 0x80

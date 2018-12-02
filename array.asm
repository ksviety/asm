section .data
	CharArray: db "H", "I"
	temp: db 0

section .text
	global _start

_start:

	mov eax, [CharArray+1]
	mov [temp], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, temp
	mov edx, 2
	int 0x80

	call _exit

_exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
section .data
	CharArray: db "H", "I"
	temp: db 0

	msg: db "Element: ", 0 ; IDK why 'e' isnt displaied 
	msg_len equ $-msg

	ln: db 0x0A

section .text
	global _start

_start:

	mov eax, [CharArray+1]
	mov [temp], eax

	mov ecx, msg
	mov edx, msg_len
	call _print

	mov ecx, temp
	mov edx, 1
	call _println

	jmp _exit

_print:
	mov eax, 4
	mov ebx, 1
	int 0x80
	ret

_println:
	call _print
	mov ecx, ln
	mov ebx, 0
	call _print
	ret

_exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
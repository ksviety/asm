section .bss
    name: resb 80

section .data
    msg_ask: db "What should i call you: ", 0
    ask_len equ $-msg_ask
    msg_greet: db "Hi, ", 0
    greet_len equ $-msg_greet

section .text
    global _start

_start:

    ;   Print msg
    mov ecx, msg_ask
    mov edx, ask_len
    call _print

    ;   Read name
    mov eax, 3
    mov ecx, name
    mov edx, 80
    int 0x80

    ;   Print greeting
    mov ecx, msg_greet
    mov edx, greet_len
    call _print
    mov ecx, name
    mov edx, 80
    call _print
    mov ecx, 15
    mov edx, 1
    call _print

    jmp _exit

_print:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

_exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
; lesson2 from asmtutor.com
; hello-world with a exit returning 0
SECTION .data
msg db 'Hello world!', 0Ah

SECTION .text
global _start

_start:
	mov edx, 13
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 80h

	mov ebx, 0	; return 0
	mov eax, 1	; sys_exit
	int 80h

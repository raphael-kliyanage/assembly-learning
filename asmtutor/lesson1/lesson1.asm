; this program will print 'hello world!'

SECTION .data
msg db 'Hello world!', 0Ah	;0Ah = break line?

SECTION .text
global _start

_start:
	mov edx, 13	; the message is 13 char long
	mov ecx, msg	; body of the message
	mov ebx, 1	; stdout
	mov eax, 4	; sys_write
	int 80h

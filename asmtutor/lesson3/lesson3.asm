; calculating the string's length to automate the printing process

SECTION .data
msg db 'You know how they call a quarter pound with cheese in France?', 0Ah

SECTION .text
global _start

_start:
	mov ebx, msg	; address of the string moved into ebx
	mov eax, ebx	; ebx has eax's address, pointing the same segment

nextchar:
	cmp byte[eax], 0	; 0 is an end of string delimiter
	jz finished	; jump to 'finished' if ZF = 1
	inc eax		; eax += 1 if ZF != 1
	jmp nextchar	; loop until the end of the string

finished:
	sub eax, ebx	; eax will store the length of the string
	mov edx, eax	; length of the string to be printed
	mov ecx, msg	; pulp fiction's iconic line
	mov ebx, 1	; stdout
	mov eax, 4	; SYS_WRITE
	int 80h

	mov ebx, 0	; return 0
	mov eax, 1	; SYS_EXIT
	int 80h

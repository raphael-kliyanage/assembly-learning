; learning about subroutines CALL / RET and JMP

SECTION .data
msg db 'Royale with Cheese', 0Ah

SECTION .text
global _start

_start:
	mov eax, msg	; the string's address has been moved into eax
	call strlen	; calling a function to calculate the length

	mov edx, eax	; eax will contain the length after the function
	mov ecx, msg	; pulp fiction's line or McDonald's product (please don't sue me)
	mov ebx, 1	; STDOUT
	mov eax, 4	; SYS_WRITE
	int 80h

	mov eax, 1	; SYS_WRITE
	mov ebx, 0	; return 0
	int 80h

strlen:			; function's declaration
	push ebx	; ebx at the top the stack
	mov ebx, eax	; both points to the string's address

nextchar:
	cmp byte[eax], 0
	jz finished
	inc eax
	jmp nextchar

finished:
	sub eax, ebx
	pop ebx		; pop the value on the stack back into ebx
	ret		; going back to where we left

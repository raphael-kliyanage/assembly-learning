; implementation of linefeeds
; to improve lesson6's project

slen:
	push ebx
	mov ebx, eax

nextchar:
	cmp byte[eax], 0
	jz finished
	inc eax
	jmp nextchar

finished:
	sub eax, ebx
	pop ebx
	ret

; void sprint(string message)
; LIFO

sprint:
	push edx
	push ecx
	push ebx
	push eax
	call slen

	mov edx, eax
	pop eax

	mov ecx, eax
	mov ebx, 1
	mov eax, 4
	int 80h

	pop ebx
	pop ecx
	pop edx
	ret

; void sprintLF(string message)

sprintLF:
	call sprint

	push eax	; preserve eax while being used in sprintLF
	mov eax, 0Ah	; adds break-line for a linefeed
	push eax	; getting the address
	mov eax, esp	; moving the address on the current stack pointer into eax for sprint
	call sprint	; call sprint function
	pop eax		; remove linefeed from stack
	pop eax 	; restore the original value of eax
	ret		; return to our program

; void exit()

quit:
	mov ebx, 0
	mov eax, 1
	int 80h
	ret

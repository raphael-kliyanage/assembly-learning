; this program just prints some strings
; by including external files

%include 'functions.asm'	; #include 'lesson5.asm'

SECTION .data
msg1 db 'What are you gonna do?', 0Ah
msg2 db "I'll drop by your office tomorrow and we can start sorting this mess out", 0Ah

SECTION .text
global _start

_start:
	mov eax, msg1
	call print

	mov eax, msg2
	call print

	call exit

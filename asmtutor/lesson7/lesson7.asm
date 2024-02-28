; print a text with linefeeds

%include 'functions.asm'

SECTION .data
msg1 db 'WTF!', 0h	; removed 0Ah
msg2 db 'damnit, I think I shot Marvin', 0h	; removed 0Ah

SECTION .text
global _start

_start:
	mov eax, msg1
	call sprintLF	; calling linefeed function

	mov eax, msg2
	call sprintLF	; calling lifeneed function

	call quit

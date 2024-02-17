# x86 Assembly: hello world!
# inspiration: https://www.youtube.com/watch?v=jPDiaZS-2ok
# Code's under MIT Licence

.global _start
.intel_syntax
.section .text

_start:
	# "write" syscall
	mov %eax, 0x04
	mov %ebx, 0x01	# stdout
	lea %ecx, [print_msg]	# contains the string in ".data" section
	mov %edx, 0x0d	# the string is 14 characters long	
	int 0x80	# actually executing the syscall	

	# "exit" syscall (with signal 0)
	mov %eax, 0x01
	mov %ebx, 0x00
	int 0x80	# actually executing the syscall

.section .data
	print_msg:
	.ascii "Happy world!\n"

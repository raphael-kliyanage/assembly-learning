# x86 assembly: calculus
# code's under MIT License

.global _start
.intel_syntax

.section .data
a:
	.int 22
b:
	.int 44
c:
	.int 0

_start:
	# loading variables
	mov %eax, [a]
	mov %ebx, [b]
	
	# addition
	add %eax, %ebx
	
	# storing on [c]
	mov [c], %eax
	
	# "exit" syscall
	mov %eax, 0x01	# "exit"
	mov %ebx, [c]	# return c's value
	int 0x80	# execute syscall

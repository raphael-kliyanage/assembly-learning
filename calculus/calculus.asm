# x86 assembly: calculus
# inspiration: https://stackoverflow.com/questions/28524535/add-2-numbers-and-print-the-result-using-assembly-x86
# code's under MIT License

.section .text
.global _start
_start:
	mov %eax, 0x04	# 4
	mov %ebx, 0x04	# 4
	add %eax, %ebx	# eax+=ebx (eax=eax+ebx=4+4=8)

	# converting eax to ascii and storing it onto the stack
	sub %esp, 0x10	# reserve space on the stack
	mov %ecx, 0x0a
	mov %ebx, 0x10

	.L1:
	xor %edx, %edx	# Don't forget it! (why?)
	div %ecx		# extract the last decimal digit
	or %dl, 0x30	# convert remainder to ascii
	sub %ebx, 1
	mov [%esp+%ebx], %dl	# store remainder on the stack (reverse order)
	test %eax, %eax	# until there is nothing to divide
	jnz .L1

	mov %eax, 0x04	# sys_write
	lea %ecx, [%esp+%ebx]	; pointer to the frist ascii digit
	mov %edx, 0x01
	sub %edx, %ebx	# count of digits
	mov %ebx, 0x01	# stdout
	int 0x80	# call 32bit linux

	add %esp, 16	# restore the stack

	mov %eax, 0x01	# sys_exit
	xor %ebx, %ebx	# return value
	int 0x80	# call 32bit linux


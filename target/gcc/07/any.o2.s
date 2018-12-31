	.file	"07.c"
	.text
	.p2align 4
	.globl	victim_function_v07
	.type	victim_function_v07, @function
victim_function_v07:
.LFB11:
	.cfi_startproc
	cmpq	%rdi, last_x.2715(%rip)
	jne	.L2
	movzbl	array1(%rdi), %eax
	sall	$9, %eax
	cltq
	movzbl	array2(%rax), %eax
	andb	%al, temp(%rip)
.L2:
	movl	array1_size(%rip), %eax
	cmpq	%rdi, %rax
	jbe	.L1
	movq	%rdi, last_x.2715(%rip)
.L1:
	ret
	.cfi_endproc
.LFE11:
	.size	victim_function_v07, .-victim_function_v07
	.local	last_x.2715
	.comm	last_x.2715,8,8
	.globl	temp
	.bss
	.type	temp, @object
	.size	temp, 1
temp:
	.zero	1
	.comm	array2,131072,32
	.globl	array1
	.data
	.align 16
	.type	array1, @object
	.size	array1, 16
array1:
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017\020"
	.globl	array1_size
	.align 4
	.type	array1_size, @object
	.size	array1_size, 4
array1_size:
	.long	16
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

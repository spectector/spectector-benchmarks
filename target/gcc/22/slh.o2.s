	.file	"22.c"
	.text
	.p2align 4
	.globl	mem_leak
	.type	mem_leak, @function
mem_leak:
.LFB11:
	.cfi_startproc
	movl	array1_size(%rip), %eax
	cmpq	%rax, %rdi
	sbbq	%rax, %rax
	testq	%rax, %rax
	jne	.L5
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	andq	%rax, %rdi
	movzbl	array1(%rdi), %eax
	ret
	.cfi_endproc
.LFE11:
	.size	mem_leak, .-mem_leak
	.p2align 4
	.globl	victim_function_v22
	.type	victim_function_v22, @function
victim_function_v22:
.LFB12:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE12:
	.size	victim_function_v22, .-victim_function_v22
	.globl	temp
	.bss
	.type	temp, @object
	.size	temp, 1
temp:
	.zero	1
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

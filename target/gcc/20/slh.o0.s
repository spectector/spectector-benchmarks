	.file	"20.c"
	.text
	.globl	array1_size
	.data
	.align 4
	.type	array1_size, @object
	.size	array1_size, 4
array1_size:
	.long	16
	.globl	array1
	.align 16
	.type	array1, @object
	.size	array1, 16
array1:
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017\020"
	.comm	array2,131072,32
	.globl	temp
	.bss
	.type	temp, @object
	.size	temp, 1
temp:
	.zero	1
	.text
	.globl	victim_function_v20
	.type	victim_function_v20, @function
victim_function_v20:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	$-1, %rcx
	movq	%rcx, %rax
	andq	-24(%rbp), %rax
	movzbl	array1(%rax), %edx
	movb	%dl, -1(%rbp)
	movl	array1_size(%rip), %edx
	movl	%edx, %edx
	cmpq	%rdx, %rax
	sbbq	%rax, %rax
	testq	%rax, %rax
	je	.L2
	andq	%rax, %rcx
	movq	%rcx, %rdx
	movzbl	-1(%rbp), %eax
	sall	$9, %eax
	andl	%edx, %eax
	cltq
	movzbl	array2(%rax), %edx
	movzbl	temp(%rip), %eax
	andl	%edx, %eax
	movb	%al, temp(%rip)
	jmp	.L4
.L2:
	movb	$0, -1(%rbp)
.L4:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	victim_function_v20, .-victim_function_v20
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

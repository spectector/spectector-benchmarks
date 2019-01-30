	.file	"21.c"
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
	.globl	temp
	.bss
	.type	temp, @object
	.size	temp, 1
temp:
	.zero	1
	.text
	.globl	victim_function_v21
	.type	victim_function_v21, @function
victim_function_v21:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	$-1, %rdx
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	andq	%rax, %rdx
	movq	%rdx, %rax
	andq	-24(%rbp), %rax
	movzbl	array1(%rax), %eax
	movzbl	%al, %eax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	%eax, %ecx
	movzbl	temp(%rip), %eax
	andl	%ecx, %eax
	movb	%al, temp(%rip)
	addl	$1, -4(%rbp)
.L2:
	cmpl	$1, -4(%rbp)
	setg	%al
	movzbl	%al, %eax
	subq	$1, %rax
	testq	%rax, %rax
	je	.L6
	andq	%rax, %rdx
	movl	array1_size(%rip), %eax
	movl	%eax, %eax
	cmpq	%rax, -24(%rbp)
	sbbq	%rax, %rax
	testq	%rax, %rax
	jne	.L5
.L6:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	victim_function_v21, .-victim_function_v21
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

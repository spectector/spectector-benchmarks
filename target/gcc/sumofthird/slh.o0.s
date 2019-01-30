	.file	"sumofthird.c"
	.text
	.globl	sumOfThirdBytes
	.type	sumOfThirdBytes, @function
sumOfThirdBytes:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	$-1, %rdx
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	andq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	addq	$2, -16(%rbp)
	movq	%rdx, %rax
	andq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	addl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	setge	%al
	movzbl	%al, %eax
	subq	$1, %rax
	testq	%rax, %rax
	jne	.L3
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	sumOfThirdBytes, .-sumOfThirdBytes
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

	.file	"cstrncat.c"
	.text
	.globl	cstrncat
	.type	cstrncat, @function
cstrncat:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	$-1, %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, -8(%rbp)
	jmp	.L2
.L3:
	andq	%rdx, %rax
	addq	$1, -8(%rbp)
.L2:
	movq	%rax, %rdx
	andq	-8(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	$1, %dl
	sbbq	%rdx, %rdx
	notq	%rdx
	testq	%rdx, %rdx
	jne	.L3
	notq	%rdx
	andq	%rax, %rdx
	jmp	.L4
.L7:
	andq	%rax, %rdx
	subl	$1, -36(%rbp)
	addq	$1, -8(%rbp)
.L4:
	cmpl	$1, -36(%rbp)
	sbbq	%rax, %rax
	notq	%rax
	testq	%rax, %rax
	jne	.L5
	notq	%rax
	andq	%rdx, %rax
	jmp	.L6
.L5:
	andq	%rdx, %rax
	movq	-32(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	%rcx, -32(%rbp)
	andq	%rax, %rdx
	movzbl	(%rdx), %ecx
	movq	-8(%rbp), %rdx
	movb	%cl, (%rdx)
	movq	%rax, %rdx
	andq	-8(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	$1, %dl
	sbbq	%rdx, %rdx
	notq	%rdx
	testq	%rdx, %rdx
	jne	.L7
	notq	%rdx
	andq	%rdx, %rax
.L6:
	andq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$1, %al
	sbbq	%rax, %rax
	notq	%rax
	testq	%rax, %rax
	je	.L9
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
.L9:
	movq	-24(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	cstrncat, .-cstrncat
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

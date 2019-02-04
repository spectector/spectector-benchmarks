	.file	"wildcard.c"
	.text
	.globl	wildcardcmp
	.type	wildcardcmp, @function
wildcardcmp:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$-1, %rdx
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	cmpq	$1, -24(%rbp)
	sbbq	%rax, %rax
	testq	%rax, %rax
	jne	.L3
	notq	%rax
	andq	%rax, %rdx
	cmpq	$1, -32(%rbp)
	sbbq	%rax, %rax
	testq	%rax, %rax
	je	.L4
.L3:
	movl	$0, %eax
	jmp	.L5
.L4:
	notq	%rax
	andq	%rdx, %rax
.L14:
	movq	%rax, %rdx
	andq	-32(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	$1, %dl
	sbbq	%rdx, %rdx
	testq	%rdx, %rdx
	je	.L6
	andq	%rdx, %rax
	movq	%rax, %rdx
	andq	-24(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	$1, %dl
	sbbq	%rdx, %rdx
	testq	%rdx, %rdx
	je	.L7
	movl	$1, %eax
	jmp	.L5
.L7:
	notq	%rdx
	andq	%rdx, %rax
	movq	%rax, %rdx
	andq	-16(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	$1, %dl
	sbbq	%rdx, %rdx
	testq	%rdx, %rdx
	je	.L8
	movl	$0, %eax
	jmp	.L5
.L8:
	notq	%rdx
	andq	%rdx, %rax
	movq	-16(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	%rcx, -16(%rbp)
	movq	%rdx, -32(%rbp)
	movq	-8(%rbp), %rdx
	movq	%rdx, -24(%rbp)
	jmp	.L9
.L6:
	notq	%rdx
	andq	%rdx, %rax
	movq	%rax, %rdx
	andq	-24(%rbp), %rdx
	movzbl	(%rdx), %ecx
	movq	%rax, %rdx
	andq	-32(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	%dl, %cl
	sete	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	je	.L10
	andq	%rdx, %rax
	movq	%rax, %rdx
	andq	-24(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	$42, %dl
	setne	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	je	.L11
	andq	%rax, %rdx
	addq	$1, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	%rdx, %rax
	andq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$1, %al
	sbbq	%rax, %rax
	notq	%rax
	testq	%rax, %rax
	je	.L12
	andq	%rdx, %rax
	jmp	.L9
.L12:
	movl	$1, %eax
	jmp	.L5
.L11:
	notq	%rdx
	andq	%rax, %rdx
	cmpq	$1, -8(%rbp)
	sbbq	%rax, %rax
	notq	%rax
	testq	%rax, %rax
	je	.L13
	andq	%rdx, %rax
	addq	$1, -32(%rbp)
	jmp	.L9
.L13:
	movl	$0, %eax
	jmp	.L5
.L10:
	notq	%rdx
	andq	%rdx, %rax
	addq	$1, -32(%rbp)
	addq	$1, -24(%rbp)
.L9:
	jmp	.L14
.L5:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	wildcardcmp, .-wildcardcmp
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

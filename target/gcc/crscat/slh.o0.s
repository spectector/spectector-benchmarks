	.file	"crscat.c"
	.text
	.globl	cstrcat
	.type	cstrcat, @function
cstrcat:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
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
	andq	%rdx, %rax
	nop
.L5:
	movq	-32(%rbp), %rcx
	leaq	1(%rcx), %rdx
	movq	%rdx, -32(%rbp)
	movq	-8(%rbp), %rdx
	leaq	1(%rdx), %rsi
	movq	%rsi, -8(%rbp)
	andq	%rax, %rcx
	movzbl	(%rcx), %ecx
	movb	%cl, (%rdx)
	andq	%rax, %rdx
	movzbl	(%rdx), %edx
	cmpb	$1, %dl
	sbbq	%rdx, %rdx
	notq	%rdx
	testq	%rdx, %rdx
	je	.L4
	andq	%rdx, %rax
	jmp	.L5
.L4:
	movq	-24(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	cstrcat, .-cstrcat
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

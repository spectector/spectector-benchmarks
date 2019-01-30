	.file	"subtring.c"
	.text
	.globl	substring
	.type	substring, @function
substring:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	$-1, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L2
.L9:
	andq	%rdx, %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, -16(%rbp)
	movq	-48(%rbp), %rdx
	movq	%rdx, -24(%rbp)
	jmp	.L3
.L6:
	andq	%rdx, %rax
	addq	$1, -24(%rbp)
	addq	$1, -16(%rbp)
.L3:
	movq	%rax, %rdx
	andq	-24(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	$1, %dl
	sbbq	%rdx, %rdx
	notq	%rdx
	testq	%rdx, %rdx
	jne	.L4
	notq	%rdx
	andq	%rdx, %rax
	jmp	.L5
.L4:
	andq	%rdx, %rax
	movq	%rax, %rdx
	andq	-24(%rbp), %rdx
	movzbl	(%rdx), %ecx
	movq	%rax, %rdx
	andq	-16(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	%dl, %cl
	setne	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	jne	.L6
	notq	%rdx
	andq	%rdx, %rax
.L5:
	movq	%rax, %rdx
	andq	-24(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	$1, %dl
	sbbq	%rdx, %rdx
	testq	%rdx, %rdx
	je	.L7
	movl	$1, %eax
	jmp	.L8
.L7:
	notq	%rdx
	andq	%rax, %rdx
	addq	$1, -8(%rbp)
.L2:
	movq	%rdx, %rax
	andq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$1, %al
	sbbq	%rax, %rax
	notq	%rax
	testq	%rax, %rax
	jne	.L9
	movl	$0, %eax
.L8:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	substring, .-substring
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

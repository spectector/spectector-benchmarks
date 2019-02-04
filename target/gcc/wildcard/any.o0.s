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
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L2
	cmpq	$0, -32(%rbp)
	jne	.L3
.L2:
	movl	$0, %eax
	jmp	.L4
.L3:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L5
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L6
	movl	$1, %eax
	jmp	.L4
.L6:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L7
	movl	$0, %eax
	jmp	.L4
.L7:
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	jmp	.L8
.L5:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	.L9
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$42, %al
	jne	.L10
	addq	$1, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L13
	movl	$1, %eax
	jmp	.L4
.L10:
	cmpq	$0, -8(%rbp)
	je	.L12
	addq	$1, -32(%rbp)
	jmp	.L8
.L12:
	movl	$0, %eax
	jmp	.L4
.L9:
	addq	$1, -32(%rbp)
	addq	$1, -24(%rbp)
	jmp	.L3
.L13:
	nop
.L8:
	jmp	.L3
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	wildcardcmp, .-wildcardcmp
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

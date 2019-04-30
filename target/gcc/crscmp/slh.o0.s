	.file	"crscmp.c"
	.text
	.globl	cstrcmp
	.type	cstrcmp, @function
cstrcmp:
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
	jmp	.L2
.L5:
	andq	%rdx, %rax
	addq	$1, -24(%rbp)
	addq	$1, -32(%rbp)
.L2:
	movq	%rax, %rdx
	andq	-24(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	$1, %dl
	sbbq	%rdx, %rdx
	notq	%rdx
	testq	%rdx, %rdx
	jne	.L3
	notq	%rdx
	andq	%rdx, %rax
	jmp	.L4
.L3:
	andq	%rdx, %rax
	movq	%rax, %rdx
	andq	-24(%rbp), %rdx
	movzbl	(%rdx), %ecx
	movq	%rax, %rdx
	andq	-32(%rbp), %rdx
	movzbl	(%rdx), %edx
	cmpb	%dl, %cl
	setne	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	jne	.L5
	notq	%rdx
	andq	%rdx, %rax
.L4:
	movq	%rax, %rdx
	andq	-24(%rbp), %rdx
	movzbl	(%rdx), %edx
	movb	%dl, -1(%rbp)
	andq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	-2(%rbp), %eax
	cmpb	%al, -1(%rbp)
	sbbq	%rax, %rax
	notq	%rax
	testq	%rax, %rax
	je	.L6
	movzbl	-1(%rbp), %eax
	cmpb	-2(%rbp), %al
	seta	%al
	movzbl	%al, %eax
	jmp	.L8
.L6:
	movl	$-1, %eax
.L8:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	cstrcmp, .-cstrcmp
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

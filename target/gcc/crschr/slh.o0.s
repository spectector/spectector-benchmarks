	.file	"crschr.c"
	.text
	.globl	cstrchr
	.type	cstrchr, @function
cstrchr:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	$-1, %rax
	jmp	.L2
.L5:
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
	jmp	.L4
.L3:
	andq	%rdx, %rax
	movq	%rax, %rdx
	andq	-8(%rbp), %rdx
	movzbl	(%rdx), %edx
	movl	-12(%rbp), %ecx
	cmpb	%cl, %dl
	sete	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	jne	.L5
	notq	%rdx
	andq	%rdx, %rax
.L4:
	andq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	%eax, -12(%rbp)
	setne	%al
	movzbl	%al, %eax
	subq	$1, %rax
	testq	%rax, %rax
	je	.L6
	movq	-8(%rbp), %rax
	jmp	.L8
.L6:
	movl	$0, %eax
.L8:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	cstrchr, .-cstrchr
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

	.file	"cstrcspn.c"
	.text
	.globl	cstrcspn
	.type	cstrcspn, @function
cstrcspn:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L2
.L8:
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, -20(%rbp)
	jmp	.L3
.L5:
	addq	$1, -16(%rbp)
.L3:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L4
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movl	-20(%rbp), %edx
	cmpb	%dl, %al
	jne	.L5
.L4:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	%eax, -20(%rbp)
	jne	.L6
	movq	-8(%rbp), %rax
	subq	-40(%rbp), %rax
	jmp	.L7
.L6:
	addq	$1, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L8
	movq	-8(%rbp), %rax
	subq	-40(%rbp), %rax
.L7:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	cstrcspn, .-cstrcspn
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

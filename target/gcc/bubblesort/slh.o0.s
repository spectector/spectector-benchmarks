	.file	"bubblesort.c"
	.text
	.globl	bubbleSort
	.type	bubbleSort, @function
bubbleSort:
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
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L2
.L7:
	andq	%rdx, %rax
	movl	$1, -8(%rbp)
	jmp	.L3
.L6:
	andq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	-4(%rdx), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	andq	%rax, %rdx
	movl	(%rdx), %ecx
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rsi
	movq	-24(%rbp), %rdx
	addq	%rsi, %rdx
	andq	%rax, %rdx
	movl	(%rdx), %edx
	cmpl	%edx, %ecx
	setle	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	jne	.L4
	notq	%rdx
	andq	%rdx, %rax
	jmp	.L5
.L4:
	andq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	-4(%rdx), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	andq	%rax, %rdx
	movl	(%rdx), %edx
	movl	%edx, -12(%rbp)
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	leaq	(%rcx,%rdx), %rsi
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	-4(%rdx), %rcx
	movq	-24(%rbp), %rdx
	addq	%rdx, %rcx
	andq	%rax, %rsi
	movq	%rsi, %rdx
	movl	(%rdx), %edx
	movl	%edx, (%rcx)
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rdx, %rcx
	movl	-12(%rbp), %edx
	movl	%edx, (%rcx)
.L5:
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %edx
	cmpl	-4(%rbp), %edx
	setg	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	jne	.L6
	notq	%rdx
	andq	%rax, %rdx
	subl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cltq
	sarq	$63, %rax
	notq	%rax
	testq	%rax, %rax
	jne	.L7
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	bubbleSort, .-bubbleSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

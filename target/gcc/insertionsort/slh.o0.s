	.file	"insertionsort.c"
	.text
	.globl	insertionSort
	.type	insertionSort, @function
insertionSort:
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
	movl	$1, -4(%rbp)
	jmp	.L2
.L7:
	andq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	andq	%rax, %rdx
	movl	(%rdx), %edx
	movl	%edx, -12(%rbp)
	movl	-4(%rbp), %edx
	movl	%edx, -8(%rbp)
	jmp	.L3
.L6:
	andq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	-4(%rdx), %rcx
	movq	-24(%rbp), %rdx
	leaq	(%rcx,%rdx), %rsi
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rdx, %rcx
	andq	%rax, %rsi
	movq	%rsi, %rdx
	movl	(%rdx), %edx
	movl	%edx, (%rcx)
	subl	$1, -8(%rbp)
.L3:
	cmpl	$0, -8(%rbp)
	setle	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	jne	.L4
	notq	%rdx
	andq	%rax, %rdx
	jmp	.L5
.L4:
	andq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	andq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -12(%rbp)
	setge	%al
	movzbl	%al, %eax
	subq	$1, %rax
	testq	%rax, %rax
	jne	.L6
	notq	%rax
	andq	%rax, %rdx
.L5:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rax, %rcx
	movl	-12(%rbp), %eax
	movl	%eax, (%rcx)
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	setge	%al
	movzbl	%al, %eax
	subq	$1, %rax
	testq	%rax, %rax
	jne	.L7
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	insertionSort, .-insertionSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

	.file	"selectionsort.c"
	.text
	.globl	SelectionSort
	.type	SelectionSort, @function
SelectionSort:
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
	movl	$0, -4(%rbp)
	jmp	.L2
.L7:
	andq	%rdx, %rax
	movl	-4(%rbp), %edx
	movl	%edx, -12(%rbp)
	movl	-4(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -8(%rbp)
	jmp	.L3
.L6:
	andq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	andq	%rax, %rdx
	movl	(%rdx), %ecx
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rsi
	movq	-24(%rbp), %rdx
	addq	%rsi, %rdx
	andq	%rax, %rdx
	movl	(%rdx), %edx
	cmpl	%edx, %ecx
	setge	%dl
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
	movl	%edx, -12(%rbp)
.L5:
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %edx
	cmpl	-28(%rbp), %edx
	setge	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	jne	.L6
	notq	%rdx
	andq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	andq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	leaq	(%rcx,%rax), %rsi
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rax, %rcx
	movq	%rsi, %rax
	andq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rcx)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rax, %rcx
	movl	-16(%rbp), %eax
	movl	%eax, (%rcx)
	addl	$1, -4(%rbp)
.L2:
	movl	-28(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
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
	.size	SelectionSort, .-SelectionSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

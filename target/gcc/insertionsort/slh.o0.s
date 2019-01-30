	.file	"insertionsort.c"
	.text
	.globl	a
	.data
	.align 4
	.type	a, @object
	.size	a, 4
a:
	.long	1
	.globl	array_size
	.align 4
	.type	array_size, @object
	.size	array_size, 4
array_size:
	.long	1
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
	movq	$-1, %rdx
	movl	$1, -4(%rbp)
	jmp	.L2
.L7:
	andq	%rdx, %rax
	movl	%eax, %edx
	andl	-4(%rbp), %edx
	movslq	%edx, %rcx
	movl	a(,%rcx,4), %ecx
	movl	%ecx, -12(%rbp)
	movl	%edx, -8(%rbp)
	jmp	.L3
.L6:
	andq	%rdx, %rax
	movl	-8(%rbp), %edx
	subl	$1, %edx
	movl	%eax, %ecx
	andl	%ecx, %edx
	movslq	%edx, %rdx
	movl	a(,%rdx,4), %ecx
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	%ecx, a(,%rdx,4)
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
	subl	$1, %eax
	movl	%edx, %ecx
	andl	%ecx, %eax
	cltq
	movl	a(,%rax,4), %eax
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
	movl	-12(%rbp), %ecx
	movl	%ecx, a(,%rax,4)
	addl	$1, -4(%rbp)
.L2:
	movl	array_size(%rip), %eax
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
	.size	insertionSort, .-insertionSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

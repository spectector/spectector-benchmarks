	.file	"bubblesort.c"
	.text
	.globl	numbers
	.data
	.align 4
	.type	numbers, @object
	.size	numbers, 4
numbers:
	.long	1
	.globl	array_size
	.align 4
	.type	array_size, @object
	.size	array_size, 4
array_size:
	.long	1
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
	movq	$-1, %rdx
	movl	array_size(%rip), %eax
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
	subl	$1, %edx
	movl	%eax, %ecx
	andl	%ecx, %edx
	movslq	%edx, %rdx
	movl	numbers(,%rdx,4), %ecx
	movl	%eax, %edx
	andl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	numbers(,%rdx,4), %edx
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
	subl	$1, %edx
	movl	%eax, %ecx
	andl	%ecx, %edx
	movslq	%edx, %rdx
	movl	numbers(,%rdx,4), %edx
	movl	%edx, -12(%rbp)
	movl	-8(%rbp), %edx
	leal	-1(%rdx), %edi
	movl	%eax, %edx
	andl	-8(%rbp), %edx
	movslq	%edx, %rcx
	movl	numbers(,%rcx,4), %esi
	movslq	%edi, %rcx
	movl	%esi, numbers(,%rcx,4)
	movslq	%edx, %rdx
	movl	-12(%rbp), %ecx
	movl	%ecx, numbers(,%rdx,4)
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

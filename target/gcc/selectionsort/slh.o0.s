	.file	"selectionsort.c"
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
	movl	%eax, %edx
	andl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	a(,%rdx,4), %ecx
	movl	%eax, %edx
	andl	-12(%rbp), %edx
	movslq	%edx, %rdx
	movl	a(,%rdx,4), %edx
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
	movl	array_size(%rip), %edx
	cmpl	%edx, -8(%rbp)
	setge	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	jne	.L6
	notq	%rdx
	andq	%rax, %rdx
	movl	%edx, %eax
	andl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	a(,%rcx,4), %ecx
	movl	%ecx, -16(%rbp)
	movl	%edx, %ecx
	andl	-12(%rbp), %ecx
	movslq	%ecx, %rsi
	movl	a(,%rsi,4), %edi
	movslq	%eax, %rsi
	movl	%edi, a(,%rsi,4)
	movslq	%ecx, %rcx
	movl	-16(%rbp), %esi
	movl	%esi, a(,%rcx,4)
	addl	$1, %eax
	movl	%eax, -4(%rbp)
.L2:
	movl	array_size(%rip), %eax
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

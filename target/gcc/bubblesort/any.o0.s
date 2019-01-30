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
	movl	array_size(%rip), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L2
.L6:
	movl	$1, -8(%rbp)
	jmp	.L3
.L5:
	movl	-8(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	numbers(,%rax,4), %edx
	movl	-8(%rbp), %eax
	cltq
	movl	numbers(,%rax,4), %eax
	cmpl	%eax, %edx
	jle	.L4
	movl	-8(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	numbers(,%rax,4), %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-8(%rbp), %eax
	cltq
	movl	numbers(,%rax,4), %edx
	movslq	%ecx, %rax
	movl	%edx, numbers(,%rax,4)
	movl	-8(%rbp), %eax
	cltq
	movl	-12(%rbp), %edx
	movl	%edx, numbers(,%rax,4)
.L4:
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.L5
	subl	$1, -4(%rbp)
.L2:
	cmpl	$0, -4(%rbp)
	jns	.L6
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	bubbleSort, .-bubbleSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

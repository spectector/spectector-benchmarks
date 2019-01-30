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
	movl	$0, -4(%rbp)
	jmp	.L2
.L6:
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L3
.L5:
	movl	-8(%rbp), %eax
	cltq
	movl	a(,%rax,4), %edx
	movl	-12(%rbp), %eax
	cltq
	movl	a(,%rax,4), %eax
	cmpl	%eax, %edx
	jge	.L4
	movl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
.L4:
	addl	$1, -8(%rbp)
.L3:
	movl	array_size(%rip), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L5
	movl	-4(%rbp), %eax
	cltq
	movl	a(,%rax,4), %eax
	movl	%eax, -16(%rbp)
	movl	-12(%rbp), %eax
	cltq
	movl	a(,%rax,4), %edx
	movl	-4(%rbp), %eax
	cltq
	movl	%edx, a(,%rax,4)
	movl	-12(%rbp), %eax
	cltq
	movl	-16(%rbp), %edx
	movl	%edx, a(,%rax,4)
	addl	$1, -4(%rbp)
.L2:
	movl	array_size(%rip), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L6
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	SelectionSort, .-SelectionSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

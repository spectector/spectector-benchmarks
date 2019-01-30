	.file	"insertionsort.c"
	.text
	.p2align 4
	.globl	insertionSort
	.type	insertionSort, @function
insertionSort:
.LFB0:
	.cfi_startproc
	cmpl	$1, array_size(%rip)
	jle	.L1
	movl	a+4(%rip), %edx
	movl	a(%rip), %eax
	cmpl	%eax, %edx
	jge	.L7
	movl	%eax, a+4(%rip)
	xorl	%eax, %eax
.L5:
	movl	%edx, a(,%rax,4)
.L1:
	ret
.L7:
	movl	$1, %eax
	jmp	.L5
	.cfi_endproc
.LFE0:
	.size	insertionSort, .-insertionSort
	.globl	array_size
	.data
	.align 4
	.type	array_size, @object
	.size	array_size, 4
array_size:
	.long	1
	.globl	a
	.align 4
	.type	a, @object
	.size	a, 4
a:
	.long	1
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

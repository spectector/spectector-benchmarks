	.file	"bubblesort.c"
	.text
	.p2align 4
	.globl	bubbleSort
	.type	bubbleSort, @function
bubbleSort:
.LFB0:
	.cfi_startproc
	movl	array_size(%rip), %eax
	subl	$1, %eax
	js	.L1
	movl	numbers(%rip), %edx
	je	.L1
	movl	numbers+4(%rip), %ecx
	cmpl	%ecx, %edx
	jle	.L1
	movl	%edx, numbers+4(%rip)
	movl	%ecx, numbers(%rip)
	cmpl	$1, %eax
	je	.L11
	.p2align 4,,10
	.p2align 3
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	ret
	.cfi_endproc
.LFE0:
	.size	bubbleSort, .-bubbleSort
	.globl	array_size
	.data
	.align 4
	.type	array_size, @object
	.size	array_size, 4
array_size:
	.long	1
	.globl	numbers
	.align 4
	.type	numbers, @object
	.size	numbers, 4
numbers:
	.long	1
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

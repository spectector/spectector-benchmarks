	.file	"selectionsort.c"
	.text
	.p2align 4
	.globl	SelectionSort
	.type	SelectionSort, @function
SelectionSort:
.LFB0:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE0:
	.size	SelectionSort, .-SelectionSort
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

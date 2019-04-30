	.file	"insertionsort.c"
	.text
	.p2align 4
	.globl	insertionSort
	.type	insertionSort, @function
insertionSort:
.LFB0:
	.cfi_startproc
	leaq	4(%rdi), %r11
	movl	$1, %r10d
	cmpl	$1, %esi
	jle	.L1
	.p2align 4,,10
	.p2align 3
.L6:
	movl	(%r11), %r9d
	movq	%r11, %rax
	movl	%r10d, %edx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	-4(%rax), %ecx
	movq	%rax, %r8
	cmpl	%r9d, %ecx
	jle	.L4
	movl	%ecx, (%rax)
	leaq	-4(%r8), %rax
	subl	$1, %edx
	jne	.L3
	movq	%rdi, %r8
.L4:
	addl	$1, %r10d
	movl	%r9d, (%r8)
	addq	$4, %r11
	cmpl	%r10d, %esi
	jne	.L6
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	insertionSort, .-insertionSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

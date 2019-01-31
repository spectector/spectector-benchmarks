	.file	"bubblesort.c"
	.text
	.p2align 4
	.globl	bubbleSort
	.type	bubbleSort, @function
bubbleSort:
.LFB0:
	.cfi_startproc
	subl	$1, %esi
	movl	%esi, %edx
	js	.L1
	leaq	4(%rdi), %r9
	testl	%edx, %edx
	jle	.L12
	.p2align 4,,10
	.p2align 3
.L7:
	subl	$1, %edx
	movq	%rdi, %rax
	movq	%rdx, %r8
	leaq	(%r9,%rdx,4), %rsi
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%rax), %edx
	movl	4(%rax), %ecx
	cmpl	%ecx, %edx
	jle	.L4
	movl	%ecx, (%rax)
	movl	%edx, 4(%rax)
.L4:
	addq	$4, %rax
	cmpq	%rsi, %rax
	jne	.L5
.L6:
	movl	%r8d, %edx
	testl	%edx, %edx
	jg	.L7
.L12:
	subl	$1, %edx
	movl	%edx, %r8d
	jns	.L6
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	bubbleSort, .-bubbleSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

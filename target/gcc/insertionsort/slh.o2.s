	.file	"insertionsort.c"
	.text
	.p2align 4
	.globl	insertionSort
	.type	insertionSort, @function
insertionSort:
.LFB0:
	.cfi_startproc
	xorl	%eax, %eax
	cmpl	$1, %esi
	setle	%al
	subq	$1, %rax
	je	.L12
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$1, %r11d
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	4(%rdi), %rbx
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%rax, %rdx
	movq	%rbx, %r8
	movl	%r11d, %r9d
	andq	%rbx, %rdx
	movl	(%rdx), %ebp
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L4:
	andq	%rdx, %rax
.L3:
	movq	%rax, %rdx
	movq	%r8, %rcx
	andq	%r8, %rdx
	movl	-4(%rdx), %r10d
	xorl	%edx, %edx
	cmpl	%ebp, %r10d
	setle	%dl
	subq	$1, %rdx
	je	.L5
	subl	$1, %r9d
	andq	%rdx, %rax
	movl	%r10d, (%r8)
	leaq	-4(%rcx), %r8
	cmpl	$1, %r9d
	sbbq	%rdx, %rdx
	xorq	$-1, %rdx
	jne	.L4
	movq	%rdi, %rcx
.L5:
	addl	$1, %r11d
	xorl	%edx, %edx
	addq	$4, %rbx
	movl	%ebp, (%rcx)
	cmpl	%r11d, %esi
	sete	%dl
	subq	$1, %rdx
	je	.L1
	andq	%rdx, %rax
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE0:
	.size	insertionSort, .-insertionSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

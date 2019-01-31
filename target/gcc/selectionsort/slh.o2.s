	.file	"selectionsort.c"
	.text
	.p2align 4
	.globl	SelectionSort
	.type	SelectionSort, @function
SelectionSort:
.LFB0:
	.cfi_startproc
	xorl	%eax, %eax
	cmpl	$1, %esi
	setle	%al
	subq	$1, %rax
	je	.L13
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%r10d, %r10d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leal	-1(%rsi), %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L11:
	movq	%rbx, %rdx
	leal	1(%r10), %r11d
	leaq	4(%rbx), %r13
	movq	%rbx, %r9
	andq	%rax, %rdx
	movl	(%rdx), %ebp
	xorl	%edx, %edx
	cmpl	%r11d, %esi
	setle	%dl
	subq	$1, %rdx
	movl	%ebp, %r8d
	je	.L4
	leaq	4(%rbx), %r13
	andq	%rdx, %rax
	movl	%r11d, %r14d
	movq	%r13, %rcx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L17:
	andq	%r15, %rax
	movl	%edx, %r8d
	movl	%r14d, %r10d
.L6:
	addl	$1, %r14d
	xorl	%edx, %edx
	addq	$4, %rcx
	cmpl	%r14d, %esi
	sete	%dl
	subq	$1, %rdx
	je	.L4
	andq	%rdx, %rax
.L8:
	movq	%rcx, %rdx
	xorl	%r15d, %r15d
	movq	%rcx, %r9
	andq	%rax, %rdx
	movl	(%rdx), %edx
	cmpl	%r8d, %edx
	setge	%r15b
	subq	$1, %r15
	jne	.L17
	movslq	%r10d, %rdx
	leaq	(%rdi,%rdx,4), %r9
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%edx, %edx
	cmpl	%r12d, %r11d
	movl	%r8d, (%rbx)
	movq	%r13, %rbx
	sete	%dl
	movl	%ebp, (%r9)
	subq	$1, %rdx
	je	.L1
	andq	%rdx, %rax
	movl	%r11d, %r10d
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE0:
	.size	SelectionSort, .-SelectionSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

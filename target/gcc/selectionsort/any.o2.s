	.file	"selectionsort.c"
	.text
	.p2align 4
	.globl	SelectionSort
	.type	SelectionSort, @function
SelectionSort:
.LFB0:
	.cfi_startproc
	cmpl	$1, %esi
	jle	.L14
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%r11d, %r11d
	leal	-1(%rsi), %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%r11d, %r10d
	addl	$1, %r11d
	movl	(%rbx), %ebp
	cmpl	%r11d, %esi
	jle	.L8
	leaq	4(%rbx), %r12
	movl	%ebp, %r8d
	movl	%r11d, %edx
	movq	%r12, %rax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L18:
	movslq	%r10d, %rcx
	addl	$1, %edx
	addq	$4, %rax
	leaq	(%rdi,%rcx,4), %r9
	cmpl	%edx, %esi
	je	.L3
.L5:
	movl	(%rax), %ecx
	movq	%rax, %r9
	cmpl	%r8d, %ecx
	jge	.L18
	movl	%edx, %r10d
	addl	$1, %edx
	movl	%ecx, %r8d
	addq	$4, %rax
	cmpl	%edx, %esi
	jne	.L5
.L3:
	movl	%r8d, (%rbx)
	movq	%r12, %rbx
	movl	%ebp, (%r9)
	cmpl	%r13d, %r11d
	jne	.L6
.L19:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore_state
	movq	%rbx, %r9
	movl	%ebp, %r8d
	leaq	4(%rbx), %r12
	movl	%r8d, (%rbx)
	movq	%r12, %rbx
	movl	%ebp, (%r9)
	cmpl	%r13d, %r11d
	jne	.L6
	jmp	.L19
.L14:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE0:
	.size	SelectionSort, .-SelectionSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

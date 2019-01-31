	.file	"bubblesort.c"
	.text
	.p2align 4
	.globl	bubbleSort
	.type	bubbleSort, @function
bubbleSort:
.LFB0:
	.cfi_startproc
	leal	-1(%rsi), %ecx
	movslq	%ecx, %rax
	sarq	$63, %rax
	xorq	$-1, %rax
	je	.L1
	xorl	%edx, %edx
	testl	%ecx, %ecx
	leaq	4(%rdi), %r11
	setle	%dl
	subq	$1, %rdx
	je	.L18
	.p2align 4,,10
	.p2align 3
.L11:
	subl	$1, %ecx
	andq	%rdx, %rax
	movq	%rdi, %rdx
	movq	%rcx, %r10
	leaq	(%r11,%rcx,4), %r9
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L19:
	andq	%rcx, %rax
.L7:
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movl	(%rcx), %esi
	movl	4(%rcx), %r8d
	xorl	%ecx, %ecx
	cmpl	%r8d, %esi
	setle	%cl
	subq	$1, %rcx
	je	.L5
	movl	%r8d, (%rdx)
	andq	%rcx, %rax
	movl	%esi, 4(%rdx)
.L5:
	addq	$4, %rdx
	xorl	%ecx, %ecx
	cmpq	%r9, %rdx
	sete	%cl
	subq	$1, %rcx
	jne	.L19
.L10:
	movl	%r10d, %ecx
	xorl	%edx, %edx
	testl	%ecx, %ecx
	setle	%dl
	subq	$1, %rdx
	jne	.L11
.L18:
	leal	-1(%rcx), %r10d
	movslq	%r10d, %rdx
	sarq	$63, %rdx
	xorq	$-1, %rdx
	jne	.L20
.L1:
	ret
.L20:
	andq	%rdx, %rax
	jmp	.L10
	.cfi_endproc
.LFE0:
	.size	bubbleSort, .-bubbleSort
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

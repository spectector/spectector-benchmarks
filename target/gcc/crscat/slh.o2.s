	.file	"crscat.c"
	.text
	.p2align 4
	.globl	cstrcat
	.type	cstrcat, @function
cstrcat:
.LFB0:
	.cfi_startproc
	cmpb	$1, (%rdi)
	movq	%rdi, %rax
	movq	%rdi, %r9
	sbbq	%rdx, %rdx
	notq	%rdx
	testq	%rdx, %rdx
	jne	.L5
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L11:
	andq	%rcx, %rdx
.L5:
	addq	$1, %r9
	movq	%r9, %rcx
	andq	%rdx, %rcx
	cmpb	$1, (%rcx)
	sbbq	%rcx, %rcx
	xorq	$-1, %rcx
	jne	.L11
.L3:
	xorl	%r8d, %r8d
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L12:
	andq	%rcx, %rdx
.L7:
	leaq	(%rsi,%r8), %rcx
	andq	%rdx, %rcx
	movzbl	(%rcx), %ecx
	movb	%cl, (%r9,%r8)
	addq	$1, %r8
	cmpb	$1, %cl
	sbbq	%rcx, %rcx
	xorq	$-1, %rcx
	jne	.L12
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	movq	$-1, %rdx
	jmp	.L3
	.cfi_endproc
.LFE0:
	.size	cstrcat, .-cstrcat
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

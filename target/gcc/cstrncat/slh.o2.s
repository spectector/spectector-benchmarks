	.file	"cstrncat.c"
	.text
	.p2align 4
	.globl	cstrncat
	.type	cstrncat, @function
cstrncat:
.LFB0:
	.cfi_startproc
	cmpb	$1, (%rdi)
	movq	%rdi, %rax
	sbbq	%rcx, %rcx
	xorq	$-1, %rcx
	je	.L2
	movq	%rdi, %r8
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L15:
	andq	%r9, %rcx
.L5:
	addq	$1, %r8
	movq	%r8, %rdi
	andq	%rcx, %rdi
	cmpb	$1, (%rdi)
	sbbq	%r9, %r9
	xorq	$-1, %r9
	jne	.L15
.L4:
	cmpl	$1, %edx
	sbbq	%rdi, %rdi
	xorq	$-1, %rdi
	je	.L13
	subl	$1, %edx
	andq	%rdi, %rcx
	leaq	1(%rsi,%rdx), %rdi
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L7:
	andq	%rdx, %rcx
	addq	$1, %r8
	xorl	%edx, %edx
	cmpq	%rdi, %rsi
	sete	%dl
	subq	$1, %rdx
	je	.L6
	andq	%rdx, %rcx
.L12:
	addq	$1, %rsi
	movq	%rsi, %rdx
	andq	%rcx, %rdx
	movzbl	-1(%rdx), %edx
	cmpb	$1, %dl
	movb	%dl, (%r8)
	sbbq	%rdx, %rdx
	xorq	$-1, %rdx
	jne	.L7
	ret
.L13:
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	andq	%r8, %rcx
	cmpb	$1, (%rcx)
	sbbq	%rdx, %rdx
	testq	%rdx, %rdx
	jne	.L13
	movb	$0, (%r8)
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	movq	$-1, %rcx
	movq	%rdi, %r8
	jmp	.L4
	.cfi_endproc
.LFE0:
	.size	cstrncat, .-cstrncat
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

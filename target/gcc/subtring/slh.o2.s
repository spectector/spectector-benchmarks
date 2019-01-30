	.file	"subtring.c"
	.text
	.p2align 4
	.globl	substring
	.type	substring, @function
substring:
.LFB0:
	.cfi_startproc
	cmpb	$1, (%rdi)
	sbbq	%rax, %rax
	xorq	$-1, %rax
	je	.L12
	movq	%rsi, %rdx
	andq	%rax, %rdx
	movzbl	(%rdx), %r9d
	cmpb	$1, %r9b
	sbbq	%rdx, %rdx
	xorq	$-1, %rdx
	je	.L7
	.p2align 4,,10
	.p2align 3
.L14:
	andq	%rdx, %rax
	movl	%r9d, %r8d
	xorl	%ecx, %ecx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L5:
	addq	$1, %rcx
	andq	%rdx, %rax
	leaq	(%rsi,%rcx), %rdx
	andq	%rax, %rdx
	movzbl	(%rdx), %r8d
	cmpb	$1, %r8b
	sbbq	%rdx, %rdx
	xorq	$-1, %rdx
	je	.L7
	andq	%rdx, %rax
.L8:
	leaq	(%rdi,%rcx), %rdx
	andq	%rax, %rdx
	cmpb	%r8b, (%rdx)
	setne	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	jne	.L5
	addq	$1, %rdi
	movq	%rdi, %rdx
	andq	%rax, %rdx
	cmpb	$1, (%rdx)
	sbbq	%rdx, %rdx
	xorq	$-1, %rdx
	je	.L12
	andq	%rdx, %rax
	cmpb	$1, %r9b
	sbbq	%rdx, %rdx
	xorq	$-1, %rdx
	jne	.L14
.L7:
	movl	$1, %eax
	ret
.L12:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	substring, .-substring
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

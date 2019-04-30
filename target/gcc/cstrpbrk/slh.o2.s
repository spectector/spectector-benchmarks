	.file	"cstrpbrk.c"
	.text
	.p2align 4
	.globl	cstrpbrk
	.type	cstrpbrk, @function
cstrpbrk:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %r9d
	movq	%rdi, %rax
	cmpb	$1, %r9b
	sbbq	%rdx, %rdx
	xorq	$-1, %rdx
	je	.L13
	movq	%rsi, %rcx
	andq	%rdx, %rcx
	movzbl	(%rcx), %r10d
	cmpb	$1, %r10b
	sbbq	%rcx, %rcx
	xorq	$-1, %rcx
	je	.L1
	.p2align 4,,10
	.p2align 3
.L15:
	andq	%rcx, %rdx
	movq	%rsi, %r8
	movl	%r10d, %edi
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L6:
	addq	$1, %r8
	andq	%rcx, %rdx
	movq	%r8, %rcx
	andq	%rdx, %rcx
	movzbl	(%rcx), %edi
	cmpb	$1, %dil
	sbbq	%rcx, %rcx
	xorq	$-1, %rcx
	je	.L1
	andq	%rcx, %rdx
.L9:
	xorl	%ecx, %ecx
	cmpb	%dil, %r9b
	sete	%cl
	subq	$1, %rcx
	jne	.L6
	addq	$1, %rax
	movq	%rax, %rcx
	andq	%rdx, %rcx
	movzbl	(%rcx), %r9d
	cmpb	$1, %r9b
	sbbq	%rcx, %rcx
	xorq	$-1, %rcx
	je	.L13
	andq	%rcx, %rdx
	cmpb	$1, %r10b
	sbbq	%rcx, %rcx
	xorq	$-1, %rcx
	jne	.L15
.L1:
	ret
.L13:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	cstrpbrk, .-cstrpbrk
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

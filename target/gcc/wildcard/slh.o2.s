	.file	"wildcard.c"
	.text
	.p2align 4
	.globl	wildcardcmp
	.type	wildcardcmp, @function
wildcardcmp:
.LFB11:
	.cfi_startproc
	testq	%rdi, %rdi
	sete	%dl
	testq	%rsi, %rsi
	sete	%al
	orl	%eax, %edx
	xorl	%eax, %eax
	andl	$1, %edx
	je	.L16
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	movzbl	(%rsi), %edx
	movzbl	(%rdi), %r8d
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
	movq	$-1, %rax
.L3:
	cmpb	$1, %dl
	sbbq	%rcx, %rcx
	testq	%rcx, %rcx
	je	.L4
.L17:
	andq	%rcx, %rax
	cmpb	$1, %r8b
	sbbq	%rdx, %rdx
	testq	%rdx, %rdx
	jne	.L13
	movq	%r9, %rdx
	andq	%rax, %rdx
	movzbl	(%rdx), %edx
	cmpb	$1, %dl
	sbbq	%rcx, %rcx
	testq	%rcx, %rcx
	jne	.L14
	movq	%r10, %rcx
	movq	%r9, %rsi
	addq	$1, %r9
	movq	%r10, %rdi
	andq	%rax, %rcx
	cmpb	$1, %dl
	movzbl	(%rcx), %r8d
	sbbq	%rcx, %rcx
	testq	%rcx, %rcx
	jne	.L17
.L4:
	xorl	%ecx, %ecx
	cmpb	%r8b, %dl
	sete	%cl
	subq	$1, %rcx
	je	.L9
	andq	%rcx, %rax
	xorl	%ecx, %ecx
	cmpb	$42, %r8b
	setne	%cl
	subq	$1, %rcx
	jne	.L18
	cmpq	$1, %r10
	sbbq	%rdx, %rdx
	xorq	$-1, %rdx
	je	.L14
	andq	%rdx, %rax
	movq	%rsi, %rdx
	addq	$1, %rsi
	andq	%rax, %rdx
	movzbl	1(%rdx), %edx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L14:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	andq	%rcx, %rax
	movq	%rdi, %rcx
	andq	%rax, %rcx
	movzbl	1(%rcx), %r8d
	cmpb	$1, %r8b
	sbbq	%rcx, %rcx
	xorq	$-1, %rcx
	jne	.L11
.L13:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	addq	$1, %rsi
	addq	$1, %rdi
	andq	%rax, %rdx
	andq	%rax, %rcx
	movzbl	1(%rdx), %edx
	movzbl	1(%rcx), %r8d
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L11:
	addq	$1, %rdi
	andq	%rcx, %rax
	movq	%rsi, %r9
	movq	%rdi, %r10
	jmp	.L3
	.cfi_endproc
.LFE11:
	.size	wildcardcmp, .-wildcardcmp
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

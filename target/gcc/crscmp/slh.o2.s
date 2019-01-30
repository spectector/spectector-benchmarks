	.file	"crscmp.c"
	.text
	.p2align 4
	.globl	cstrcmp
	.type	cstrcmp, @function
cstrcmp:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %ecx
	cmpb	$1, %cl
	sbbq	%rax, %rax
	notq	%rax
	testq	%rax, %rax
	jne	.L4
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L6:
	addq	$1, %rdi
	andq	%rdx, %rax
	addq	$1, %rsi
	movq	%rdi, %rdx
	andq	%rax, %rdx
	movzbl	(%rdx), %ecx
	cmpb	$1, %cl
	sbbq	%rdx, %rdx
	xorq	$-1, %rdx
	je	.L12
	andq	%rdx, %rax
.L4:
	movq	%rsi, %rdx
	andq	%rax, %rdx
	cmpb	%cl, (%rdx)
	setne	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	jne	.L6
.L3:
	andq	%rsi, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %cl
	sbbq	%rdx, %rdx
	testq	%rdx, %rdx
	je	.L7
	movl	$-1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	cmpb	%al, %cl
	seta	%al
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	xorl	%ecx, %ecx
	jmp	.L3
.L11:
	movq	$-1, %rax
	xorl	%ecx, %ecx
	jmp	.L3
	.cfi_endproc
.LFE0:
	.size	cstrcmp, .-cstrcmp
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

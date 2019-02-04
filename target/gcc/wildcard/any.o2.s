	.file	"wildcard.c"
	.text
	.p2align 4
	.globl	wildcardcmp
	.type	wildcardcmp, @function
wildcardcmp:
.LFB11:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L12
	testq	%rsi, %rsi
	jne	.L14
.L12:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	movzbl	(%rsi), %eax
	movzbl	(%rdi), %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
.L3:
	testb	%al, %al
	jne	.L4
.L15:
	testb	%dl, %dl
	je	.L10
	movzbl	(%rcx), %eax
	testb	%al, %al
	je	.L12
	movq	%rcx, %rsi
	movzbl	(%r8), %edx
	addq	$1, %rcx
	movq	%r8, %rdi
	testb	%al, %al
	je	.L15
.L4:
	cmpb	%dl, %al
	je	.L6
	cmpb	$42, %dl
	je	.L16
	testq	%r8, %r8
	je	.L12
	movzbl	1(%rsi), %eax
	addq	$1, %rsi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L16:
	movzbl	1(%rdi), %edx
	testb	%dl, %dl
	jne	.L8
.L10:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movzbl	1(%rsi), %eax
	movzbl	1(%rdi), %edx
	addq	$1, %rsi
	addq	$1, %rdi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L8:
	addq	$1, %rdi
	movq	%rsi, %rcx
	movq	%rdi, %r8
	jmp	.L3
	.cfi_endproc
.LFE11:
	.size	wildcardcmp, .-wildcardcmp
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

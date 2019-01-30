	.file	"sumofthird.c"
	.text
	.p2align 4
	.globl	sumOfThirdBytes
	.type	sumOfThirdBytes, @function
sumOfThirdBytes:
.LFB0:
	.cfi_startproc
	xorl	%r8d, %r8d
	testl	%esi, %esi
	setle	%r8b
	subq	$1, %r8
	je	.L10
	leal	-1(%rsi), %eax
	leaq	2(%rdi), %rcx
	leaq	6(%rdi,%rax,4), %rsi
	xorl	%eax, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L11:
	andq	%rdx, %r8
.L5:
	movq	%r8, %rdx
	andq	%rcx, %rdx
	addq	$4, %rcx
	movsbl	(%rdx), %edx
	addl	%edx, %eax
	xorl	%edx, %edx
	cmpq	%rsi, %rcx
	sete	%dl
	subq	$1, %rdx
	jne	.L11
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	sumOfThirdBytes, .-sumOfThirdBytes
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

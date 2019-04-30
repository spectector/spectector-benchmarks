	.file	"crscmp.c"
	.text
	.p2align 4
	.globl	cstrcmp
	.type	cstrcmp, @function
cstrcmp:
.LFB0:
	.cfi_startproc
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L13:
	cmpb	%al, (%rsi)
	jne	.L12
	addq	$1, %rdi
	addq	$1, %rsi
.L10:
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L13
	xorl	%edx, %edx
	xorl	%eax, %eax
	cmpb	(%rsi), %dl
	movl	$-1, %edx
	seta	%al
	cmovb	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	movl	%eax, %edx
	xorl	%eax, %eax
	cmpb	(%rsi), %dl
	movl	$-1, %edx
	seta	%al
	cmovb	%edx, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	cstrcmp, .-cstrcmp
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

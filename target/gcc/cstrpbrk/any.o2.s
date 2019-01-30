	.file	"cstrpbrk.c"
	.text
	.p2align 4
	.globl	cstrpbrk
	.type	cstrpbrk, @function
cstrpbrk:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %r8d
	movq	%rdi, %rax
	testb	%r8b, %r8b
	je	.L7
	movzbl	(%rsi), %edi
	.p2align 4,,10
	.p2align 3
.L3:
	testb	%dil, %dil
	je	.L13
	movq	%rsi, %rcx
	movl	%edi, %edx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L4:
	movzbl	1(%rcx), %edx
	addq	$1, %rcx
	testb	%dl, %dl
	je	.L14
.L5:
	cmpb	%dl, %r8b
	jne	.L4
	movzbl	1(%rax), %r8d
	addq	$1, %rax
	testb	%r8b, %r8b
	jne	.L3
.L7:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	ret
.L13:
	ret
	.cfi_endproc
.LFE0:
	.size	cstrpbrk, .-cstrpbrk
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

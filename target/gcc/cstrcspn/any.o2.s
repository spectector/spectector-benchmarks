	.file	"cstrcspn.c"
	.text
	.p2align 4
	.globl	cstrcspn
	.type	cstrcspn, @function
cstrcspn:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %r8d
	testb	%r8b, %r8b
	je	.L8
	movzbl	(%rsi), %r9d
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rsi, %rcx
	movl	%r9d, %edx
	testb	%r9b, %r9b
	jne	.L7
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L5:
	movzbl	1(%rcx), %edx
	addq	$1, %rcx
	testb	%dl, %dl
	je	.L4
.L7:
	cmpb	%r8b, %dl
	jne	.L5
	subl	%edi, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	movzbl	1(%rax), %r8d
	addq	$1, %rax
	testb	%r8b, %r8b
	jne	.L3
	subl	%edi, %eax
	ret
.L8:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	cstrcspn, .-cstrcspn
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

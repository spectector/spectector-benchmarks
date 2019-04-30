	.file	"crschr.c"
	.text
	.p2align 4
	.globl	cstrchr
	.type	cstrchr, @function
cstrchr:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %eax
	movl	%esi, %r8d
	cmpb	$1, %al
	sbbq	%rdx, %rdx
	notq	%rdx
	testq	%rdx, %rdx
	jne	.L4
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L6:
	addq	$1, %rdi
	andq	%rcx, %rdx
	movq	%rdi, %rax
	andq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$1, %al
	sbbq	%rcx, %rcx
	xorq	$-1, %rcx
	je	.L10
	andq	%rcx, %rdx
.L4:
	xorl	%ecx, %ecx
	cmpb	%al, %r8b
	sete	%cl
	subq	$1, %rcx
	jne	.L6
	movsbl	%sil, %eax
	cmpl	%eax, %esi
	movl	$0, %eax
	cmove	%rdi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	xorl	%eax, %eax
	cmpl	%eax, %esi
	movl	$0, %eax
	cmove	%rdi, %rax
	ret
	.cfi_endproc
.LFE0:
	.size	cstrchr, .-cstrchr
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

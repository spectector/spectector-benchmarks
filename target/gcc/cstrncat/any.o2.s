	.file	"cstrncat.c"
	.text
	.p2align 4
	.globl	cstrncat
	.type	cstrncat, @function
cstrncat:
.LFB0:
	.cfi_startproc
	cmpb	$0, (%rdi)
	movq	%rdi, %rax
	movq	%rdi, %rcx
	je	.L2
	.p2align 4,,10
	.p2align 3
.L3:
	addq	$1, %rcx
	cmpb	$0, (%rcx)
	jne	.L3
.L2:
	testl	%edx, %edx
	je	.L11
	subl	$1, %edx
	leaq	1(%rsi,%rdx), %r8
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L5:
	addq	$1, %rcx
	cmpq	%r8, %rsi
	je	.L4
.L8:
	movzbl	(%rsi), %edx
	addq	$1, %rsi
	movb	%dl, (%rcx)
	testb	%dl, %dl
	jne	.L5
	ret
.L11:
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	cmpb	$0, (%rcx)
	je	.L11
	movb	$0, (%rcx)
	ret
	.cfi_endproc
.LFE0:
	.size	cstrncat, .-cstrncat
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

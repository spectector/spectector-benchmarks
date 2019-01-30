	.file	"crscat.c"
	.text
	.p2align 4
	.globl	cstrcat
	.type	cstrcat, @function
cstrcat:
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
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movzbl	(%rsi,%rdx), %r8d
	movb	%r8b, (%rcx,%rdx)
	addq	$1, %rdx
	testb	%r8b, %r8b
	jne	.L4
	ret
	.cfi_endproc
.LFE0:
	.size	cstrcat, .-cstrcat
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

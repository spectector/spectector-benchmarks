	.text
	.file	"crscat.c"
	.globl	cstrcat                 # -- Begin function cstrcat
	.p2align	4, 0x90
	.type	cstrcat,@function
cstrcat:                                # @cstrcat
	.cfi_startproc
# %bb.0:
	movq	%rdi, %rax
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	lfence
	cmpb	$0, (%rax)
	leaq	1(%rax), %rax
	jne	.LBB0_1
# %bb.2:                                # %.preheader
	lfence
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	lfence
	movzbl	(%rsi,%rcx), %edx
	movb	%dl, -1(%rax,%rcx)
	addq	$1, %rcx
	testb	%dl, %dl
	jne	.LBB0_3
# %bb.4:
	lfence
	movq	%rdi, %rax
	retq
.Lfunc_end0:
	.size	cstrcat, .Lfunc_end0-cstrcat
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

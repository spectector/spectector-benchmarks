	.text
	.file	"cstrncat.c"
	.globl	cstrncat                # -- Begin function cstrncat
	.p2align	4, 0x90
	.type	cstrncat,@function
cstrncat:                               # @cstrncat
	.cfi_startproc
# %bb.0:
	leaq	-1(%rdi), %rax
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmpb	$0, 1(%rax)
	leaq	1(%rax), %rax
	jne	.LBB0_1
# %bb.2:
	testl	%edx, %edx
	je	.LBB0_8
# %bb.3:                                # %.preheader
	movl	%edx, %r8d
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rsi,%rcx), %edx
	movb	%dl, (%rax,%rcx)
	testb	%dl, %dl
	je	.LBB0_8
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	addq	$1, %rcx
	cmpl	%ecx, %r8d
	jne	.LBB0_4
# %bb.6:
	cmpb	$0, (%rax,%rcx)
	je	.LBB0_8
# %bb.7:
	movb	$0, (%rax,%rcx)
.LBB0_8:
	movq	%rdi, %rax
	retq
.Lfunc_end0:
	.size	cstrncat, .Lfunc_end0-cstrncat
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

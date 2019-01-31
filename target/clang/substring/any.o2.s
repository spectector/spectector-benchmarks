	.text
	.file	"substring.c"
	.globl	substring               # -- Begin function substring
	.p2align	4, 0x90
	.type	substring,@function
substring:                              # @substring
	.cfi_startproc
# %bb.0:
	movb	(%rdi), %dl
	xorl	%eax, %eax
	testb	%dl, %dl
	je	.LBB0_9
# %bb.1:
	movb	(%rsi), %r8b
	testb	%r8b, %r8b
	je	.LBB0_2
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	cmpb	%dl, %r8b
	jne	.LBB0_8
# %bb.4:                                # %.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	$1, %edx
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rsi,%rdx), %ecx
	testb	%cl, %cl
	je	.LBB0_6
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=2
	cmpb	(%rdi,%rdx), %cl
	leaq	1(%rdx), %rdx
	je	.LBB0_5
.LBB0_8:                                #   in Loop: Header=BB0_3 Depth=1
	movb	1(%rdi), %dl
	addq	$1, %rdi
	testb	%dl, %dl
	jne	.LBB0_3
.LBB0_9:
	retq
.LBB0_6:
	movl	$1, %eax
	retq
.LBB0_2:
	movl	$1, %eax
	retq
.Lfunc_end0:
	.size	substring, .Lfunc_end0-substring
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

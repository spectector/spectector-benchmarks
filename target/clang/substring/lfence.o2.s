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
	je	.LBB0_10
# %bb.1:
	lfence
	movb	(%rsi), %r8b
	testb	%r8b, %r8b
	je	.LBB0_2
# %bb.3:                                # %.preheader2
	lfence
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	lfence
	cmpb	%dl, %r8b
	jne	.LBB0_9
# %bb.5:                                # %.preheader
                                        #   in Loop: Header=BB0_4 Depth=1
	lfence
	movl	$1, %edx
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lfence
	movzbl	(%rsi,%rdx), %ecx
	testb	%cl, %cl
	je	.LBB0_7
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=2
	lfence
	cmpb	(%rdi,%rdx), %cl
	leaq	1(%rdx), %rdx
	je	.LBB0_6
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	lfence
	movb	1(%rdi), %dl
	addq	$1, %rdi
	testb	%dl, %dl
	jne	.LBB0_4
.LBB0_10:
	lfence
	retq
.LBB0_7:
	movl	$1, %eax
	lfence
	retq
.LBB0_2:
	movl	$1, %eax
	lfence
	retq
.Lfunc_end0:
	.size	substring, .Lfunc_end0-substring
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

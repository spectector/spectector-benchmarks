	.text
	.file	"wildcard.c"
	.globl	wildcardcmp             # -- Begin function wildcardcmp
	.p2align	4, 0x90
	.type	wildcardcmp,@function
wildcardcmp:                            # @wildcardcmp
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.LBB0_13
# %bb.1:
	lfence
	testq	%rsi, %rsi
	je	.LBB0_13
# %bb.2:
	lfence
	xorl	%r8d, %r8d
	xorl	%edx, %edx
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	lfence
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_16:                               #   in Loop: Header=BB0_4 Depth=2
	lfence
	addq	$1, %rsi
.LBB0_4:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rsi), %ecx
	movzbl	(%rdi), %eax
	testb	%cl, %cl
	jne	.LBB0_10
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=2
	lfence
	testb	%al, %al
	je	.LBB0_6
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=2
	lfence
	movzbl	(%rdx), %ecx
	testb	%cl, %cl
	je	.LBB0_8
# %bb.9:                                #   in Loop: Header=BB0_4 Depth=2
	lfence
	movzbl	(%r8), %eax
	movq	%r8, %rdi
	movq	%rdx, %rsi
	leaq	1(%rdx), %rdx
.LBB0_10:                               #   in Loop: Header=BB0_4 Depth=2
	lfence
	cmpb	%cl, %al
	jne	.LBB0_11
# %bb.15:                               #   in Loop: Header=BB0_4 Depth=2
	lfence
	addq	$1, %rdi
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_4 Depth=2
	lfence
	cmpb	$42, %al
	je	.LBB0_12
# %bb.14:                               #   in Loop: Header=BB0_4 Depth=2
	lfence
	testq	%r8, %r8
	jne	.LBB0_16
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_3 Depth=1
	lfence
	movl	$1, %eax
	cmpb	$0, 1(%rdi)
	leaq	1(%rdi), %rdi
	movq	%rdi, %r8
	movq	%rsi, %rdx
	jne	.LBB0_3
.LBB0_13:
	lfence
	retq
.LBB0_8:
	lfence
	xorl	%eax, %eax
	lfence
	retq
.LBB0_6:
	lfence
	movl	$1, %eax
	lfence
	retq
.Lfunc_end0:
	.size	wildcardcmp, .Lfunc_end0-wildcardcmp
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

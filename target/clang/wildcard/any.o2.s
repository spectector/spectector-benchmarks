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
	je	.LBB0_12
# %bb.1:
	testq	%rsi, %rsi
	je	.LBB0_12
# %bb.2:
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_16:                               #   in Loop: Header=BB0_3 Depth=1
	addq	$1, %rsi
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rsi), %eax
	movzbl	(%rdi), %ecx
	testb	%al, %al
	je	.LBB0_4
# %bb.9:                                #   in Loop: Header=BB0_3 Depth=1
	cmpb	%al, %cl
	jne	.LBB0_10
.LBB0_15:                               #   in Loop: Header=BB0_3 Depth=1
	addq	$1, %rdi
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=1
	testb	%cl, %cl
	je	.LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.LBB0_7
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=1
	movzbl	(%r8), %ecx
	movq	%r8, %rdi
	movq	%rdx, %rsi
	leaq	1(%rdx), %rdx
	cmpb	%al, %cl
	je	.LBB0_15
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=1
	cmpb	$42, %cl
	je	.LBB0_11
# %bb.13:                               #   in Loop: Header=BB0_3 Depth=1
	testq	%r8, %r8
	jne	.LBB0_16
	jmp	.LBB0_14
.LBB0_11:                               #   in Loop: Header=BB0_3 Depth=1
	movl	$1, %eax
	cmpb	$0, 1(%rdi)
	leaq	1(%rdi), %rdi
	movq	%rdi, %r8
	movq	%rsi, %rdx
	jne	.LBB0_3
.LBB0_12:
	retq
.LBB0_14:
	xorl	%eax, %eax
	retq
.LBB0_5:
	movl	$1, %eax
	retq
.LBB0_7:
	xorl	%eax, %eax
	retq
.Lfunc_end0:
	.size	wildcardcmp, .Lfunc_end0-wildcardcmp
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

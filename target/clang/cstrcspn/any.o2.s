	.text
	.file	"cstrcspn.c"
	.globl	cstrcspn                # -- Begin function cstrcspn
	.p2align	4, 0x90
	.type	cstrcspn,@function
cstrcspn:                               # @cstrcspn
	.cfi_startproc
# %bb.0:
	movb	(%rdi), %r8b
	movq	%rdi, %rax
	testb	%r8b, %r8b
	je	.LBB0_7
# %bb.1:
	movq	%rdi, %rax
	.p2align	4, 0x90
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movq	%rsi, %rdx
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rdx), %ecx
	cmpb	%r8b, %cl
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	addq	$1, %rdx
	testb	%cl, %cl
	jne	.LBB0_3
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	cmpb	%r8b, %cl
	je	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_2 Depth=1
	movb	1(%rax), %r8b
	addq	$1, %rax
	testb	%r8b, %r8b
	jne	.LBB0_2
.LBB0_7:
	subl	%edi, %eax
                                        # kill: def $eax killed $eax killed $rax
	retq
.Lfunc_end0:
	.size	cstrcspn, .Lfunc_end0-cstrcspn
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

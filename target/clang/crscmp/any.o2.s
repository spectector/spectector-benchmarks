	.text
	.file	"crscmp.c"
	.globl	cstrcmp                 # -- Begin function cstrcmp
	.p2align	4, 0x90
	.type	cstrcmp,@function
cstrcmp:                                # @cstrcmp
	.cfi_startproc
# %bb.0:
	movb	(%rdi), %al
	testb	%al, %al
	je	.LBB0_4
# %bb.1:
	addq	$1, %rdi
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	cmpb	(%rsi), %al
	jne	.LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	addq	$1, %rsi
	movzbl	(%rdi), %eax
	addq	$1, %rdi
	testb	%al, %al
	jne	.LBB0_2
.LBB0_4:
	xorl	%eax, %eax
.LBB0_5:
	xorl	%ecx, %ecx
	cmpb	(%rsi), %al
	seta	%cl
	movl	$-1, %eax
	cmovael	%ecx, %eax
	retq
.Lfunc_end0:
	.size	cstrcmp, .Lfunc_end0-cstrcmp
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

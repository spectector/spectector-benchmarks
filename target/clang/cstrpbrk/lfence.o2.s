	.text
	.file	"cstrpbrk.c"
	.globl	cstrpbrk                # -- Begin function cstrpbrk
	.p2align	4, 0x90
	.type	cstrpbrk,@function
cstrpbrk:                               # @cstrpbrk
	.cfi_startproc
# %bb.0:
	movb	(%rdi), %al
	testb	%al, %al
	je	.LBB0_7
# %bb.1:                                # %.preheader
	lfence
	.p2align	4, 0x90
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	lfence
	movq	%rsi, %rcx
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lfence
	movzbl	(%rcx), %edx
	cmpb	%al, %dl
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	addq	$1, %rcx
	testb	%dl, %dl
	jne	.LBB0_3
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	lfence
	cmpb	%al, %dl
	jne	.LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_2 Depth=1
	lfence
	movb	1(%rdi), %al
	addq	$1, %rdi
	testb	%al, %al
	jne	.LBB0_2
.LBB0_7:
	lfence
	xorl	%edi, %edi
.LBB0_8:
	lfence
	movq	%rdi, %rax
	retq
.Lfunc_end0:
	.size	cstrpbrk, .Lfunc_end0-cstrpbrk
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

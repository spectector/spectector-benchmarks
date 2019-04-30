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
	jne	.LBB0_2
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	movb	1(%rdi), %al
	addq	$1, %rdi
	testb	%al, %al
	je	.LBB0_7
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movq	%rsi, %rcx
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rcx), %edx
	cmpb	%al, %dl
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	addq	$1, %rcx
	testb	%dl, %dl
	jne	.LBB0_3
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	cmpb	%al, %dl
	je	.LBB0_6
# %bb.8:
	movq	%rdi, %rax
	retq
.LBB0_7:
	xorl	%edi, %edi
	movq	%rdi, %rax
	retq
.Lfunc_end0:
	.size	cstrpbrk, .Lfunc_end0-cstrpbrk
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

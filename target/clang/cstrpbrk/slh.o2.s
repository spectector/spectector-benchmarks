	.text
	.file	"cstrpbrk.c"
	.globl	cstrpbrk                # -- Begin function cstrpbrk
	.p2align	4, 0x90
	.type	cstrpbrk,@function
cstrpbrk:                               # @cstrpbrk
	.cfi_startproc
# %bb.0:
	movq	%rsp, %rcx
	movq	$-1, %r8
	sarq	$63, %rcx
	movb	(%rdi), %r9b
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	cmovneq	%r8, %rcx
	movb	1(%rdi), %r9b
	addq	$1, %rdi
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	orb	%cl, %r9b
	testb	%r9b, %r9b
	je	.LBB0_8
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%r8, %rcx
	movq	%rsi, %rdx
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=2
	cmoveq	%r8, %rcx
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rdx), %eax
	orb	%cl, %al
	cmpb	%r9b, %al
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	cmoveq	%r8, %rcx
	addq	$1, %rdx
	testb	%al, %al
	jne	.LBB0_10
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	cmovneq	%r8, %rcx
	cmpb	%r9b, %al
	je	.LBB0_7
# %bb.6:
	cmoveq	%r8, %rcx
	jmp	.LBB0_9
.LBB0_8:
	cmovneq	%r8, %rcx
	xorl	%edi, %edi
.LBB0_9:
	shlq	$47, %rcx
	movq	%rdi, %rax
	orq	%rcx, %rsp
	retq
.Lfunc_end0:
	.size	cstrpbrk, .Lfunc_end0-cstrpbrk
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

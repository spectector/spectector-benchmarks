	.text
	.file	"cstrcspn.c"
	.globl	cstrcspn                # -- Begin function cstrcspn
	.p2align	4, 0x90
	.type	cstrcspn,@function
cstrcspn:                               # @cstrcspn
	.cfi_startproc
# %bb.0:
	movq	%rsp, %r10
	movq	$-1, %r8
	sarq	$63, %r10
	movb	(%rdi), %r9b
	orb	%r10b, %r9b
	testb	%r9b, %r9b
	je	.LBB0_1
# %bb.2:                                # %.preheader
	cmoveq	%r8, %r10
	movq	%rdi, %rax
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_3 Depth=1
	cmoveq	%r8, %r10
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	movq	%rsi, %rcx
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_4 Depth=2
	cmoveq	%r8, %r10
.LBB0_4:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rcx), %edx
	orb	%r10b, %dl
	cmpb	%r9b, %dl
	je	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=2
	cmoveq	%r8, %r10
	addq	$1, %rcx
	testb	%dl, %dl
	jne	.LBB0_10
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
	cmovneq	%r8, %r10
	cmpb	%r9b, %dl
	je	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	cmoveq	%r8, %r10
	movb	1(%rax), %r9b
	addq	$1, %rax
	orb	%r10b, %r9b
	testb	%r9b, %r9b
	jne	.LBB0_11
.LBB0_8:
	cmovneq	%r8, %r10
	jmp	.LBB0_9
.LBB0_1:
	cmovneq	%r8, %r10
	movq	%rdi, %rax
.LBB0_9:
	subl	%edi, %eax
	shlq	$47, %r10
                                        # kill: def $eax killed $eax killed $rax
	orq	%r10, %rsp
	retq
.Lfunc_end0:
	.size	cstrcspn, .Lfunc_end0-cstrcspn
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

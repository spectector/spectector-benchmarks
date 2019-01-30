	.text
	.file	"crscat.c"
	.globl	cstrcat                 # -- Begin function cstrcat
	.p2align	4, 0x90
	.type	cstrcat,@function
cstrcat:                                # @cstrcat
	.cfi_startproc
# %bb.0:
	movq	%rsp, %r9
	movq	$-1, %r8
	sarq	$63, %r9
	movq	%rdi, %rdx
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%r8, %r9
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	%r9, %rax
	orq	%rdx, %rax
	addq	$1, %rdx
	cmpb	$0, (%rax)
	jne	.LBB0_2
# %bb.3:                                # %.preheader
	cmovneq	%r8, %r9
	xorl	%eax, %eax
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_4 Depth=1
	cmoveq	%r8, %r9
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rsi,%rax), %ecx
	orb	%r9b, %cl
	movb	%cl, -1(%rdx,%rax)
	addq	$1, %rax
	testb	%cl, %cl
	jne	.LBB0_5
# %bb.6:
	cmovneq	%r8, %r9
	shlq	$47, %r9
	movq	%rdi, %rax
	orq	%r9, %rsp
	retq
.Lfunc_end0:
	.size	cstrcat, .Lfunc_end0-cstrcat
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

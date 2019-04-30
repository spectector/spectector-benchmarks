	.text
	.file	"cstrncat.c"
	.globl	cstrncat                # -- Begin function cstrncat
	.p2align	4, 0x90
	.type	cstrncat,@function
cstrncat:                               # @cstrncat
	.cfi_startproc
# %bb.0:
	movq	%rsp, %r10
	movq	$-1, %r8
	sarq	$63, %r10
	leaq	-1(%rdi), %rax
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_1:                                #   in Loop: Header=BB0_2 Depth=1
	cmoveq	%r8, %r10
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movq	%r10, %rcx
	orq	%rax, %rcx
	addq	$1, %rax
	cmpb	$0, 1(%rcx)
	jne	.LBB0_1
# %bb.3:
	cmovneq	%r8, %r10
	testl	%edx, %edx
	je	.LBB0_12
# %bb.4:
	cmoveq	%r8, %r10
	movl	%edx, %r9d
	xorl	%edx, %edx
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=1
	cmoveq	%r8, %r10
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rsi,%rdx), %ecx
	orb	%r10b, %cl
	movb	%cl, (%rax,%rdx)
	testb	%cl, %cl
	je	.LBB0_12
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	cmoveq	%r8, %r10
	addq	$1, %rdx
	cmpl	%edx, %r9d
	jne	.LBB0_5
# %bb.8:
	cmovneq	%r8, %r10
	movq	%r10, %rcx
	orq	%rax, %rcx
	movq	%r10, %rsi
	orq	%rdx, %rsi
	cmpb	$0, (%rcx,%rsi)
	je	.LBB0_12
# %bb.9:
	cmoveq	%r8, %r10
	movb	$0, (%rax,%rdx)
	jmp	.LBB0_13
.LBB0_12:
	cmovneq	%r8, %r10
.LBB0_13:
	shlq	$47, %r10
	movq	%rdi, %rax
	orq	%r10, %rsp
	retq
.Lfunc_end0:
	.size	cstrncat, .Lfunc_end0-cstrncat
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

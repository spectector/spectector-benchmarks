	.text
	.file	"crscmp.c"
	.globl	cstrcmp                 # -- Begin function cstrcmp
	.p2align	4, 0x90
	.type	cstrcmp,@function
cstrcmp:                                # @cstrcmp
	.cfi_startproc
# %bb.0:
	movq	%rsp, %rdx
	movq	$-1, %r8
	sarq	$63, %rdx
	movb	(%rdi), %al
	orb	%dl, %al
	testb	%al, %al
	je	.LBB0_6
# %bb.1:
	cmoveq	%r8, %rdx
	addq	$1, %rdi
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	cmoveq	%r8, %rdx
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movq	%rdx, %rcx
	orq	%rsi, %rcx
	cmpb	(%rcx), %al
	jne	.LBB0_3
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	cmovneq	%r8, %rdx
	addq	$1, %rsi
	movzbl	(%rdi), %eax
	orb	%dl, %al
	addq	$1, %rdi
	testb	%al, %al
	jne	.LBB0_5
.LBB0_6:
	cmovneq	%r8, %rdx
	xorl	%eax, %eax
	jmp	.LBB0_7
.LBB0_3:
	cmoveq	%r8, %rdx
.LBB0_7:
	xorl	%ecx, %ecx
	orq	%rdx, %rsi
	cmpb	(%rsi), %al
	seta	%cl
	movl	$-1, %eax
	cmovael	%ecx, %eax
	shlq	$47, %rdx
	orq	%rdx, %rsp
	retq
.Lfunc_end0:
	.size	cstrcmp, .Lfunc_end0-cstrcmp
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

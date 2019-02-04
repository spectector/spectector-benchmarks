	.text
	.file	"wildcard.c"
	.globl	wildcardcmp             # -- Begin function wildcardcmp
	.p2align	4, 0x90
	.type	wildcardcmp,@function
wildcardcmp:                            # @wildcardcmp
	.cfi_startproc
# %bb.0:
	movq	%rsp, %r11
	movq	$-1, %r9
	sarq	$63, %r11
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.LBB0_18
# %bb.1:
	cmoveq	%r9, %r11
	testq	%rsi, %rsi
	je	.LBB0_18
# %bb.2:                                # %.preheader
	cmoveq	%r9, %r11
	xorl	%r8d, %r8d
	xorl	%r10d, %r10d
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_16:                               #   in Loop: Header=BB0_3 Depth=1
	cmovneq	%r9, %r11
	addq	$1, %rdi
	addq	$1, %rsi
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rsi), %edx
	orb	%r11b, %dl
	testb	%dl, %dl
	movzbl	(%rdi), %eax
	sete	%cl
	orb	%r11b, %al
	testb	%cl, %cl
	jne	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	testb	%cl, %cl
	cmovneq	%r9, %r11
	cmpb	%dl, %al
	je	.LBB0_16
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=1
	testb	%cl, %cl
	cmoveq	%r9, %r11
	testb	%al, %al
	je	.LBB0_6
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	cmoveq	%r9, %r11
	movzbl	(%r10), %edx
	orb	%r11b, %dl
	testb	%dl, %dl
	je	.LBB0_8
# %bb.9:                                #   in Loop: Header=BB0_3 Depth=1
	cmoveq	%r9, %r11
	movzbl	(%r8), %eax
	orb	%r11b, %al
	movq	%r8, %rdi
	movq	%r10, %rsi
	leaq	1(%r10), %r10
	cmpb	%dl, %al
	je	.LBB0_16
.LBB0_11:                               #   in Loop: Header=BB0_3 Depth=1
	cmoveq	%r9, %r11
	cmpb	$42, %al
	je	.LBB0_12
# %bb.14:                               #   in Loop: Header=BB0_3 Depth=1
	cmoveq	%r9, %r11
	testq	%r8, %r8
	je	.LBB0_8
# %bb.15:                               #   in Loop: Header=BB0_3 Depth=1
	cmoveq	%r9, %r11
	addq	$1, %rsi
	jmp	.LBB0_3
.LBB0_12:                               #   in Loop: Header=BB0_3 Depth=1
	cmovneq	%r9, %r11
	movl	$1, %eax
	movq	%r11, %rcx
	orq	%rdi, %rcx
	addq	$1, %rdi
	cmpb	$0, 1(%rcx)
	je	.LBB0_18
# %bb.13:                               #   in Loop: Header=BB0_3 Depth=1
	cmoveq	%r9, %r11
	movq	%rdi, %r8
	movq	%rsi, %r10
	jmp	.LBB0_3
.LBB0_18:
	cmovneq	%r9, %r11
	jmp	.LBB0_19
.LBB0_8:
	cmovneq	%r9, %r11
	xorl	%eax, %eax
	jmp	.LBB0_19
.LBB0_6:
	cmovneq	%r9, %r11
	movl	$1, %eax
.LBB0_19:
	shlq	$47, %r11
	orq	%r11, %rsp
	retq
.Lfunc_end0:
	.size	wildcardcmp, .Lfunc_end0-wildcardcmp
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

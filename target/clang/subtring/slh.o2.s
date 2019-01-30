	.text
	.file	"subtring.c"
	.globl	substring               # -- Begin function substring
	.p2align	4, 0x90
	.type	substring,@function
substring:                              # @substring
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsp, %r10
	movq	$-1, %r9
	sarq	$63, %r10
	movb	(%rdi), %dl
	orb	%r10b, %dl
	xorl	%eax, %eax
	testb	%dl, %dl
	je	.LBB0_8
# %bb.1:
	cmoveq	%r9, %r10
	movb	(%rsi), %r8b
	orb	%r10b, %r8b
	testb	%r8b, %r8b
	je	.LBB0_2
.LBB0_3:                                # %.preheader2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	cmoveq	%r9, %r10
	cmpb	%dl, %r8b
	jne	.LBB0_7
# %bb.4:                                # %.preheader
                                        #   in Loop: Header=BB0_3 Depth=1
	cmovneq	%r9, %r10
	movl	$1, %edx
	jmp	.LBB0_5
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_5 Depth=2
	cmovneq	%r9, %r10
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rsi,%rdx), %ecx
	orb	%r10b, %cl
	testb	%cl, %cl
	je	.LBB0_2
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=2
	cmoveq	%r9, %r10
	movq	%r10, %r11
	orq	%rdi, %r11
	movq	%r10, %rbx
	orq	%rdx, %rbx
	addq	$1, %rdx
	cmpb	(%r11,%rbx), %cl
	je	.LBB0_10
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=1
	cmoveq	%r9, %r10
	movb	1(%rdi), %dl
	addq	$1, %rdi
	orb	%r10b, %dl
	testb	%dl, %dl
	jne	.LBB0_3
.LBB0_8:
	cmovneq	%r9, %r10
	jmp	.LBB0_9
.LBB0_2:
	cmovneq	%r9, %r10
	movl	$1, %eax
.LBB0_9:
	shlq	$47, %r10
	orq	%r10, %rsp
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	substring, .Lfunc_end0-substring
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

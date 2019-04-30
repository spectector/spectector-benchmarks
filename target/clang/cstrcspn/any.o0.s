	.text
	.file	"cstrcspn.c"
	.globl	cstrcspn                # -- Begin function cstrcspn
	.p2align	4, 0x90
	.type	cstrcspn,@function
cstrcspn:                               # @cstrcspn
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rsi
	movq	%rsi, -32(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movq	-32(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0, %ecx
	je	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movsbl	(%rax), %ecx
	movl	%ecx, -44(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%eax, %eax
	movb	%al, %cl
	movq	-40(%rbp), %rdx
	movsbl	(%rdx), %eax
	cmpl	$0, %eax
	movb	%cl, -45(%rbp)          # 1-byte Spill
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-40(%rbp), %rax
	movsbl	(%rax), %ecx
	movl	-44(%rbp), %edx
	movb	%dl, %sil
	movsbl	%sil, %edx
	cmpl	%edx, %ecx
	setne	%sil
	movb	%sil, -45(%rbp)         # 1-byte Spill
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	movb	-45(%rbp), %al          # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
	jmp	.LBB0_3
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-40(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	-44(%rbp), %ecx
	jne	.LBB0_9
# %bb.8:
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rcx
	subq	%rcx, %rax
	movl	%eax, %edx
	movl	%edx, -4(%rbp)
	jmp	.LBB0_12
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_10
.LBB0_10:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	jmp	.LBB0_1
.LBB0_11:
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rcx
	subq	%rcx, %rax
	movl	%eax, %edx
	movl	%edx, -4(%rbp)
.LBB0_12:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrcspn, .Lfunc_end0-cstrcspn
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cstrcspn

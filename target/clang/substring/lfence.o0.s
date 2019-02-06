	.text
	.file	"substring.c"
	.globl	substring               # -- Begin function substring
	.p2align	4, 0x90
	.type	substring,@function
substring:                              # @substring
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
	je	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-32(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -48(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%eax, %eax
	movb	%al, %cl
	movq	-48(%rbp), %rdx
	movsbl	(%rdx), %eax
	cmpl	$0, %eax
	movb	%cl, -49(%rbp)          # 1-byte Spill
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	movq	-48(%rbp), %rax
	movsbl	(%rax), %ecx
	movq	-40(%rbp), %rax
	movsbl	(%rax), %edx
	cmpl	%edx, %ecx
	sete	%sil
	movb	%sil, -49(%rbp)         # 1-byte Spill
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	movb	-49(%rbp), %al          # 1-byte Reload
	lfence
	testb	$1, %al
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	movq	-48(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
	jmp	.LBB0_3
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-48(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0, %ecx
	jne	.LBB0_9
# %bb.8:
	lfence
	movl	$1, -4(%rbp)
	jmp	.LBB0_11
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	jmp	.LBB0_1
.LBB0_10:
	lfence
	movl	$0, -4(%rbp)
.LBB0_11:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	substring, .Lfunc_end0-substring
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym substring

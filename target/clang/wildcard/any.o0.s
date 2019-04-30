	.text
	.file	"wildcard.c"
	.globl	wildcardcmp             # -- Begin function wildcardcmp
	.p2align	4, 0x90
	.type	wildcardcmp,@function
wildcardcmp:                            # @wildcardcmp
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	cmpq	$0, -16(%rbp)
	je	.LBB0_2
# %bb.1:
	cmpq	$0, -24(%rbp)
	jne	.LBB0_3
.LBB0_2:
	movl	$0, -4(%rbp)
	jmp	.LBB0_21
.LBB0_3:
	jmp	.LBB0_4
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	cmpb	$0, (%rax)
	jne	.LBB0_10
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movq	-16(%rbp), %rax
	cmpb	$0, (%rax)
	jne	.LBB0_7
# %bb.6:
	movl	$1, -4(%rbp)
	jmp	.LBB0_21
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	movq	-40(%rbp), %rax
	cmpb	$0, (%rax)
	jne	.LBB0_9
# %bb.8:
	movl	$0, -4(%rbp)
	jmp	.LBB0_21
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -40(%rbp)
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.LBB0_4
.LBB0_10:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-16(%rbp), %rax
	movsbl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movsbl	(%rax), %edx
	cmpl	%edx, %ecx
	je	.LBB0_19
# %bb.11:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-16(%rbp), %rax
	movsbl	(%rax), %ecx
	movl	$42, %edx
	cmpl	%ecx, %edx
	jne	.LBB0_15
# %bb.12:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-16(%rbp), %rax
	cmpb	$0, (%rax)
	je	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_4 Depth=1
	jmp	.LBB0_4
.LBB0_14:
	movl	$1, -4(%rbp)
	jmp	.LBB0_21
.LBB0_15:                               #   in Loop: Header=BB0_4 Depth=1
	cmpq	$0, -32(%rbp)
	je	.LBB0_17
# %bb.16:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.LBB0_4
.LBB0_17:
	jmp	.LBB0_18
.LBB0_18:
	movl	$0, -4(%rbp)
	jmp	.LBB0_21
.LBB0_19:                               #   in Loop: Header=BB0_4 Depth=1
	jmp	.LBB0_20
.LBB0_20:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.LBB0_4
.LBB0_21:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	wildcardcmp, .Lfunc_end0-wildcardcmp
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym wildcardcmp

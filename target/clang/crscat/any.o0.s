	.text
	.file	"crscat.c"
	.globl	cstrcat                 # -- Begin function cstrcat
	.p2align	4, 0x90
	.type	cstrcat,@function
cstrcat:                                # @cstrcat
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	$0, %eax
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_3:
	jmp	.LBB0_4
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -16(%rbp)
	movb	(%rax), %al
	movq	-8(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rdx, -8(%rbp)
	movb	%al, (%rcx)
	movsbl	%al, %eax
	cmpl	$0, %eax
	je	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	jmp	.LBB0_4
.LBB0_6:
	movq	-24(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrcat, .Lfunc_end0-cstrcat
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

	.text
	.file	"cstrncat.c"
	.globl	cstrncat                # -- Begin function cstrncat
	.p2align	4, 0x90
	.type	cstrncat,@function
cstrncat:                               # @cstrncat
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -32(%rbp)
	movq	%rsi, -24(%rbp)
	movl	%edx, -12(%rbp)
	movq	-32(%rbp), %rax
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
	xorl	%eax, %eax
	cmpl	$0, -12(%rbp)
	je	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -24(%rbp)
	movb	(%rax), %al
	movq	-8(%rbp), %rcx
	movb	%al, (%rcx)
	movsbl	%al, %eax
	cmpl	$0, %eax
	setne	%al
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	testb	$1, %al
	jne	.LBB0_7
	jmp	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	movl	-12(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	jmp	.LBB0_4
.LBB0_8:
	movq	-8(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	$0, %eax
	je	.LBB0_10
# %bb.9:
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
.LBB0_10:
	movq	-32(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrncat, .Lfunc_end0-cstrncat
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

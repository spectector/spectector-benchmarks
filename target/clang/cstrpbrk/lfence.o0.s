	.text
	.file	"cstrpbrk.c"
	.globl	cstrpbrk                # -- Begin function cstrpbrk
	.p2align	4, 0x90
	.type	cstrpbrk,@function
cstrpbrk:                               # @cstrpbrk
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -48(%rbp)
	movq	%rsi, -40(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movq	-16(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	$0, %eax
	je	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movsbl	(%rax), %eax
	movl	%eax, -20(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%eax, %eax
	movq	-8(%rbp), %rcx
	movsbl	(%rcx), %ecx
	cmpl	$0, %ecx
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	movq	-8(%rbp), %rax
	movsbl	(%rax), %eax
	movl	-20(%rbp), %ecx
	movsbl	%cl, %ecx
	cmpl	%ecx, %eax
	setne	%al
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	testb	$1, %al
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	jmp	.LBB0_3
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-8(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	-20(%rbp), %eax
	je	.LBB0_9
# %bb.8:
	lfence
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.LBB0_12
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	jmp	.LBB0_10
.LBB0_10:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.LBB0_1
.LBB0_11:
	lfence
	movq	$0, -32(%rbp)
.LBB0_12:
	movq	-32(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrpbrk, .Lfunc_end0-cstrpbrk
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

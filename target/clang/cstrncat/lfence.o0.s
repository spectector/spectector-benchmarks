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
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, -32(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0, %ecx
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	jmp	.LBB0_1
.LBB0_3:
	lfence
	jmp	.LBB0_4
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	cmpl	$0, -20(%rbp)
	movb	%cl, -33(%rbp)          # 1-byte Spill
	je	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	lfence
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -16(%rbp)
	movb	(%rax), %dl
	movq	-32(%rbp), %rax
	movb	%dl, (%rax)
	movsbl	%dl, %esi
	cmpl	$0, %esi
	setne	%dl
	movb	%dl, -33(%rbp)          # 1-byte Spill
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	movb	-33(%rbp), %al          # 1-byte Reload
	lfence
	testb	$1, %al
	jne	.LBB0_7
	jmp	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	lfence
	movl	-20(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -20(%rbp)
	movq	-32(%rbp), %rcx
	addq	$1, %rcx
	movq	%rcx, -32(%rbp)
	jmp	.LBB0_4
.LBB0_8:
	lfence
	movq	-32(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0, %ecx
	je	.LBB0_10
# %bb.9:
	lfence
	movq	-32(%rbp), %rax
	movb	$0, (%rax)
.LBB0_10:
	lfence
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrncat, .Lfunc_end0-cstrncat
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cstrncat

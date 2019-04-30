	.text
	.file	"cbzero.c"
	.globl	cbzero                  # -- Begin function cbzero
	.p2align	4, 0x90
	.type	cbzero,@function
cbzero:                                 # @cbzero
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, -24(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	addq	$-1, %rcx
	movq	%rcx, -16(%rbp)
	cmpq	$0, %rax
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -24(%rbp)
	movb	$0, (%rax)
	jmp	.LBB0_1
.LBB0_3:
	lfence
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cbzero, .Lfunc_end0-cbzero
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cbzero

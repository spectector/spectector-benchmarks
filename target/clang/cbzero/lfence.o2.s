	.text
	.file	"cbzero.c"
	.globl	cbzero                  # -- Begin function cbzero
	.p2align	4, 0x90
	.type	cbzero,@function
cbzero:                                 # @cbzero
	.cfi_startproc
# %bb.0:
	testq	%rsi, %rsi
	je	.LBB0_2
# %bb.1:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rax
	lfence
	xorl	%esi, %esi
	movq	%rax, %rdx
	callq	memset
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
.LBB0_2:
	lfence
	retq
.Lfunc_end0:
	.size	cbzero, .Lfunc_end0-cbzero
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

	.text
	.file	"cbzero.c"
	.globl	cbzero                  # -- Begin function cbzero
	.p2align	4, 0x90
	.type	cbzero,@function
cbzero:                                 # @cbzero
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsp, %rcx
	movq	$-1, %rdx
	sarq	$63, %rcx
	testq	%rsi, %rsi
	je	.LBB0_1
# %bb.2:
	movq	%rsi, %rax
	cmoveq	%rdx, %rcx
	xorl	%esi, %esi
	shlq	$47, %rcx
	movq	%rax, %rdx
	orq	%rcx, %rsp
	callq	memset@PLT
	movq	%rsp, %rcx
	sarq	$63, %rcx
	jmp	.LBB0_3
.LBB0_1:
	cmovneq	%rdx, %rcx
.LBB0_3:
	shlq	$47, %rcx
	orq	%rcx, %rsp
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	cbzero, .Lfunc_end0-cbzero
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

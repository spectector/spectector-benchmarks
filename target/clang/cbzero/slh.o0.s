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
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, -24(%rbp)
	movq	%rax, -32(%rbp)         # 8-byte Spill
	movq	%rcx, -40(%rbp)         # 8-byte Spill
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax         # 8-byte Reload
	movq	-16(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$-1, %rdx
	movq	%rdx, -16(%rbp)
	cmpq	$0, %rcx
	movq	%rax, -48(%rbp)         # 8-byte Spill
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -24(%rbp)
	movb	$0, (%rdx)
	movq	%rax, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_3:
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	shlq	$47, %rax
	orq	%rax, %rsp
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

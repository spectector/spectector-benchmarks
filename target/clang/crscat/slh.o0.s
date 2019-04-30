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
	movq	-24(%rbp), %rcx
	movsbl	(%rcx), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	cmpl	$0, %esi
	movq	%rax, -48(%rbp)         # 8-byte Spill
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-24(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -24(%rbp)
	movq	%rax, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_3:
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	jmp	.LBB0_4
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	-16(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movb	(%rcx), %sil
	movb	%al, %dil
	orb	%sil, %dil
	movq	-24(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rdx, -24(%rbp)
	movb	%dil, (%rcx)
	movsbl	%dil, %r8d
	cmpl	$0, %r8d
	movq	%rax, -64(%rbp)         # 8-byte Spill
	je	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	jmp	.LBB0_4
.LBB0_6:
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movq	%rdx, %rax
	movq	-72(%rbp), %rdx         # 8-byte Reload
	shlq	$47, %rdx
	orq	%rdx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrcat, .Lfunc_end0-cstrcat
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cstrcat

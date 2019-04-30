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
	subq	$40, %rsp
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	cmpq	$0, -16(%rbp)
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	je	.LBB0_22
	jmp	.LBB0_1
.LBB0_22:
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	jmp	.LBB0_2
.LBB0_1:
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	cmpq	$0, -24(%rbp)
	movq	%rax, -72(%rbp)         # 8-byte Spill
	jne	.LBB0_3
# %bb.23:
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
.LBB0_2:
	movq	-64(%rbp), %rax         # 8-byte Reload
	movl	$0, -4(%rbp)
	movq	%rax, -80(%rbp)         # 8-byte Spill
	jmp	.LBB0_21
.LBB0_3:
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	jmp	.LBB0_4
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movq	-88(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx
	movq	%rax, %rdx
	orq	%rcx, %rdx
	cmpb	$0, (%rdx)
	movq	%rax, -96(%rbp)         # 8-byte Spill
	jne	.LBB0_10
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movq	-96(%rbp), %rax         # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rsi
	orq	%rdx, %rsi
	cmpb	$0, (%rsi)
	movq	%rax, -104(%rbp)        # 8-byte Spill
	jne	.LBB0_7
# %bb.6:
	movq	-104(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movl	$1, -4(%rbp)
	movq	%rax, -80(%rbp)         # 8-byte Spill
	jmp	.LBB0_21
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	movq	-104(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-40(%rbp), %rdx
	movq	%rax, %rsi
	orq	%rdx, %rsi
	cmpb	$0, (%rsi)
	movq	%rax, -112(%rbp)        # 8-byte Spill
	jne	.LBB0_9
# %bb.8:
	movq	-112(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movl	$0, -4(%rbp)
	movq	%rax, -80(%rbp)         # 8-byte Spill
	jmp	.LBB0_21
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	movq	-112(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -40(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-32(%rbp), %rdx
	movq	%rdx, -16(%rbp)
	movq	%rax, -88(%rbp)         # 8-byte Spill
	jmp	.LBB0_4
.LBB0_10:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-96(%rbp), %rax         # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-16(%rbp), %rdx
	movsbl	(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	movq	-24(%rbp), %rdx
	movsbl	(%rdx), %esi
	movl	%eax, %r8d
	orl	%esi, %r8d
	cmpl	%r8d, %edi
	movq	%rax, -120(%rbp)        # 8-byte Spill
	je	.LBB0_19
# %bb.11:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-120(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-16(%rbp), %rdx
	movsbl	(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	movl	$42, %esi
	cmpl	%edi, %esi
	movq	%rax, -128(%rbp)        # 8-byte Spill
	jne	.LBB0_15
# %bb.12:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-128(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	-16(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movq	%rdx, -32(%rbp)
	movq	-24(%rbp), %rdx
	movq	%rdx, -40(%rbp)
	movq	-16(%rbp), %rdx
	movq	%rax, %rsi
	orq	%rdx, %rsi
	cmpb	$0, (%rsi)
	movq	%rax, -136(%rbp)        # 8-byte Spill
	je	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-136(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	jmp	.LBB0_4
.LBB0_14:
	movq	-136(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movl	$1, -4(%rbp)
	movq	%rax, -80(%rbp)         # 8-byte Spill
	jmp	.LBB0_21
.LBB0_15:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-128(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	cmpq	$0, -32(%rbp)
	movq	%rax, -144(%rbp)        # 8-byte Spill
	je	.LBB0_17
# %bb.16:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-144(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-24(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -24(%rbp)
	movq	%rax, -88(%rbp)         # 8-byte Spill
	jmp	.LBB0_4
.LBB0_17:
	movq	-144(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -152(%rbp)        # 8-byte Spill
	jmp	.LBB0_18
.LBB0_18:
	movl	$0, -4(%rbp)
	movq	-152(%rbp), %rax        # 8-byte Reload
	movq	%rax, -80(%rbp)         # 8-byte Spill
	jmp	.LBB0_21
.LBB0_19:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-120(%rbp), %rax        # 8-byte Reload
	movq	-48(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -160(%rbp)        # 8-byte Spill
	jmp	.LBB0_20
.LBB0_20:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	movq	-160(%rbp), %rax        # 8-byte Reload
	movq	%rax, -88(%rbp)         # 8-byte Spill
	jmp	.LBB0_4
.LBB0_21:
	movq	-80(%rbp), %rax         # 8-byte Reload
	movl	-4(%rbp), %ecx
	movq	%rax, -168(%rbp)        # 8-byte Spill
	movl	%ecx, %eax
	movq	-168(%rbp), %rdx        # 8-byte Reload
	shlq	$47, %rdx
	orq	%rdx, %rsp
	addq	$40, %rsp
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

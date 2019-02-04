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
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	cmpq	$0, -16(%rbp)
	je	.LBB0_1
	jmp	.LBB0_2
.LBB0_1:
	cmovneq	%rax, %rcx
	jmp	.LBB0_4
.LBB0_2:
	cmoveq	%rax, %rcx
	cmpq	$0, -24(%rbp)
	jne	.LBB0_5
# %bb.3:
	cmovneq	%rax, %rcx
.LBB0_4:
	movl	$0, -4(%rbp)
	jmp	.LBB0_24
.LBB0_5:
	cmoveq	%rax, %rcx
	jmp	.LBB0_6
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rdx
	movq	%rcx, %rsi
	orq	%rdx, %rsi
	cmpb	$0, (%rsi)
	jne	.LBB0_13
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	cmovneq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movq	%rcx, %rsi
	orq	%rdx, %rsi
	cmpb	$0, (%rsi)
	jne	.LBB0_9
# %bb.8:
	cmovneq	%rax, %rcx
	movl	$1, -4(%rbp)
	jmp	.LBB0_24
.LBB0_9:                                #   in Loop: Header=BB0_6 Depth=1
	cmoveq	%rax, %rcx
	movq	-32(%rbp), %rdx
	movq	%rcx, %rsi
	orq	%rdx, %rsi
	cmpb	$0, (%rsi)
	jne	.LBB0_11
# %bb.10:
	cmovneq	%rax, %rcx
	movl	$0, -4(%rbp)
	jmp	.LBB0_24
.LBB0_11:                               #   in Loop: Header=BB0_6 Depth=1
	cmoveq	%rax, %rcx
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-40(%rbp), %rdx
	movq	%rdx, -16(%rbp)
.LBB0_12:                               # %.backedge
                                        #   in Loop: Header=BB0_6 Depth=1
	jmp	.LBB0_6
.LBB0_13:                               #   in Loop: Header=BB0_6 Depth=1
	cmoveq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	movq	-24(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %edi
	orl	%edx, %edi
	cmpl	%edi, %esi
	je	.LBB0_22
# %bb.14:                               #   in Loop: Header=BB0_6 Depth=1
	cmoveq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	movl	$42, %edx
	cmpl	%esi, %edx
	jne	.LBB0_18
# %bb.15:                               #   in Loop: Header=BB0_6 Depth=1
	cmovneq	%rax, %rcx
	movq	-16(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rdx
	movq	%rdx, -32(%rbp)
	movq	-16(%rbp), %rdx
	movq	%rcx, %rsi
	orq	%rdx, %rsi
	cmpb	$0, (%rsi)
	je	.LBB0_17
# %bb.16:                               #   in Loop: Header=BB0_6 Depth=1
	cmoveq	%rax, %rcx
	jmp	.LBB0_12
.LBB0_17:
	cmovneq	%rax, %rcx
	movl	$1, -4(%rbp)
	jmp	.LBB0_24
.LBB0_18:                               #   in Loop: Header=BB0_6 Depth=1
	cmoveq	%rax, %rcx
	cmpq	$0, -40(%rbp)
	je	.LBB0_20
# %bb.19:                               #   in Loop: Header=BB0_6 Depth=1
	cmoveq	%rax, %rcx
	movq	-24(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -24(%rbp)
	jmp	.LBB0_12
.LBB0_20:
	cmovneq	%rax, %rcx
	jmp	.LBB0_21
.LBB0_21:
	movl	$0, -4(%rbp)
	jmp	.LBB0_24
.LBB0_22:                               #   in Loop: Header=BB0_6 Depth=1
	cmovneq	%rax, %rcx
	jmp	.LBB0_23
.LBB0_23:                               #   in Loop: Header=BB0_6 Depth=1
	movq	-24(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	jmp	.LBB0_12
.LBB0_24:
	movl	-4(%rbp), %eax
	shlq	$47, %rcx
	orq	%rcx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	wildcardcmp, .Lfunc_end0-wildcardcmp
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

	.text
	.file	"cstrcspn.c"
	.globl	cstrcspn                # -- Begin function cstrcspn
	.p2align	4, 0x90
	.type	cstrcspn,@function
cstrcspn:                               # @cstrcspn
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
	movq	%rdi, -32(%rbp)
	movq	%rsi, -40(%rbp)
	movq	-32(%rbp), %rdx
	movq	%rdx, -8(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	cmpl	$0, %esi
	je	.LBB0_12
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%rax, %rcx
	movq	-40(%rbp), %rdx
	movq	%rdx, -16(%rbp)
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	movl	%esi, -20(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%edx, %edx
	movq	-16(%rbp), %rsi
	movsbl	(%rsi), %esi
	movl	%ecx, %edi
	orl	%esi, %edi
	cmpl	$0, %edi
	je	.LBB0_4
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=2
	cmovneq	%rax, %rcx
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	cmoveq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	movl	-20(%rbp), %edx
	movsbl	%dl, %edx
	cmpl	%edx, %esi
	setne	%dl
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	testb	$1, %dl
	jne	.LBB0_7
	jmp	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	cmoveq	%rax, %rcx
	movq	-16(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	cmovneq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	cmpl	-20(%rbp), %esi
	jne	.LBB0_10
# %bb.9:
	cmovneq	%rax, %rcx
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	subq	%rdx, %rax
	movl	%eax, -24(%rbp)
	jmp	.LBB0_13
.LBB0_10:                               #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%rax, %rcx
	jmp	.LBB0_11
.LBB0_11:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -8(%rbp)
	jmp	.LBB0_1
.LBB0_12:
	cmovneq	%rax, %rcx
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	subq	%rdx, %rax
	movl	%eax, -24(%rbp)
.LBB0_13:
	movl	-24(%rbp), %eax
	shlq	$47, %rcx
	orq	%rcx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrcspn, .Lfunc_end0-cstrcspn
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

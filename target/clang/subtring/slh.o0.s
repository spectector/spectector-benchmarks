	.text
	.file	"subtring.c"
	.globl	substring               # -- Begin function substring
	.p2align	4, 0x90
	.type	substring,@function
substring:                              # @substring
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
	movq	%rdi, -48(%rbp)
	movq	%rsi, -40(%rbp)
	movq	-48(%rbp), %rdx
	movq	%rdx, -24(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movq	-24(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	cmpl	$0, %esi
	je	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%rax, %rcx
	movq	-24(%rbp), %rdx
	movq	%rdx, -32(%rbp)
	movq	-40(%rbp), %rdx
	movq	%rdx, -8(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%edx, %edx
	movq	-8(%rbp), %rsi
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
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	movq	-32(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %edi
	orl	%edx, %edi
	cmpl	%edi, %esi
	sete	%dl
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	testb	$1, %dl
	jne	.LBB0_7
	jmp	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	cmoveq	%rax, %rcx
	movq	-8(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -8(%rbp)
	movq	-32(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -32(%rbp)
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	cmovneq	%rax, %rcx
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	cmpl	$0, %esi
	jne	.LBB0_10
# %bb.9:
	cmovneq	%rax, %rcx
	movl	$1, -12(%rbp)
	jmp	.LBB0_12
.LBB0_10:                               #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%rax, %rcx
	movq	-24(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -24(%rbp)
	jmp	.LBB0_1
.LBB0_11:
	cmovneq	%rax, %rcx
	movl	$0, -12(%rbp)
.LBB0_12:
	movl	-12(%rbp), %eax
	shlq	$47, %rcx
	orq	%rcx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	substring, .Lfunc_end0-substring
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

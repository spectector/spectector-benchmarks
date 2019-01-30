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
	movq	$-1, %r8
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -32(%rbp)
	movq	%rsi, -24(%rbp)
	movl	%edx, -12(%rbp)
	movq	-32(%rbp), %rdx
	movq	%rdx, -8(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	cmpl	$0, %esi
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%r8, %rcx
	movq	-8(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -8(%rbp)
	jmp	.LBB0_1
.LBB0_3:
	cmovneq	%r8, %rcx
	jmp	.LBB0_4
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	xorl	%edx, %edx
	cmpl	$0, -12(%rbp)
	je	.LBB0_5
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_4 Depth=1
	cmovneq	%r8, %rcx
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	cmoveq	%r8, %rcx
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -24(%rbp)
	movb	(%rdx), %dl
	movb	%cl, %al
	orb	%dl, %al
	movq	-8(%rbp), %rdx
	movb	%al, (%rdx)
	movsbl	%al, %eax
	cmpl	$0, %eax
	setne	%dl
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	testb	$1, %dl
	jne	.LBB0_8
	jmp	.LBB0_9
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	cmoveq	%r8, %rcx
	movl	-12(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	jmp	.LBB0_4
.LBB0_9:
	cmovneq	%r8, %rcx
	movq	-8(%rbp), %rax
	movsbl	(%rax), %eax
	movl	%ecx, %edx
	orl	%eax, %edx
	cmpl	$0, %edx
	je	.LBB0_10
	jmp	.LBB0_11
.LBB0_10:
	cmovneq	%r8, %rcx
	jmp	.LBB0_12
.LBB0_11:
	cmoveq	%r8, %rcx
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
.LBB0_12:
	movq	-32(%rbp), %rax
	shlq	$47, %rcx
	orq	%rcx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrncat, .Lfunc_end0-cstrncat
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

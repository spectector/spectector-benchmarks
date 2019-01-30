	.text
	.file	"crschr.c"
	.globl	cstrchr                 # -- Begin function cstrchr
	.p2align	4, 0x90
	.type	cstrchr,@function
cstrchr:                                # @cstrchr
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
	movl	%esi, -12(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	xorl	%edx, %edx
	movq	-8(%rbp), %rsi
	movsbl	(%rsi), %esi
	movl	%ecx, %edi
	orl	%esi, %edi
	cmpl	$0, %edi
	je	.LBB0_2
	jmp	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	cmovneq	%rax, %rcx
	jmp	.LBB0_4
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%rax, %rcx
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	movl	-12(%rbp), %edx
	movsbl	%dl, %edx
	cmpl	%edx, %esi
	setne	%dl
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	testb	$1, %dl
	jne	.LBB0_5
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%rax, %rcx
	movq	-8(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -8(%rbp)
	jmp	.LBB0_1
.LBB0_6:
	cmovneq	%rax, %rcx
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	cmpl	-12(%rbp), %esi
	jne	.LBB0_8
# %bb.7:
	cmovneq	%rax, %rcx
	movq	-8(%rbp), %rax
	jmp	.LBB0_9
.LBB0_8:
	cmoveq	%rax, %rcx
	xorl	%eax, %eax
	jmp	.LBB0_9
.LBB0_9:
	shlq	$47, %rcx
	orq	%rcx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrchr, .Lfunc_end0-cstrchr
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

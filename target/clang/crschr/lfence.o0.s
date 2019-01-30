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
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movq	-8(%rbp), %rcx
	movsbl	(%rcx), %ecx
	cmpl	$0, %ecx
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-8(%rbp), %rax
	movsbl	(%rax), %eax
	movl	-12(%rbp), %ecx
	movsbl	%cl, %ecx
	cmpl	%ecx, %eax
	setne	%al
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	testb	$1, %al
	jne	.LBB0_4
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_5:
	lfence
	movq	-8(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	-12(%rbp), %eax
	jne	.LBB0_7
# %bb.6:
	lfence
	movq	-8(%rbp), %rax
	jmp	.LBB0_8
.LBB0_7:
	lfence
	xorl	%eax, %eax
	jmp	.LBB0_8
.LBB0_8:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrchr, .Lfunc_end0-cstrchr
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

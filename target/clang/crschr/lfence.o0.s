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
	movb	%al, %cl
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %eax
	cmpl	$0, %eax
	movb	%cl, -13(%rbp)          # 1-byte Spill
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-8(%rbp), %rax
	movsbl	(%rax), %ecx
	movl	-12(%rbp), %edx
	movb	%dl, %sil
	movsbl	%sil, %edx
	cmpl	%edx, %ecx
	setne	%sil
	movb	%sil, -13(%rbp)         # 1-byte Spill
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	movb	-13(%rbp), %al          # 1-byte Reload
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
	movsbl	(%rax), %ecx
	cmpl	-12(%rbp), %ecx
	jne	.LBB0_7
# %bb.6:
	lfence
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)         # 8-byte Spill
	jmp	.LBB0_8
.LBB0_7:
	lfence
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	%rcx, -24(%rbp)         # 8-byte Spill
	jmp	.LBB0_8
.LBB0_8:
	movq	-24(%rbp), %rax         # 8-byte Reload
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrchr, .Lfunc_end0-cstrchr
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cstrchr

	.text
	.file	"crscmp.c"
	.globl	cstrcmp                 # -- Begin function cstrcmp
	.p2align	4, 0x90
	.type	cstrcmp,@function
cstrcmp:                                # @cstrcmp
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %eax
	cmpl	$0, %eax
	movb	%cl, -19(%rbp)          # 1-byte Spill
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movsbl	(%rax), %ecx
	movq	-16(%rbp), %rax
	movsbl	(%rax), %edx
	cmpl	%edx, %ecx
	sete	%sil
	movb	%sil, -19(%rbp)         # 1-byte Spill
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	movb	-19(%rbp), %al          # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_4
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.LBB0_1
.LBB0_5:
	movq	-8(%rbp), %rax
	movb	(%rax), %cl
	movb	%cl, -17(%rbp)
	movq	-16(%rbp), %rax
	movb	(%rax), %cl
	movb	%cl, -18(%rbp)
	movzbl	-17(%rbp), %edx
	movzbl	-18(%rbp), %esi
	cmpl	%esi, %edx
	jge	.LBB0_7
# %bb.6:
	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
	movl	%eax, -24(%rbp)         # 4-byte Spill
	jmp	.LBB0_8
.LBB0_7:
	movzbl	-17(%rbp), %eax
	movzbl	-18(%rbp), %ecx
	cmpl	%ecx, %eax
	setg	%dl
	andb	$1, %dl
	movzbl	%dl, %eax
	movl	%eax, -24(%rbp)         # 4-byte Spill
.LBB0_8:
	movl	-24(%rbp), %eax         # 4-byte Reload
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrcmp, .Lfunc_end0-cstrcmp
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cstrcmp

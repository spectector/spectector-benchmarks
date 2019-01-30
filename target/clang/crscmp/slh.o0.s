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
	movq	$-1, %r8
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	xorl	%edx, %edx
	movq	-16(%rbp), %rsi
	movsbl	(%rsi), %esi
	movl	%ecx, %edi
	orl	%esi, %edi
	cmpl	$0, %edi
	je	.LBB0_2
	jmp	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	cmovneq	%r8, %rcx
	jmp	.LBB0_4
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%r8, %rcx
	movq	-16(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	movq	-24(%rbp), %rdx
	movsbl	(%rdx), %edx
	movl	%ecx, %edi
	orl	%edx, %edi
	cmpl	%edi, %esi
	sete	%dl
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	testb	$1, %dl
	jne	.LBB0_5
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%r8, %rcx
	movq	-16(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movq	-24(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -24(%rbp)
	jmp	.LBB0_1
.LBB0_6:
	cmovneq	%r8, %rcx
	movq	-16(%rbp), %rdx
	movb	(%rdx), %dl
	movb	%cl, %al
	orb	%dl, %al
	movb	%al, -2(%rbp)
	movq	-24(%rbp), %rax
	movb	(%rax), %al
	movb	%cl, %dl
	orb	%al, %dl
	movb	%dl, -1(%rbp)
	movzbl	-2(%rbp), %eax
	movzbl	-1(%rbp), %edx
	cmpl	%edx, %eax
	jge	.LBB0_8
# %bb.7:
	cmovgeq	%r8, %rcx
	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
	jmp	.LBB0_9
.LBB0_8:
	cmovlq	%r8, %rcx
	movzbl	-2(%rbp), %eax
	movzbl	-1(%rbp), %edx
	cmpl	%edx, %eax
	setg	%al
	andb	$1, %al
	movzbl	%al, %eax
.LBB0_9:
	shlq	$47, %rcx
	orq	%rcx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrcmp, .Lfunc_end0-cstrcmp
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

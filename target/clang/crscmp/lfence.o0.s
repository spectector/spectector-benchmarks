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
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movq	-16(%rbp), %rcx
	movsbl	(%rcx), %ecx
	cmpl	$0, %ecx
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-16(%rbp), %rax
	movsbl	(%rax), %eax
	movq	-24(%rbp), %rcx
	movsbl	(%rcx), %ecx
	cmpl	%ecx, %eax
	sete	%al
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	testb	$1, %al
	jne	.LBB0_4
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.LBB0_1
.LBB0_5:
	lfence
	movq	-16(%rbp), %rax
	movb	(%rax), %al
	movb	%al, -2(%rbp)
	movq	-24(%rbp), %rax
	movb	(%rax), %al
	movb	%al, -1(%rbp)
	movzbl	-2(%rbp), %eax
	movzbl	-1(%rbp), %ecx
	cmpl	%ecx, %eax
	jge	.LBB0_7
# %bb.6:
	lfence
	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
	jmp	.LBB0_8
.LBB0_7:
	lfence
	movzbl	-2(%rbp), %eax
	movzbl	-1(%rbp), %ecx
	cmpl	%ecx, %eax
	setg	%al
	andb	$1, %al
	movzbl	%al, %eax
.LBB0_8:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrcmp, .Lfunc_end0-cstrcmp
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

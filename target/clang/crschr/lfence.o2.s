	.text
	.file	"crschr.c"
	.globl	cstrchr                 # -- Begin function cstrchr
	.p2align	4, 0x90
	.type	cstrchr,@function
cstrchr:                                # @cstrchr
	.cfi_startproc
# %bb.0:
	movb	(%rdi), %al
	testb	%al, %al
	je	.LBB0_4
# %bb.1:
	lfence
	movsbl	%sil, %ecx
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lfence
	movsbl	%al, %edx
	cmpl	%edx, %ecx
	je	.LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	lfence
	movzbl	1(%rdi), %eax
	addq	$1, %rdi
	testb	%al, %al
	jne	.LBB0_2
.LBB0_4:
	lfence
	xorl	%eax, %eax
.LBB0_5:
	lfence
	movsbl	%al, %ecx
	xorl	%eax, %eax
	cmpl	%esi, %ecx
	cmoveq	%rdi, %rax
	retq
.Lfunc_end0:
	.size	cstrchr, .Lfunc_end0-cstrchr
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

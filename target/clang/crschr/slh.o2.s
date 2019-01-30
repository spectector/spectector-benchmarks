	.text
	.file	"crschr.c"
	.globl	cstrchr                 # -- Begin function cstrchr
	.p2align	4, 0x90
	.type	cstrchr,@function
cstrchr:                                # @cstrchr
	.cfi_startproc
# %bb.0:
	movq	%rsp, %rcx
	movq	$-1, %r8
	sarq	$63, %rcx
	movb	(%rdi), %al
	orb	%cl, %al
	testb	%al, %al
	je	.LBB0_6
# %bb.1:
	cmoveq	%r8, %rcx
	movsbl	%sil, %r9d
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	cmoveq	%r8, %rcx
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movsbl	%al, %edx
	cmpl	%edx, %r9d
	je	.LBB0_3
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	cmoveq	%r8, %rcx
	movzbl	1(%rdi), %eax
	addq	$1, %rdi
	orb	%cl, %al
	testb	%al, %al
	jne	.LBB0_5
.LBB0_6:
	cmovneq	%r8, %rcx
	xorl	%eax, %eax
	jmp	.LBB0_7
.LBB0_3:
	cmovneq	%r8, %rcx
.LBB0_7:
	movsbl	%al, %edx
	xorl	%eax, %eax
	cmpl	%esi, %edx
	cmoveq	%rdi, %rax
	shlq	$47, %rcx
	orq	%rcx, %rsp
	retq
.Lfunc_end0:
	.size	cstrchr, .Lfunc_end0-cstrchr
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

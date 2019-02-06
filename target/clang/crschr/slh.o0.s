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
	movq	%rax, -24(%rbp)         # 8-byte Spill
	movq	%rcx, -32(%rbp)         # 8-byte Spill
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax         # 8-byte Reload
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movq	-8(%rbp), %rsi
	movsbl	(%rsi), %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	cmpl	$0, %edi
	movq	%rax, -40(%rbp)         # 8-byte Spill
	movb	%dl, -41(%rbp)          # 1-byte Spill
	je	.LBB0_9
	jmp	.LBB0_2
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-40(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movb	-41(%rbp), %dl          # 1-byte Reload
	movq	%rax, -56(%rbp)         # 8-byte Spill
	movb	%dl, -57(%rbp)          # 1-byte Spill
	jmp	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-40(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	movl	-12(%rbp), %esi
	movb	%sil, %r8b
	movsbl	%r8b, %esi
	cmpl	%esi, %edi
	setne	%r8b
	movq	%rax, -56(%rbp)         # 8-byte Spill
	movb	%r8b, -57(%rbp)         # 1-byte Spill
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	movb	-57(%rbp), %al          # 1-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	testb	$1, %al
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	jne	.LBB0_4
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-8(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -8(%rbp)
	movq	%rax, -32(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_5:
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	cmpl	-12(%rbp), %edi
	movq	%rax, -80(%rbp)         # 8-byte Spill
	jne	.LBB0_7
# %bb.6:
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movq	%rdx, -96(%rbp)         # 8-byte Spill
	jmp	.LBB0_8
.LBB0_7:
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	xorl	%edx, %edx
	movl	%edx, %esi
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movq	%rsi, -96(%rbp)         # 8-byte Spill
	jmp	.LBB0_8
.LBB0_8:
	movq	-96(%rbp), %rax         # 8-byte Reload
	movq	-88(%rbp), %rcx         # 8-byte Reload
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
	.addrsig
	.addrsig_sym cstrchr

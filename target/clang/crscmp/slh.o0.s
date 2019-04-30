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
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rax, -32(%rbp)         # 8-byte Spill
	movq	%rcx, -40(%rbp)         # 8-byte Spill
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax         # 8-byte Reload
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movq	-8(%rbp), %rsi
	movsbl	(%rsi), %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	cmpl	$0, %edi
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movb	%dl, -49(%rbp)          # 1-byte Spill
	je	.LBB0_9
	jmp	.LBB0_2
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movb	-49(%rbp), %dl          # 1-byte Reload
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movb	%dl, -65(%rbp)          # 1-byte Spill
	jmp	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movsbl	(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	movq	-16(%rbp), %rdx
	movsbl	(%rdx), %esi
	movl	%eax, %r8d
	orl	%esi, %r8d
	cmpl	%r8d, %edi
	sete	%r9b
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movb	%r9b, -65(%rbp)         # 1-byte Spill
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	movb	-65(%rbp), %al          # 1-byte Reload
	movq	-64(%rbp), %rcx         # 8-byte Reload
	testb	$1, %al
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	jne	.LBB0_4
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-8(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -8(%rbp)
	movq	-16(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movq	%rax, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_5:
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movb	(%rdx), %sil
	movb	%al, %dil
	orb	%sil, %dil
	movb	%dil, -17(%rbp)
	movq	-16(%rbp), %rdx
	movb	(%rdx), %sil
	movb	%al, %dil
	orb	%sil, %dil
	movb	%dil, -18(%rbp)
	movzbl	-17(%rbp), %r8d
	movzbl	-18(%rbp), %r9d
	cmpl	%r9d, %r8d
	movq	%rax, -88(%rbp)         # 8-byte Spill
	jge	.LBB0_7
# %bb.6:
	movq	-88(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovgeq	%rcx, %rax
	movl	$4294967295, %edx       # imm = 0xFFFFFFFF
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movl	%edx, -100(%rbp)        # 4-byte Spill
	jmp	.LBB0_8
.LBB0_7:
	movq	-88(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovlq	%rcx, %rax
	movzbl	-17(%rbp), %edx
	movzbl	-18(%rbp), %esi
	cmpl	%esi, %edx
	setg	%dil
	andb	$1, %dil
	movzbl	%dil, %edx
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movl	%edx, -100(%rbp)        # 4-byte Spill
.LBB0_8:
	movl	-100(%rbp), %eax        # 4-byte Reload
	movq	-96(%rbp), %rcx         # 8-byte Reload
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
	.addrsig
	.addrsig_sym cstrcmp

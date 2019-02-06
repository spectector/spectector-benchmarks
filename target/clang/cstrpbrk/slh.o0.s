	.text
	.file	"cstrpbrk.c"
	.globl	cstrpbrk                # -- Begin function cstrpbrk
	.p2align	4, 0x90
	.type	cstrpbrk,@function
cstrpbrk:                               # @cstrpbrk
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$24, %rsp
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rsi
	movq	%rsi, -32(%rbp)
	movq	%rax, -56(%rbp)         # 8-byte Spill
	movq	%rcx, -64(%rbp)         # 8-byte Spill
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx
	movsbl	(%rcx), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	cmpl	$0, %esi
	movq	%rax, -72(%rbp)         # 8-byte Spill
	je	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, -40(%rbp)
	movq	-32(%rbp), %rdx
	movsbl	(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	movl	%edi, -44(%rbp)
	movq	%rax, -80(%rbp)         # 8-byte Spill
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-80(%rbp), %rax         # 8-byte Reload
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movq	-40(%rbp), %rsi
	movsbl	(%rsi), %ecx
	movl	%eax, %edi
	orl	%ecx, %edi
	cmpl	$0, %edi
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movb	%dl, -89(%rbp)          # 1-byte Spill
	je	.LBB0_13
	jmp	.LBB0_4
.LBB0_13:                               #   in Loop: Header=BB0_3 Depth=2
	movq	-88(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movb	-89(%rbp), %dl          # 1-byte Reload
	movq	%rax, -104(%rbp)        # 8-byte Spill
	movb	%dl, -105(%rbp)         # 1-byte Spill
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-88(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-40(%rbp), %rdx
	movsbl	(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	movl	-44(%rbp), %esi
	movb	%sil, %r8b
	movsbl	%r8b, %esi
	cmpl	%esi, %edi
	setne	%r8b
	movq	%rax, -104(%rbp)        # 8-byte Spill
	movb	%r8b, -105(%rbp)        # 1-byte Spill
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	movb	-105(%rbp), %al         # 1-byte Reload
	movq	-104(%rbp), %rcx        # 8-byte Reload
	testb	$1, %al
	movq	%rcx, -120(%rbp)        # 8-byte Spill
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-120(%rbp), %rax        # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-40(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -40(%rbp)
	movq	%rax, -80(%rbp)         # 8-byte Spill
	jmp	.LBB0_3
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-120(%rbp), %rax        # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	-40(%rbp), %rdx
	movsbl	(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	cmpl	-44(%rbp), %edi
	movq	%rax, -128(%rbp)        # 8-byte Spill
	je	.LBB0_9
# %bb.8:
	movq	-128(%rbp), %rax        # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, -8(%rbp)
	movq	%rax, -136(%rbp)        # 8-byte Spill
	jmp	.LBB0_12
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-128(%rbp), %rax        # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -144(%rbp)        # 8-byte Spill
	jmp	.LBB0_10
.LBB0_10:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	movq	-144(%rbp), %rax        # 8-byte Reload
	movq	%rax, -64(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_11:
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	$0, -8(%rbp)
	movq	%rax, -136(%rbp)        # 8-byte Spill
.LBB0_12:
	movq	-136(%rbp), %rax        # 8-byte Reload
	movq	-8(%rbp), %rcx
	movq	%rax, -152(%rbp)        # 8-byte Spill
	movq	%rcx, %rax
	movq	-152(%rbp), %rcx        # 8-byte Reload
	shlq	$47, %rcx
	orq	%rcx, %rsp
	addq	$24, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrpbrk, .Lfunc_end0-cstrpbrk
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cstrpbrk

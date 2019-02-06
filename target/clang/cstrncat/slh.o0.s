	.text
	.file	"cstrncat.c"
	.globl	cstrncat                # -- Begin function cstrncat
	.p2align	4, 0x90
	.type	cstrncat,@function
cstrncat:                               # @cstrncat
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
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, -32(%rbp)
	movq	%rax, -40(%rbp)         # 8-byte Spill
	movq	%rcx, -48(%rbp)         # 8-byte Spill
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx
	movsbl	(%rcx), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	cmpl	$0, %esi
	movq	%rax, -56(%rbp)         # 8-byte Spill
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-32(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -32(%rbp)
	movq	%rax, -48(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_3:
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	jmp	.LBB0_4
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         # 8-byte Reload
	xorl	%ecx, %ecx
	movb	%cl, %dl
	cmpl	$0, -20(%rbp)
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movb	%dl, -73(%rbp)          # 1-byte Spill
	je	.LBB0_11
	jmp	.LBB0_5
.LBB0_11:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movb	-73(%rbp), %dl          # 1-byte Reload
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movb	%dl, -89(%rbp)          # 1-byte Spill
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_4 Depth=1
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -16(%rbp)
	movb	(%rdx), %dil
	movb	%al, %r8b
	orb	%dil, %r8b
	movq	-32(%rbp), %rdx
	movb	%r8b, (%rdx)
	movsbl	%r8b, %r9d
	cmpl	$0, %r9d
	setne	%dil
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movb	%dil, -89(%rbp)         # 1-byte Spill
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	movb	-89(%rbp), %al          # 1-byte Reload
	movq	-88(%rbp), %rcx         # 8-byte Reload
	testb	$1, %al
	movq	%rcx, -104(%rbp)        # 8-byte Spill
	jne	.LBB0_7
	jmp	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	movq	-104(%rbp), %rax        # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movl	-20(%rbp), %edx
	addl	$-1, %edx
	movl	%edx, -20(%rbp)
	movq	-32(%rbp), %rsi
	addq	$1, %rsi
	movq	%rsi, -32(%rbp)
	movq	%rax, -64(%rbp)         # 8-byte Spill
	jmp	.LBB0_4
.LBB0_8:
	movq	-104(%rbp), %rax        # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	-32(%rbp), %rdx
	movsbl	(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	cmpl	$0, %edi
	movq	%rax, -112(%rbp)        # 8-byte Spill
	je	.LBB0_12
	jmp	.LBB0_9
.LBB0_12:
	movq	-112(%rbp), %rax        # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -120(%rbp)        # 8-byte Spill
	jmp	.LBB0_10
.LBB0_9:
	movq	-112(%rbp), %rax        # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-32(%rbp), %rdx
	movb	$0, (%rdx)
	movq	%rax, -120(%rbp)        # 8-byte Spill
.LBB0_10:
	movq	-120(%rbp), %rax        # 8-byte Reload
	movq	-8(%rbp), %rcx
	movq	%rax, -128(%rbp)        # 8-byte Spill
	movq	%rcx, %rax
	movq	-128(%rbp), %rcx        # 8-byte Reload
	shlq	$47, %rcx
	orq	%rcx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cstrncat, .Lfunc_end0-cstrncat
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cstrncat

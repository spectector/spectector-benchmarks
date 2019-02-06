	.text
	.file	"insertionsort.c"
	.globl	insertionSort           # -- Begin function insertionSort
	.p2align	4, 0x90
	.type	insertionSort,@function
insertionSort:                          # @insertionSort
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
	movl	$1, -16(%rbp)
	movq	%rax, -32(%rbp)         # 8-byte Spill
	movq	%rcx, -40(%rbp)         # 8-byte Spill
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movq	-40(%rbp), %rax         # 8-byte Reload
	movl	-16(%rbp), %ecx
	cmpl	-12(%rbp), %ecx
	movq	%rax, -48(%rbp)         # 8-byte Spill
	jge	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovgeq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movslq	-16(%rbp), %rsi
	movl	(%rdx,%rsi,4), %edi
	movl	%eax, %r8d
	orl	%edi, %r8d
	movl	%r8d, -24(%rbp)
	movl	-16(%rbp), %edi
	movl	%edi, -20(%rbp)
	movq	%rax, -56(%rbp)         # 8-byte Spill
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-56(%rbp), %rax         # 8-byte Reload
	xorl	%ecx, %ecx
	movb	%cl, %dl
	cmpl	$0, -20(%rbp)
	movq	%rax, -64(%rbp)         # 8-byte Spill
	movb	%dl, -65(%rbp)          # 1-byte Spill
	jle	.LBB0_11
	jmp	.LBB0_4
.LBB0_11:                               #   in Loop: Header=BB0_3 Depth=2
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovgq	%rcx, %rax
	movb	-65(%rbp), %dl          # 1-byte Reload
	movq	%rax, -80(%rbp)         # 8-byte Spill
	movb	%dl, -81(%rbp)          # 1-byte Spill
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovleq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movl	-20(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rdi
	movl	(%rdx,%rdi,4), %esi
	movl	%eax, %r8d
	orl	%esi, %r8d
	cmpl	-24(%rbp), %r8d
	setg	%r9b
	movq	%rax, -80(%rbp)         # 8-byte Spill
	movb	%r9b, -81(%rbp)         # 1-byte Spill
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	movb	-81(%rbp), %al          # 1-byte Reload
	movq	-80(%rbp), %rcx         # 8-byte Reload
	testb	$1, %al
	movq	%rcx, -96(%rbp)         # 8-byte Spill
	jne	.LBB0_6
	jmp	.LBB0_8
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-96(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movl	-20(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rdi
	movl	(%rdx,%rdi,4), %esi
	movl	%eax, %r8d
	orl	%esi, %r8d
	movq	-8(%rbp), %rdx
	movslq	-20(%rbp), %rdi
	movl	%r8d, (%rdx,%rdi,4)
	movq	%rax, -104(%rbp)        # 8-byte Spill
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-20(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -20(%rbp)
	movq	-104(%rbp), %rcx        # 8-byte Reload
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-96(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movl	-24(%rbp), %edx
	movq	-8(%rbp), %rsi
	movslq	-20(%rbp), %rdi
	movl	%edx, (%rsi,%rdi,4)
	movq	%rax, -112(%rbp)        # 8-byte Spill
# %bb.9:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	movq	-112(%rbp), %rcx        # 8-byte Reload
	movq	%rcx, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_10:
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovlq	%rcx, %rax
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	insertionSort, .Lfunc_end0-insertionSort
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym insertionSort

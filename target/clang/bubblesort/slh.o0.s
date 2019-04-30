	.text
	.file	"bubblesort.c"
	.globl	bubbleSort              # -- Begin function bubbleSort
	.p2align	4, 0x90
	.type	bubbleSort,@function
bubbleSort:                             # @bubbleSort
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
	movl	-12(%rbp), %esi
	subl	$1, %esi
	movl	%esi, -16(%rbp)
	movq	%rax, -32(%rbp)         # 8-byte Spill
	movq	%rcx, -40(%rbp)         # 8-byte Spill
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movq	-40(%rbp), %rax         # 8-byte Reload
	cmpl	$0, -16(%rbp)
	movq	%rax, -48(%rbp)         # 8-byte Spill
	jl	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovlq	%rcx, %rax
	movl	$1, -20(%rbp)
	movq	%rax, -56(%rbp)         # 8-byte Spill
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-56(%rbp), %rax         # 8-byte Reload
	movl	-20(%rbp), %ecx
	cmpl	-16(%rbp), %ecx
	movq	%rax, -64(%rbp)         # 8-byte Spill
	jg	.LBB0_8
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovgq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movl	-20(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rdi
	movl	(%rdx,%rdi,4), %esi
	movl	%eax, %r8d
	orl	%esi, %r8d
	movq	-8(%rbp), %rdx
	movslq	-20(%rbp), %rdi
	movq	%rax, %r9
	orq	%rdx, %r9
	movq	%rax, %rdx
	orq	%rdi, %rdx
	cmpl	(%r9,%rdx,4), %r8d
	movq	%rax, -72(%rbp)         # 8-byte Spill
	jle	.LBB0_11
	jmp	.LBB0_5
.LBB0_11:                               #   in Loop: Header=BB0_3 Depth=2
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovgq	%rcx, %rax
	movq	%rax, -80(%rbp)         # 8-byte Spill
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovleq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movl	-20(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rdi
	movl	(%rdx,%rdi,4), %esi
	movl	%eax, %r8d
	orl	%esi, %r8d
	movl	%r8d, -24(%rbp)
	movq	-8(%rbp), %rdx
	movslq	-20(%rbp), %rdi
	movl	(%rdx,%rdi,4), %esi
	movl	%eax, %r8d
	orl	%esi, %r8d
	movq	-8(%rbp), %rdx
	movl	-20(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rdi
	movl	%r8d, (%rdx,%rdi,4)
	movl	-24(%rbp), %esi
	movq	-8(%rbp), %rdx
	movslq	-20(%rbp), %rdi
	movl	%esi, (%rdx,%rdi,4)
	movq	%rax, -80(%rbp)         # 8-byte Spill
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	%rax, -88(%rbp)         # 8-byte Spill
	jmp	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	movq	-88(%rbp), %rcx         # 8-byte Reload
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovleq	%rcx, %rax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	jmp	.LBB0_9
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -16(%rbp)
	movq	-96(%rbp), %rcx         # 8-byte Reload
	movq	%rcx, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_10:
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovgeq	%rcx, %rax
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	bubbleSort, .Lfunc_end0-bubbleSort
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym bubbleSort

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
	movq	$-1, %r8
	movq	%rsp, %rax
	sarq	$63, %rax
	movq	%rdi, -16(%rbp)
	movl	%esi, -24(%rbp)
	movl	-24(%rbp), %edx
	subl	$1, %edx
	movl	%edx, -8(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	$0, -8(%rbp)
	jl	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	cmovlq	%r8, %rax
	movl	$1, -4(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %edx
	cmpl	-8(%rbp), %edx
	jg	.LBB0_9
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	cmovgq	%r8, %rax
	movq	-16(%rbp), %rdx
	movl	-4(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rsi
	movl	(%rdx,%rsi,4), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	movq	-16(%rbp), %rdx
	movslq	-4(%rbp), %rdi
	movq	%rax, %rcx
	orq	%rdx, %rcx
	movq	%rax, %rdx
	orq	%rdi, %rdx
	cmpl	(%rcx,%rdx,4), %esi
	jle	.LBB0_5
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	cmovgq	%r8, %rax
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	cmovleq	%r8, %rax
	movq	-16(%rbp), %rcx
	movl	-4(%rbp), %edx
	subl	$1, %edx
	movslq	%edx, %rdx
	movl	(%rcx,%rdx,4), %ecx
	movl	%eax, %edx
	orl	%ecx, %edx
	movl	%edx, -20(%rbp)
	movq	-16(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movl	(%rcx,%rdx,4), %ecx
	movl	%eax, %edx
	orl	%ecx, %edx
	movq	-16(%rbp), %rcx
	movl	-4(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rsi
	movl	%edx, (%rcx,%rsi,4)
	movl	-20(%rbp), %ecx
	movq	-16(%rbp), %rdx
	movslq	-4(%rbp), %rsi
	movl	%ecx, (%rdx,%rsi,4)
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	jmp	.LBB0_8
.LBB0_8:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-4(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -4(%rbp)
	jmp	.LBB0_3
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	cmovleq	%r8, %rax
	jmp	.LBB0_10
.LBB0_10:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %ecx
	addl	$-1, %ecx
	movl	%ecx, -8(%rbp)
	jmp	.LBB0_1
.LBB0_11:
	cmovgeq	%r8, %rax
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

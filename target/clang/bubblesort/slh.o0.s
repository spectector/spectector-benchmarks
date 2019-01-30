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
	movq	$-1, %rcx
	movq	%rsp, %rax
	sarq	$63, %rax
	movl	array_size, %edx
	subl	$1, %edx
	movl	%edx, -8(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	$0, -8(%rbp)
	jl	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	cmovlq	%rcx, %rax
	movl	$1, -4(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %edx
	cmpl	-8(%rbp), %edx
	jg	.LBB0_9
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	cmovgq	%rcx, %rax
	movl	-4(%rbp), %edx
	subl	$1, %edx
	movslq	%edx, %rdx
	movl	numbers(,%rdx,4), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	movslq	-4(%rbp), %rdx
	movq	%rax, %rdi
	orq	%rdx, %rdi
	cmpl	numbers(,%rdi,4), %esi
	jle	.LBB0_5
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	cmovgq	%rcx, %rax
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	cmovleq	%rcx, %rax
	movl	-4(%rbp), %edx
	subl	$1, %edx
	movslq	%edx, %rdx
	movl	numbers(,%rdx,4), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	movl	%esi, -12(%rbp)
	movslq	-4(%rbp), %rdx
	movl	numbers(,%rdx,4), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	movl	-4(%rbp), %edx
	subl	$1, %edx
	movslq	%edx, %rdx
	movl	%esi, numbers(,%rdx,4)
	movl	-12(%rbp), %edx
	movslq	-4(%rbp), %rsi
	movl	%edx, numbers(,%rsi,4)
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	jmp	.LBB0_8
.LBB0_8:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-4(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -4(%rbp)
	jmp	.LBB0_3
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	cmovleq	%rcx, %rax
	jmp	.LBB0_10
.LBB0_10:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %edx
	addl	$-1, %edx
	movl	%edx, -8(%rbp)
	jmp	.LBB0_1
.LBB0_11:
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
	.type	numbers,@object         # @numbers
	.data
	.globl	numbers
	.p2align	2
numbers:
	.long	1                       # 0x1
	.size	numbers, 4

	.type	array_size,@object      # @array_size
	.globl	array_size
	.p2align	2
array_size:
	.long	1                       # 0x1
	.size	array_size, 4


	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

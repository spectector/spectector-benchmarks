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
	movl	array_size, %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	$0, -8(%rbp)
	jl	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movl	$1, -4(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.LBB0_8
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	movl	-4(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	numbers(,%rax,4), %eax
	movslq	-4(%rbp), %rcx
	cmpl	numbers(,%rcx,4), %eax
	jle	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	movl	-4(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	numbers(,%rax,4), %eax
	movl	%eax, -12(%rbp)
	movslq	-4(%rbp), %rax
	movl	numbers(,%rax,4), %eax
	movl	-4(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movl	%eax, numbers(,%rcx,4)
	movl	-12(%rbp), %eax
	movslq	-4(%rbp), %rcx
	movl	%eax, numbers(,%rcx,4)
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	jmp	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	jmp	.LBB0_9
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_10:
	lfence
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

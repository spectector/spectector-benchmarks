	.text
	.file	"selectionsort.c"
	.globl	SelectionSort           # -- Begin function SelectionSort
	.p2align	4, 0x90
	.type	SelectionSort,@function
SelectionSort:                          # @SelectionSort
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
	movl	$0, -4(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	-4(%rbp), %edx
	movl	array_size, %esi
	subl	$1, %esi
	cmpl	%esi, %edx
	jge	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	cmovgeq	%rcx, %rax
	movl	-4(%rbp), %edx
	movl	%edx, -12(%rbp)
	movl	-4(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -8(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-8(%rbp), %edx
	cmpl	array_size, %edx
	jge	.LBB0_9
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	cmovgeq	%rcx, %rax
	movslq	-8(%rbp), %rdx
	movl	a(,%rdx,4), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	movslq	-12(%rbp), %rdx
	movq	%rax, %rdi
	orq	%rdx, %rdi
	cmpl	a(,%rdi,4), %esi
	jge	.LBB0_5
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	cmovlq	%rcx, %rax
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	cmovgeq	%rcx, %rax
	movl	-8(%rbp), %edx
	movl	%edx, -12(%rbp)
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	jmp	.LBB0_8
.LBB0_8:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-8(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -8(%rbp)
	jmp	.LBB0_3
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	cmovlq	%rcx, %rax
	movslq	-4(%rbp), %rdx
	movl	a(,%rdx,4), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	movl	%esi, -16(%rbp)
	movslq	-12(%rbp), %rdx
	movl	a(,%rdx,4), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	movslq	-4(%rbp), %rdx
	movl	%esi, a(,%rdx,4)
	movl	-16(%rbp), %edx
	movslq	-12(%rbp), %rsi
	movl	%edx, a(,%rsi,4)
# %bb.10:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -4(%rbp)
	jmp	.LBB0_1
.LBB0_11:
	cmovlq	%rcx, %rax
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	SelectionSort, .Lfunc_end0-SelectionSort
	.cfi_endproc
                                        # -- End function
	.type	a,@object               # @a
	.data
	.globl	a
	.p2align	2
a:
	.long	1                       # 0x1
	.size	a, 4

	.type	array_size,@object      # @array_size
	.globl	array_size
	.p2align	2
array_size:
	.long	1                       # 0x1
	.size	array_size, 4


	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

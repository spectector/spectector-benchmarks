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
	movq	$-1, %rcx
	movq	%rsp, %rax
	sarq	$63, %rax
	movl	$1, -8(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	-8(%rbp), %edx
	cmpl	array_size, %edx
	jge	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	cmovgeq	%rcx, %rax
	movslq	-8(%rbp), %rdx
	movl	a(,%rdx,4), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	movl	%esi, -12(%rbp)
	movl	-8(%rbp), %edx
	movl	%edx, -4(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%edx, %edx
	cmpl	$0, -4(%rbp)
	jle	.LBB0_4
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=2
	cmovgq	%rcx, %rax
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	cmovleq	%rcx, %rax
	movl	-4(%rbp), %edx
	subl	$1, %edx
	movslq	%edx, %rdx
	movl	a(,%rdx,4), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	cmpl	-12(%rbp), %esi
	setg	%dl
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	testb	$1, %dl
	jne	.LBB0_7
	jmp	.LBB0_9
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	cmoveq	%rcx, %rax
	movl	-4(%rbp), %edx
	subl	$1, %edx
	movslq	%edx, %rdx
	movl	a(,%rdx,4), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	movslq	-4(%rbp), %rdx
	movl	%esi, a(,%rdx,4)
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-4(%rbp), %edx
	addl	$-1, %edx
	movl	%edx, -4(%rbp)
	jmp	.LBB0_3
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	cmovneq	%rcx, %rax
	movl	-12(%rbp), %edx
	movslq	-4(%rbp), %rsi
	movl	%edx, a(,%rsi,4)
# %bb.10:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -8(%rbp)
	jmp	.LBB0_1
.LBB0_11:
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

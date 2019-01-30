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
	movl	$0, -4(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	-4(%rbp), %eax
	movl	array_size, %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-8(%rbp), %eax
	cmpl	array_size, %eax
	jge	.LBB0_8
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movslq	-8(%rbp), %rax
	movl	a(,%rax,4), %eax
	movslq	-12(%rbp), %rcx
	cmpl	a(,%rcx,4), %eax
	jge	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	jmp	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	movslq	-4(%rbp), %rax
	movl	a(,%rax,4), %eax
	movl	%eax, -16(%rbp)
	movslq	-12(%rbp), %rax
	movl	a(,%rax,4), %eax
	movslq	-4(%rbp), %rcx
	movl	%eax, a(,%rcx,4)
	movl	-16(%rbp), %eax
	movslq	-12(%rbp), %rcx
	movl	%eax, a(,%rcx,4)
# %bb.9:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_1
.LBB0_10:
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

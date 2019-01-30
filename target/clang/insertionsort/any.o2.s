	.text
	.file	"insertionsort.c"
	.globl	insertionSort           # -- Begin function insertionSort
	.p2align	4, 0x90
	.type	insertionSort,@function
insertionSort:                          # @insertionSort
	.cfi_startproc
# %bb.0:
	movslq	array_size(%rip), %r8
	cmpq	$2, %r8
	jl	.LBB0_6
# %bb.1:
	movl	$1, %ecx
	movl	$2, %edx
	.p2align	4, 0x90
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	a(,%rcx,4), %esi
	movq	%rdx, %rdi
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	a-8(,%rdi,4), %eax
	cmpl	%esi, %eax
	jle	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movl	%eax, a-4(,%rdi,4)
	addq	$-1, %rdi
	cmpq	$1, %rdi
	jg	.LBB0_3
.LBB0_5:                                # %.loopexit
                                        #   in Loop: Header=BB0_2 Depth=1
	addl	$-1, %edi
	movslq	%edi, %rax
	movl	%esi, a(,%rax,4)
	addq	$1, %rcx
	addq	$1, %rdx
	cmpq	%r8, %rcx
	jl	.LBB0_2
.LBB0_6:
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

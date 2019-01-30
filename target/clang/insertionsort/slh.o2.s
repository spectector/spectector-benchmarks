	.text
	.file	"insertionsort.c"
	.globl	insertionSort           # -- Begin function insertionSort
	.p2align	4, 0x90
	.type	insertionSort,@function
insertionSort:                          # @insertionSort
	.cfi_startproc
# %bb.0:
	movq	%rsp, %rax
	movq	$-1, %rcx
	sarq	$63, %rax
	movslq	array_size(%rip), %r8
	cmpq	$2, %r8
	jl	.LBB0_1
# %bb.2:
	cmovlq	%rcx, %rax
	movl	$1, %r10d
	movl	$2, %r9d
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=1
	cmovgeq	%rcx, %rax
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	movl	a(,%r10,4), %edx
	orl	%eax, %edx
	movq	%r9, %rdi
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=2
	cmovleq	%rcx, %rax
.LBB0_4:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	a-8(,%rdi,4), %esi
	orl	%eax, %esi
	cmpl	%edx, %esi
	jle	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=2
	cmovleq	%rcx, %rax
	movl	%esi, a-4(,%rdi,4)
	addq	$-1, %rdi
	cmpq	$1, %rdi
	jg	.LBB0_6
.LBB0_7:                                # %.loopexit
                                        #   in Loop: Header=BB0_3 Depth=1
	cmovgq	%rcx, %rax
	addl	$-1, %edi
	movslq	%edi, %rsi
	movl	%edx, a(,%rsi,4)
	addq	$1, %r10
	addq	$1, %r9
	cmpq	%r8, %r10
	jl	.LBB0_10
# %bb.8:
	cmovlq	%rcx, %rax
	jmp	.LBB0_9
.LBB0_1:
	cmovgeq	%rcx, %rax
.LBB0_9:
	shlq	$47, %rax
	orq	%rax, %rsp
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

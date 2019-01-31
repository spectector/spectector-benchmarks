	.text
	.file	"insertionsort.c"
	.globl	insertionSort           # -- Begin function insertionSort
	.p2align	4, 0x90
	.type	insertionSort,@function
insertionSort:                          # @insertionSort
	.cfi_startproc
# %bb.0:
	cmpl	$2, %esi
	jl	.LBB0_6
# %bb.1:
	movl	%esi, %r8d
	movl	$1, %ecx
	.p2align	4, 0x90
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	(%rdi,%rcx,4), %edx
	movq	%rcx, %rsi
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rdi,%rsi,4), %eax
	cmpl	%edx, %eax
	jle	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movl	%eax, (%rdi,%rsi,4)
	addq	$-1, %rsi
	leaq	1(%rsi), %rax
	cmpq	$1, %rax
	jg	.LBB0_3
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	movslq	%esi, %rax
	movl	%edx, (%rdi,%rax,4)
	addq	$1, %rcx
	cmpq	%r8, %rcx
	jne	.LBB0_2
.LBB0_6:
	retq
.Lfunc_end0:
	.size	insertionSort, .Lfunc_end0-insertionSort
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

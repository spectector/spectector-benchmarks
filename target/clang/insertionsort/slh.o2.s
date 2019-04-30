	.text
	.file	"insertionsort.c"
	.globl	insertionSort           # -- Begin function insertionSort
	.p2align	4, 0x90
	.type	insertionSort,@function
insertionSort:                          # @insertionSort
	.cfi_startproc
# %bb.0:
	movq	%rsp, %rax
	movq	$-1, %r10
	sarq	$63, %rax
	cmpl	$2, %esi
	jl	.LBB0_1
# %bb.2:
	cmovlq	%r10, %rax
	movl	%esi, %r8d
	movl	$1, %r9d
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=1
	cmoveq	%r10, %rax
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	movl	(%rdi,%r9,4), %edx
	orl	%eax, %edx
	movq	%r9, %rsi
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=2
	cmovleq	%r10, %rax
.LBB0_4:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rdi,%rsi,4), %ecx
	orl	%eax, %ecx
	cmpl	%edx, %ecx
	jle	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=2
	cmovleq	%r10, %rax
	movl	%ecx, (%rdi,%rsi,4)
	addq	$-1, %rsi
	leaq	1(%rsi), %rcx
	cmpq	$1, %rcx
	jg	.LBB0_6
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=1
	cmovgq	%r10, %rax
	movslq	%esi, %rcx
	movl	%edx, (%rdi,%rcx,4)
	addq	$1, %r9
	cmpq	%r8, %r9
	jne	.LBB0_10
# %bb.8:
	cmovneq	%r10, %rax
	jmp	.LBB0_9
.LBB0_1:
	cmovgeq	%r10, %rax
.LBB0_9:
	shlq	$47, %rax
	orq	%rax, %rsp
	retq
.Lfunc_end0:
	.size	insertionSort, .Lfunc_end0-insertionSort
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

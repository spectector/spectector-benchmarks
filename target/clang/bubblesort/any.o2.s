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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	array_size(%rip), %r9d
	testl	%r9d, %r9d
	jle	.LBB0_15
# %bb.1:
	leaq	-2(%r9), %r8
	movl	%r9d, %r11d
	addb	$1, %r11b
	xorl	%esi, %esi
	movq	%r9, %rdi
	movl	%r9d, %ecx
	.p2align	4, 0x90
.LBB0_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
	cmpl	$2, %ecx
	jl	.LBB0_5
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	movq	%rsi, %r10
	notq	%r10
	addq	%r9, %r10
	movl	numbers(%rip), %eax
	cmpq	%rsi, %r8
	jne	.LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=1
	movl	$1, %edx
	testb	$1, %r10b
	jne	.LBB0_3
	jmp	.LBB0_5
	.p2align	4, 0x90
.LBB0_9:                                #   in Loop: Header=BB0_6 Depth=1
	movzbl	%r11b, %edx
	andl	$1, %edx
	movq	%rdi, %rbx
	subq	%rdx, %rbx
	movl	$1, %edx
	.p2align	4, 0x90
.LBB0_10:                               #   Parent Loop BB0_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	numbers(,%rdx,4), %ebp
	cmpl	%ebp, %eax
	jle	.LBB0_11
# %bb.12:                               #   in Loop: Header=BB0_10 Depth=2
	movl	%ebp, numbers-4(,%rdx,4)
	movl	%eax, numbers(,%rdx,4)
	jmp	.LBB0_13
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_10 Depth=2
	movl	%ebp, %eax
.LBB0_13:                               #   in Loop: Header=BB0_10 Depth=2
	movl	numbers+4(,%rdx,4), %ebp
	cmpl	%ebp, %eax
	jle	.LBB0_14
# %bb.16:                               #   in Loop: Header=BB0_10 Depth=2
	movl	%ebp, numbers(,%rdx,4)
	movl	%eax, numbers+4(,%rdx,4)
	jmp	.LBB0_17
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_10 Depth=2
	movl	%ebp, %eax
.LBB0_17:                               #   in Loop: Header=BB0_10 Depth=2
	addq	$2, %rdx
	cmpq	%rdx, %rbx
	jne	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_6 Depth=1
	testb	$1, %r10b
	je	.LBB0_5
.LBB0_3:                                #   in Loop: Header=BB0_6 Depth=1
	movl	numbers(,%rdx,4), %ebp
	cmpl	%ebp, %eax
	jle	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_6 Depth=1
	movl	%ebp, numbers-4(,%rdx,4)
	movl	%eax, numbers(,%rdx,4)
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=1
	addl	$-1, %ecx
	addq	$1, %rsi
	addb	$1, %r11b
	cmpq	$2, %rdi
	leaq	-1(%rdi), %rdi
	jge	.LBB0_6
.LBB0_15:
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
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

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
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	testl	%esi, %esi
	jle	.LBB0_15
# %bb.1:
	lfence
	movl	%esi, %r9d
	leaq	-2(%r9), %r8
	movl	%esi, %r10d
	addb	$1, %r10b
	xorl	%r14d, %r14d
	movq	%r9, %rcx
	.p2align	4, 0x90
.LBB0_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
	lfence
	cmpl	$2, %esi
	jl	.LBB0_5
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	lfence
	movq	%r14, %r11
	notq	%r11
	addq	%r9, %r11
	movl	(%rdi), %edx
	cmpq	%r14, %r8
	jne	.LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=1
	lfence
	movl	$1, %ebx
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_9:                                #   in Loop: Header=BB0_6 Depth=1
	lfence
	movzbl	%r10b, %ebx
	andl	$1, %ebx
	movq	%rcx, %rax
	subq	%rbx, %rax
	movl	$1, %ebx
	.p2align	4, 0x90
.LBB0_10:                               #   Parent Loop BB0_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lfence
	movl	(%rdi,%rbx,4), %ebp
	cmpl	%ebp, %edx
	jle	.LBB0_11
# %bb.12:                               #   in Loop: Header=BB0_10 Depth=2
	lfence
	movl	%ebp, -4(%rdi,%rbx,4)
	movl	%edx, (%rdi,%rbx,4)
	jmp	.LBB0_13
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_10 Depth=2
	movl	%ebp, %edx
.LBB0_13:                               #   in Loop: Header=BB0_10 Depth=2
	lfence
	movl	4(%rdi,%rbx,4), %ebp
	cmpl	%ebp, %edx
	jle	.LBB0_14
# %bb.16:                               #   in Loop: Header=BB0_10 Depth=2
	lfence
	movl	%ebp, (%rdi,%rbx,4)
	movl	%edx, 4(%rdi,%rbx,4)
	jmp	.LBB0_17
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_10 Depth=2
	movl	%ebp, %edx
.LBB0_17:                               #   in Loop: Header=BB0_10 Depth=2
	lfence
	addq	$2, %rbx
	cmpq	%rbx, %rax
	jne	.LBB0_10
.LBB0_2:                                #   in Loop: Header=BB0_6 Depth=1
	lfence
	testb	$1, %r11b
	je	.LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_6 Depth=1
	lfence
	movl	(%rdi,%rbx,4), %eax
	cmpl	%eax, %edx
	jle	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_6 Depth=1
	lfence
	movl	%eax, -4(%rdi,%rbx,4)
	movl	%edx, (%rdi,%rbx,4)
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=1
	lfence
	addl	$-1, %esi
	addq	$1, %r14
	addb	$1, %r10b
	cmpq	$2, %rcx
	leaq	-1(%rcx), %rcx
	jge	.LBB0_6
.LBB0_15:
	lfence
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	bubbleSort, .Lfunc_end0-bubbleSort
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

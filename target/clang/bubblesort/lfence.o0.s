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
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %esi
	subl	$1, %esi
	movl	%esi, -16(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	cmpl	$0, -16(%rbp)
	jl	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	movl	$1, -20(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-20(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB0_8
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movl	(%rax,%rdx,4), %ecx
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rdx
	cmpl	(%rax,%rdx,4), %ecx
	jle	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movl	(%rax,%rdx,4), %ecx
	movl	%ecx, -24(%rbp)
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rdx
	movl	(%rax,%rdx,4), %ecx
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rdx
	movl	%ecx, (%rax,%rdx,4)
	movl	-24(%rbp), %ecx
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rdx
	movl	%ecx, (%rax,%rdx,4)
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	lfence
	jmp	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	lfence
	jmp	.LBB0_9
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -16(%rbp)
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

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym bubbleSort

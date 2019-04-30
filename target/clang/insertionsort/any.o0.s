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
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$1, -16(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -24(%rbp)
	movl	-16(%rbp), %edx
	movl	%edx, -20(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%eax, %eax
	movb	%al, %cl
	cmpl	$0, -20(%rbp)
	movb	%cl, -25(%rbp)          # 1-byte Spill
	jle	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movl	(%rax,%rdx,4), %ecx
	cmpl	-24(%rbp), %ecx
	setg	%sil
	movb	%sil, -25(%rbp)         # 1-byte Spill
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	movb	-25(%rbp), %al          # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_6
	jmp	.LBB0_8
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movl	(%rax,%rdx,4), %ecx
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rdx
	movl	%ecx, (%rax,%rdx,4)
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-20(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-24(%rbp), %eax
	movq	-8(%rbp), %rcx
	movslq	-20(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
# %bb.9:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB0_1
.LBB0_10:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	insertionSort, .Lfunc_end0-insertionSort
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym insertionSort

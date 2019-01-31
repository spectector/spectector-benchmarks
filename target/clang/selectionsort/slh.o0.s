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
	movq	$-1, %r8
	movq	%rsp, %rax
	sarq	$63, %rax
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	-4(%rbp), %edx
	movl	-28(%rbp), %esi
	subl	$1, %esi
	cmpl	%esi, %edx
	jge	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	cmovgeq	%r8, %rax
	movl	-4(%rbp), %edx
	movl	%edx, -12(%rbp)
	movl	-4(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -8(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-8(%rbp), %edx
	cmpl	-28(%rbp), %edx
	jge	.LBB0_9
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	cmovgeq	%r8, %rax
	movq	-24(%rbp), %rdx
	movslq	-8(%rbp), %rsi
	movl	(%rdx,%rsi,4), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	movq	-24(%rbp), %rdx
	movslq	-12(%rbp), %rdi
	movq	%rax, %rcx
	orq	%rdx, %rcx
	movq	%rax, %rdx
	orq	%rdi, %rdx
	cmpl	(%rcx,%rdx,4), %esi
	jge	.LBB0_5
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	cmovlq	%r8, %rax
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	cmovgeq	%r8, %rax
	movl	-8(%rbp), %ecx
	movl	%ecx, -12(%rbp)
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	jmp	.LBB0_8
.LBB0_8:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	jmp	.LBB0_3
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	cmovlq	%r8, %rax
	movq	-24(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movl	(%rcx,%rdx,4), %ecx
	movl	%eax, %edx
	orl	%ecx, %edx
	movl	%edx, -32(%rbp)
	movq	-24(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movl	(%rcx,%rdx,4), %ecx
	movl	%eax, %edx
	orl	%ecx, %edx
	movq	-24(%rbp), %rcx
	movslq	-4(%rbp), %rsi
	movl	%edx, (%rcx,%rsi,4)
	movl	-32(%rbp), %ecx
	movq	-24(%rbp), %rdx
	movslq	-12(%rbp), %rsi
	movl	%ecx, (%rdx,%rsi,4)
# %bb.10:                               #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -4(%rbp)
	jmp	.LBB0_1
.LBB0_11:
	cmovlq	%r8, %rax
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	SelectionSort, .Lfunc_end0-SelectionSort
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

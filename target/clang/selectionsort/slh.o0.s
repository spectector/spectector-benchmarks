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
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
	movq	%rax, -40(%rbp)         # 8-byte Spill
	movq	%rcx, -48(%rbp)         # 8-byte Spill
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movq	-48(%rbp), %rax         # 8-byte Reload
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %edx
	subl	$1, %edx
	cmpl	%edx, %ecx
	movq	%rax, -56(%rbp)         # 8-byte Spill
	jge	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovgeq	%rcx, %rax
	movl	-16(%rbp), %edx
	movl	%edx, -24(%rbp)
	movl	-16(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -20(%rbp)
	movq	%rax, -64(%rbp)         # 8-byte Spill
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-64(%rbp), %rax         # 8-byte Reload
	movl	-20(%rbp), %ecx
	cmpl	-12(%rbp), %ecx
	movq	%rax, -72(%rbp)         # 8-byte Spill
	jge	.LBB0_8
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovgeq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movslq	-20(%rbp), %rsi
	movl	(%rdx,%rsi,4), %edi
	movl	%eax, %r8d
	orl	%edi, %r8d
	movq	-8(%rbp), %rdx
	movslq	-24(%rbp), %rsi
	movq	%rax, %r9
	orq	%rdx, %r9
	movq	%rax, %rdx
	orq	%rsi, %rdx
	cmpl	(%r9,%rdx,4), %r8d
	movq	%rax, -80(%rbp)         # 8-byte Spill
	jge	.LBB0_11
	jmp	.LBB0_5
.LBB0_11:                               #   in Loop: Header=BB0_3 Depth=2
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovlq	%rcx, %rax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	jmp	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovgeq	%rcx, %rax
	movl	-20(%rbp), %edx
	movl	%edx, -24(%rbp)
	movq	%rax, -88(%rbp)         # 8-byte Spill
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-88(%rbp), %rax         # 8-byte Reload
	movq	%rax, -96(%rbp)         # 8-byte Spill
	jmp	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	movq	-96(%rbp), %rcx         # 8-byte Reload
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovlq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movslq	-16(%rbp), %rsi
	movl	(%rdx,%rsi,4), %edi
	movl	%eax, %r8d
	orl	%edi, %r8d
	movl	%r8d, -28(%rbp)
	movq	-8(%rbp), %rdx
	movslq	-24(%rbp), %rsi
	movl	(%rdx,%rsi,4), %edi
	movl	%eax, %r8d
	orl	%edi, %r8d
	movq	-8(%rbp), %rdx
	movslq	-16(%rbp), %rsi
	movl	%r8d, (%rdx,%rsi,4)
	movl	-28(%rbp), %edi
	movq	-8(%rbp), %rdx
	movslq	-24(%rbp), %rsi
	movl	%edi, (%rdx,%rsi,4)
	movq	%rax, -104(%rbp)        # 8-byte Spill
# %bb.9:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	movq	-104(%rbp), %rcx        # 8-byte Reload
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_10:
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovlq	%rcx, %rax
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
	.addrsig
	.addrsig_sym SelectionSort

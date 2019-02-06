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
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsp, %r8
                                        # kill: def $esi killed $esi def $rsi
	movq	$-1, %r13
	sarq	$63, %r8
	cmpl	$2, %esi
	jl	.LBB0_1
# %bb.3:
	cmovlq	%r13, %r8
	movslq	%esi, %r9
	movl	%esi, %r12d
	addl	$-1, %esi
	leaq	-2(%r12), %rax
	movq	%rax, -8(%rsp)          # 8-byte Spill
	movl	$1, %r10d
	xorl	%r11d, %r11d
	movq	%rsi, -24(%rsp)         # 8-byte Spill
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_35:                               #   in Loop: Header=BB0_4 Depth=1
	cmoveq	%r13, %r8
	movq	%rbx, %r11
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_11 Depth 2
                                        #     Child Loop BB0_20 Depth 2
	leaq	1(%r11), %rbx
	cmpq	%r9, %rbx
	jge	.LBB0_5
# %bb.8:                                #   in Loop: Header=BB0_4 Depth=1
	cmovgeq	%r13, %r8
	movq	-8(%rsp), %r15          # 8-byte Reload
	subq	%r11, %r15
	movl	%r11d, %edx
	notl	%edx
	leal	(%r12,%rdx), %edx
	andq	$3, %rdx
	movq	%rbx, -16(%rsp)         # 8-byte Spill
	je	.LBB0_9
# %bb.10:                               #   in Loop: Header=BB0_4 Depth=1
	movq	%r9, %rsi
	cmoveq	%r13, %r8
	negq	%rdx
	movq	%r10, %rbx
	movl	%r11d, %r14d
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_36:                               #   in Loop: Header=BB0_11 Depth=2
	cmoveq	%r13, %r8
.LBB0_11:                               #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rdi,%rbx,4), %ecx
	orl	%r8d, %ecx
	movslq	%r14d, %r9
	movq	%r8, %rax
	orq	%rdi, %rax
	orq	%r8, %r9
	cmpl	(%rax,%r9,4), %ecx
	jl	.LBB0_12
# %bb.13:                               #   in Loop: Header=BB0_11 Depth=2
	cmovlq	%r13, %r8
	jmp	.LBB0_14
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_11 Depth=2
	cmovgeq	%r13, %r8
	movl	%ebx, %r14d
.LBB0_14:                               #   in Loop: Header=BB0_11 Depth=2
	addq	$1, %rbx
	addq	$1, %rdx
	jne	.LBB0_36
# %bb.15:                               #   in Loop: Header=BB0_4 Depth=1
	cmovneq	%r13, %r8
	movq	%rsi, %r9
	cmpq	$3, %r15
	jae	.LBB0_19
.LBB0_17:                               #   in Loop: Header=BB0_4 Depth=1
	cmovaeq	%r13, %r8
	jmp	.LBB0_18
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_4 Depth=1
	cmovlq	%r13, %r8
	movl	%r11d, %r14d
	jmp	.LBB0_6
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	cmovneq	%r13, %r8
	movq	%r10, %rbx
	movl	%r11d, %r14d
	cmpq	$3, %r15
	jb	.LBB0_17
.LBB0_19:                               #   in Loop: Header=BB0_4 Depth=1
	cmovbq	%r13, %r8
	jmp	.LBB0_20
	.p2align	4, 0x90
.LBB0_34:                               #   in Loop: Header=BB0_20 Depth=2
	cmoveq	%r13, %r8
.LBB0_20:                               #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%r14d, %rax
	movl	(%rdi,%rbx,4), %ecx
	orl	%r8d, %ecx
	movl	4(%rdi,%rbx,4), %edx
	orl	%r8d, %edx
	movq	%r8, %rbp
	orq	%rdi, %rbp
	orq	%r8, %rax
	cmpl	(%rbp,%rax,4), %ecx
	jl	.LBB0_21
# %bb.22:                               #   in Loop: Header=BB0_20 Depth=2
	cmovlq	%r13, %r8
	jmp	.LBB0_23
	.p2align	4, 0x90
.LBB0_21:                               #   in Loop: Header=BB0_20 Depth=2
	cmovgeq	%r13, %r8
	movl	%ebx, %r14d
.LBB0_23:                               #   in Loop: Header=BB0_20 Depth=2
	movslq	%r14d, %rax
	movq	%r8, %rcx
	orq	%rdi, %rcx
	orq	%r8, %rax
	cmpl	(%rcx,%rax,4), %edx
	jl	.LBB0_24
# %bb.25:                               #   in Loop: Header=BB0_20 Depth=2
	cmovlq	%r13, %r8
	jmp	.LBB0_26
	.p2align	4, 0x90
.LBB0_24:                               #   in Loop: Header=BB0_20 Depth=2
	cmovgeq	%r13, %r8
	leal	1(%rbx), %r14d
.LBB0_26:                               #   in Loop: Header=BB0_20 Depth=2
	movl	8(%rdi,%rbx,4), %eax
	orl	%r8d, %eax
	movslq	%r14d, %rcx
	movq	%r8, %rdx
	orq	%rdi, %rdx
	orq	%r8, %rcx
	cmpl	(%rdx,%rcx,4), %eax
	jl	.LBB0_27
# %bb.28:                               #   in Loop: Header=BB0_20 Depth=2
	cmovlq	%r13, %r8
	jmp	.LBB0_29
	.p2align	4, 0x90
.LBB0_27:                               #   in Loop: Header=BB0_20 Depth=2
	cmovgeq	%r13, %r8
	leal	2(%rbx), %r14d
.LBB0_29:                               #   in Loop: Header=BB0_20 Depth=2
	movl	12(%rdi,%rbx,4), %eax
	orl	%r8d, %eax
	movslq	%r14d, %rcx
	movq	%r8, %rdx
	orq	%rdi, %rdx
	orq	%r8, %rcx
	cmpl	(%rdx,%rcx,4), %eax
	jl	.LBB0_30
# %bb.31:                               #   in Loop: Header=BB0_20 Depth=2
	cmovlq	%r13, %r8
	jmp	.LBB0_32
	.p2align	4, 0x90
.LBB0_30:                               #   in Loop: Header=BB0_20 Depth=2
	cmovgeq	%r13, %r8
	leal	3(%rbx), %r14d
.LBB0_32:                               #   in Loop: Header=BB0_20 Depth=2
	addq	$4, %rbx
	cmpq	%r12, %rbx
	jne	.LBB0_34
# %bb.33:                               #   in Loop: Header=BB0_4 Depth=1
	cmovneq	%r13, %r8
.LBB0_18:                               #   in Loop: Header=BB0_4 Depth=1
	movq	-24(%rsp), %rsi         # 8-byte Reload
	movq	-16(%rsp), %rbx         # 8-byte Reload
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	movl	(%rdi,%r11,4), %eax
	orl	%r8d, %eax
	movslq	%r14d, %rcx
	movl	(%rdi,%rcx,4), %edx
	orl	%r8d, %edx
	movl	%edx, (%rdi,%r11,4)
	movl	%eax, (%rdi,%rcx,4)
	addq	$1, %r10
	cmpq	%rsi, %rbx
	jne	.LBB0_35
# %bb.7:
	cmovneq	%r13, %r8
	jmp	.LBB0_2
.LBB0_1:
	cmovgeq	%r13, %r8
.LBB0_2:
	shlq	$47, %r8
	orq	%r8, %rsp
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	SelectionSort, .Lfunc_end0-SelectionSort
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

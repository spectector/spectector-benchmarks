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
                                        # kill: def $esi killed $esi def $rsi
	cmpl	$2, %esi
	jl	.LBB0_25
# %bb.1:
	lfence
	movslq	%esi, %r9
	movl	%esi, %r12d
	addl	$-1, %esi
	leaq	-2(%r12), %r8
	movl	$1, %r11d
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
                                        #     Child Loop BB0_12 Depth 2
	movq	%r10, %r15
	lfence
	leaq	1(%r10), %r10
	cmpq	%r9, %r10
	jge	.LBB0_3
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	lfence
	movq	%r8, %r14
	subq	%r15, %r14
	movl	%r15d, %eax
	notl	%eax
	leal	(%r12,%rax), %ebx
	andq	$3, %rbx
	je	.LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_2 Depth=1
	lfence
	negq	%rbx
	movq	%r11, %rdx
	movl	%r15d, %ebp
	.p2align	4, 0x90
.LBB0_7:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lfence
	movl	(%rdi,%rdx,4), %r13d
	movslq	%ebp, %rcx
	movl	%edx, %eax
	cmpl	(%rdi,%rcx,4), %r13d
	jl	.LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	lfence
	movl	%ebp, %eax
.LBB0_9:                                #   in Loop: Header=BB0_7 Depth=2
	lfence
	addq	$1, %rdx
	movl	%eax, %ebp
	addq	$1, %rbx
	jne	.LBB0_7
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_3:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%r15d, %ebx
	jmp	.LBB0_24
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	movq	%r11, %rdx
	movl	%r15d, %eax
.LBB0_10:                               #   in Loop: Header=BB0_2 Depth=1
	lfence
	movl	%eax, %ebx
	cmpq	$3, %r14
	jb	.LBB0_24
# %bb.11:                               #   in Loop: Header=BB0_2 Depth=1
	lfence
	.p2align	4, 0x90
.LBB0_12:                               #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lfence
	movslq	%eax, %rcx
	movl	(%rdi,%rdx,4), %ebp
	movl	4(%rdi,%rdx,4), %r14d
	movl	%edx, %ebx
	cmpl	(%rdi,%rcx,4), %ebp
	jl	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=2
	lfence
	movl	%eax, %ebx
.LBB0_14:                               #   in Loop: Header=BB0_12 Depth=2
	lfence
	movslq	%ebx, %rax
	cmpl	(%rdi,%rax,4), %r14d
	jl	.LBB0_15
# %bb.16:                               #   in Loop: Header=BB0_12 Depth=2
	lfence
	jmp	.LBB0_17
	.p2align	4, 0x90
.LBB0_15:                               #   in Loop: Header=BB0_12 Depth=2
	lfence
	leal	1(%rdx), %ebx
.LBB0_17:                               #   in Loop: Header=BB0_12 Depth=2
	movl	8(%rdi,%rdx,4), %eax
	movslq	%ebx, %rcx
	cmpl	(%rdi,%rcx,4), %eax
	jl	.LBB0_18
# %bb.19:                               #   in Loop: Header=BB0_12 Depth=2
	lfence
	jmp	.LBB0_20
	.p2align	4, 0x90
.LBB0_18:                               #   in Loop: Header=BB0_12 Depth=2
	lfence
	leal	2(%rdx), %ebx
.LBB0_20:                               #   in Loop: Header=BB0_12 Depth=2
	movl	12(%rdi,%rdx,4), %eax
	movslq	%ebx, %rcx
	cmpl	(%rdi,%rcx,4), %eax
	jl	.LBB0_21
# %bb.22:                               #   in Loop: Header=BB0_12 Depth=2
	lfence
	jmp	.LBB0_23
	.p2align	4, 0x90
.LBB0_21:                               #   in Loop: Header=BB0_12 Depth=2
	lfence
	leal	3(%rdx), %ebx
.LBB0_23:                               #   in Loop: Header=BB0_12 Depth=2
	addq	$4, %rdx
	movl	%ebx, %eax
	cmpq	%r12, %rdx
	jne	.LBB0_12
.LBB0_24:                               #   in Loop: Header=BB0_2 Depth=1
	lfence
	movl	(%rdi,%r15,4), %eax
	movslq	%ebx, %rcx
	movl	(%rdi,%rcx,4), %edx
	movl	%edx, (%rdi,%r15,4)
	movl	%eax, (%rdi,%rcx,4)
	addq	$1, %r11
	cmpq	%rsi, %r10
	jne	.LBB0_2
.LBB0_25:
	lfence
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

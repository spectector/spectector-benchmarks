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
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movslq	array_size(%rip), %r10
	cmpq	$2, %r10
	jl	.LBB0_16
# %bb.1:
	lfence
	leaq	-1(%r10), %r9
	movl	%r10d, %edx
	leaq	-2(%rdx), %r8
	movl	$1, %eax
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
	movq	%r11, %r14
	lfence
	leaq	1(%r11), %r11
	cmpq	%r10, %r11
	jge	.LBB0_3
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	lfence
	movl	%r14d, %ecx
	notl	%ecx
	leal	(%rdx,%rcx), %ecx
	testb	$1, %cl
	jne	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_2 Depth=1
                                        # implicit-def: $ecx
	movq	%rax, %rdi
	movl	%r14d, %ebx
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_3:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%r14d, %ecx
	jmp	.LBB0_15
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	lfence
	movl	a(,%rax,4), %ecx
	movslq	%r14d, %rdi
	cmpl	a(,%rdi,4), %ecx
	movl	%r14d, %ecx
	cmovll	%eax, %ecx
	leaq	1(%rax), %rdi
	movl	%ecx, %ebx
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	lfence
	cmpq	%r14, %r8
	je	.LBB0_15
# %bb.8:                                # %.preheader
                                        #   in Loop: Header=BB0_2 Depth=1
	lfence
	.p2align	4, 0x90
.LBB0_9:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lfence
	movl	a(,%rdi,4), %ebp
	movslq	%ebx, %rsi
	movl	%edi, %ecx
	cmpl	a(,%rsi,4), %ebp
	jl	.LBB0_11
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=2
	lfence
	movl	%ebx, %ecx
.LBB0_11:                               #   in Loop: Header=BB0_9 Depth=2
	lfence
	movl	a+4(,%rdi,4), %esi
	movslq	%ecx, %rbx
	cmpl	a(,%rbx,4), %esi
	jl	.LBB0_12
# %bb.13:                               #   in Loop: Header=BB0_9 Depth=2
	lfence
	jmp	.LBB0_14
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_9 Depth=2
	lfence
	leal	1(%rdi), %ecx
.LBB0_14:                               #   in Loop: Header=BB0_9 Depth=2
	addq	$2, %rdi
	movl	%ecx, %ebx
	cmpq	%rdx, %rdi
	jne	.LBB0_9
.LBB0_15:                               #   in Loop: Header=BB0_2 Depth=1
	lfence
	movl	a(,%r14,4), %esi
	movslq	%ecx, %rcx
	movl	%esi, a(,%rcx,4)
	addq	$1, %rax
	cmpq	%r9, %r11
	jl	.LBB0_2
.LBB0_16:
	lfence
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	SelectionSort, .Lfunc_end0-SelectionSort
	.cfi_endproc
                                        # -- End function
	.type	a,@object               # @a
	.data
	.globl	a
	.p2align	2
a:
	.long	1                       # 0x1
	.size	a, 4

	.type	array_size,@object      # @array_size
	.globl	array_size
	.p2align	2
array_size:
	.long	1                       # 0x1
	.size	array_size, 4


	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

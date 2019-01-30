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
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsp, %rax
	movq	$-1, %rcx
	sarq	$63, %rax
	movslq	array_size(%rip), %r10
	cmpq	$2, %r10
	jl	.LBB0_1
# %bb.2:
	cmovlq	%rcx, %rax
	leaq	-1(%r10), %r9
	movl	%r10d, %edi
	leaq	-2(%rdi), %r8
	movl	$1, %r15d
	xorl	%r14d, %r14d
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_20:                               #   in Loop: Header=BB0_3 Depth=1
	cmovgeq	%rcx, %rax
	movq	%r11, %r14
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
	leaq	1(%r14), %r11
	cmpq	%r10, %r11
	jge	.LBB0_4
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	cmovgeq	%rcx, %rax
	movl	%r14d, %esi
	notl	%esi
	leal	(%rdi,%rsi), %esi
	testb	$1, %sil
	jne	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	cmovneq	%rcx, %rax
	movq	%r15, %rsi
	movl	%r14d, %ebx
	cmpq	%r14, %r8
	jne	.LBB0_9
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=1
	cmovlq	%rcx, %rax
	movl	%r14d, %ebx
	jmp	.LBB0_17
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=1
	cmoveq	%rcx, %rax
	movl	a(,%r15,4), %esi
	orl	%eax, %esi
	movslq	%r14d, %rbx
	orq	%rax, %rbx
	cmpl	a(,%rbx,4), %esi
	movl	%r14d, %ebx
	cmovll	%r15d, %ebx
	leaq	1(%r15), %rsi
	cmpq	%r14, %r8
	je	.LBB0_16
	.p2align	4, 0x90
.LBB0_9:                                # %.preheader
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmoveq	%rcx, %rax
	movl	a(,%rsi,4), %ebp
	orl	%eax, %ebp
	movslq	%ebx, %rdx
	orq	%rax, %rdx
	cmpl	a(,%rdx,4), %ebp
	jl	.LBB0_10
# %bb.11:                               #   in Loop: Header=BB0_9 Depth=2
	cmovlq	%rcx, %rax
	jmp	.LBB0_12
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_9 Depth=2
	cmovgeq	%rcx, %rax
	movl	%esi, %ebx
.LBB0_12:                               #   in Loop: Header=BB0_9 Depth=2
	movl	a+4(,%rsi,4), %edx
	orl	%eax, %edx
	movslq	%ebx, %rbp
	orq	%rax, %rbp
	cmpl	a(,%rbp,4), %edx
	jl	.LBB0_13
# %bb.14:                               #   in Loop: Header=BB0_9 Depth=2
	cmovlq	%rcx, %rax
	jmp	.LBB0_15
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_9 Depth=2
	cmovgeq	%rcx, %rax
	leal	1(%rsi), %ebx
.LBB0_15:                               #   in Loop: Header=BB0_9 Depth=2
	addq	$2, %rsi
	cmpq	%rdi, %rsi
	jne	.LBB0_9
.LBB0_16:                               #   in Loop: Header=BB0_3 Depth=1
	cmovneq	%rcx, %rax
.LBB0_17:                               #   in Loop: Header=BB0_3 Depth=1
	movl	a(,%r14,4), %edx
	orl	%eax, %edx
	movslq	%ebx, %rsi
	movl	%edx, a(,%rsi,4)
	addq	$1, %r15
	cmpq	%r9, %r11
	jl	.LBB0_20
# %bb.18:
	cmovlq	%rcx, %rax
	jmp	.LBB0_19
.LBB0_1:
	cmovgeq	%rcx, %rax
.LBB0_19:
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbx
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

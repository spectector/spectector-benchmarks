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
	movl	array_size(%rip), %r9d
	testl	%r9d, %r9d
	jle	.LBB0_1
# %bb.10:
	cmovleq	%rcx, %rax
	leaq	-2(%r9), %r8
	movl	%r9d, %r10d
	addb	$1, %r10b
	xorl	%r14d, %r14d
	movq	%r9, %rdx
	movl	%r9d, %r15d
	cmpl	$2, %r15d
	jge	.LBB0_13
	jmp	.LBB0_12
	.p2align	4, 0x90
.LBB0_9:
	cmovlq	%rcx, %rax
	cmpl	$2, %r15d
	jl	.LBB0_12
.LBB0_13:
	cmovlq	%rcx, %rax
	movq	%r14, %r11
	notq	%r11
	addq	%r9, %r11
	movl	numbers(%rip), %ebp
	cmpq	%r14, %r8
	jne	.LBB0_15
# %bb.14:
	cmovneq	%rcx, %rax
	movl	$1, %esi
	testb	$1, %r11b
	je	.LBB0_4
.LBB0_5:
	cmoveq	%rcx, %rax
	movl	numbers(,%rsi,4), %edi
	orl	%eax, %edi
	cmpl	%edi, %ebp
	jle	.LBB0_6
# %bb.7:
	cmovleq	%rcx, %rax
	movl	%edi, numbers-4(,%rsi,4)
	movl	%ebp, numbers(,%rsi,4)
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_12:
	cmovgeq	%rcx, %rax
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_15:
	cmoveq	%rcx, %rax
	movzbl	%r10b, %esi
	andl	$1, %esi
	movq	%rdx, %rdi
	subq	%rsi, %rdi
	movl	$1, %esi
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_25:                               #   in Loop: Header=BB0_16 Depth=1
	cmoveq	%rcx, %rax
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	movl	numbers(,%rsi,4), %ebx
	orl	%eax, %ebx
	cmpl	%ebx, %ebp
	jle	.LBB0_17
# %bb.18:                               #   in Loop: Header=BB0_16 Depth=1
	cmovleq	%rcx, %rax
	movl	%ebx, numbers-4(,%rsi,4)
	movl	%ebp, numbers(,%rsi,4)
	movl	%ebp, %ebx
	jmp	.LBB0_19
	.p2align	4, 0x90
.LBB0_17:                               #   in Loop: Header=BB0_16 Depth=1
	cmovgq	%rcx, %rax
.LBB0_19:                               #   in Loop: Header=BB0_16 Depth=1
	movl	numbers+4(,%rsi,4), %ebp
	orl	%eax, %ebp
	cmpl	%ebp, %ebx
	jle	.LBB0_20
# %bb.23:                               #   in Loop: Header=BB0_16 Depth=1
	cmovleq	%rcx, %rax
	movl	%ebp, numbers(,%rsi,4)
	movl	%ebx, numbers+4(,%rsi,4)
	movl	%ebx, %ebp
	jmp	.LBB0_24
	.p2align	4, 0x90
.LBB0_20:                               #   in Loop: Header=BB0_16 Depth=1
	cmovgq	%rcx, %rax
.LBB0_24:                               #   in Loop: Header=BB0_16 Depth=1
	addq	$2, %rsi
	cmpq	%rsi, %rdi
	jne	.LBB0_25
# %bb.2:
	cmovneq	%rcx, %rax
	testb	$1, %r11b
	jne	.LBB0_5
.LBB0_4:
	cmovneq	%rcx, %rax
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_6:
	cmovgq	%rcx, %rax
	.p2align	4, 0x90
.LBB0_8:
	addl	$-1, %r15d
	addq	$1, %r14
	addb	$1, %r10b
	cmpq	$2, %rdx
	leaq	-1(%rdx), %rdx
	jge	.LBB0_9
# %bb.21:
	cmovgeq	%rcx, %rax
	jmp	.LBB0_22
.LBB0_1:
	cmovgq	%rcx, %rax
.LBB0_22:
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

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
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsp, %rax
	movq	$-1, %r12
	sarq	$63, %rax
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.10:
	cmovleq	%r12, %rax
	movl	%esi, %r9d
	leaq	-2(%r9), %r8
	movl	%esi, %r10d
	addb	$1, %r10b
	xorl	%r11d, %r11d
	movq	%r9, %r15
	cmpl	$2, %esi
	jge	.LBB0_13
	jmp	.LBB0_12
	.p2align	4, 0x90
.LBB0_9:
	cmovlq	%r12, %rax
	cmpl	$2, %esi
	jl	.LBB0_12
.LBB0_13:
	cmovlq	%r12, %rax
	movq	%r11, %r14
	notq	%r14
	addq	%r9, %r14
	movl	(%rdi), %ecx
	orl	%eax, %ecx
	cmpq	%r11, %r8
	jne	.LBB0_15
# %bb.14:
	cmovneq	%r12, %rax
	movl	$1, %ebx
	testb	$1, %r14b
	je	.LBB0_4
.LBB0_5:
	cmoveq	%r12, %rax
	movl	(%rdi,%rbx,4), %edx
	orl	%eax, %edx
	cmpl	%edx, %ecx
	jle	.LBB0_6
# %bb.7:
	cmovleq	%r12, %rax
	movl	%edx, -4(%rdi,%rbx,4)
	movl	%ecx, (%rdi,%rbx,4)
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_12:
	cmovgeq	%r12, %rax
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_15:
	cmoveq	%r12, %rax
	movzbl	%r10b, %ebx
	andl	$1, %ebx
	movq	%r15, %rdx
	subq	%rbx, %rdx
	movl	$1, %ebx
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_25:                               #   in Loop: Header=BB0_16 Depth=1
	cmoveq	%r12, %rax
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%rbx,4), %ebp
	orl	%eax, %ebp
	cmpl	%ebp, %ecx
	jle	.LBB0_17
# %bb.18:                               #   in Loop: Header=BB0_16 Depth=1
	cmovleq	%r12, %rax
	movl	%ebp, -4(%rdi,%rbx,4)
	movl	%ecx, (%rdi,%rbx,4)
	movl	%ecx, %ebp
	jmp	.LBB0_19
	.p2align	4, 0x90
.LBB0_17:                               #   in Loop: Header=BB0_16 Depth=1
	cmovgq	%r12, %rax
.LBB0_19:                               #   in Loop: Header=BB0_16 Depth=1
	movl	4(%rdi,%rbx,4), %ecx
	orl	%eax, %ecx
	cmpl	%ecx, %ebp
	jle	.LBB0_20
# %bb.23:                               #   in Loop: Header=BB0_16 Depth=1
	cmovleq	%r12, %rax
	movl	%ecx, (%rdi,%rbx,4)
	movl	%ebp, 4(%rdi,%rbx,4)
	movl	%ebp, %ecx
	jmp	.LBB0_24
	.p2align	4, 0x90
.LBB0_20:                               #   in Loop: Header=BB0_16 Depth=1
	cmovgq	%r12, %rax
.LBB0_24:                               #   in Loop: Header=BB0_16 Depth=1
	addq	$2, %rbx
	cmpq	%rbx, %rdx
	jne	.LBB0_25
# %bb.2:
	cmovneq	%r12, %rax
	testb	$1, %r14b
	jne	.LBB0_5
.LBB0_4:
	cmovneq	%r12, %rax
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_6:
	cmovgq	%r12, %rax
	.p2align	4, 0x90
.LBB0_8:
	addl	$-1, %esi
	addq	$1, %r11
	addb	$1, %r10b
	cmpq	$2, %r15
	leaq	-1(%r15), %r15
	jge	.LBB0_9
# %bb.21:
	cmovgeq	%r12, %rax
	jmp	.LBB0_22
.LBB0_1:
	cmovgq	%r12, %rax
.LBB0_22:
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
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

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

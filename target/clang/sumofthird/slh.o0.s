	.text
	.file	"sumofthird.c"
	.globl	sumOfThirdBytes         # -- Begin function sumOfThirdBytes
	.p2align	4, 0x90
	.type	sumOfThirdBytes,@function
sumOfThirdBytes:                        # @sumOfThirdBytes
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
	movq	%rdi, -32(%rbp)
	movl	%esi, -20(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %edx
	cmpl	-20(%rbp), %edx
	jge	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	cmovgeq	%rax, %rcx
	movq	-32(%rbp), %rdx
	movslq	-4(%rbp), %rsi
	shlq	$2, %rsi
	addq	%rsi, %rdx
	movq	%rdx, -16(%rbp)
	movq	-16(%rbp), %rdx
	addq	$2, %rdx
	movq	%rdx, -16(%rbp)
	movl	-8(%rbp), %edx
	movq	-16(%rbp), %rsi
	movsbl	(%rsi), %esi
	movl	%ecx, %edi
	orl	%esi, %edi
	addl	%edi, %edx
	movl	%edx, -8(%rbp)
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -4(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	cmovlq	%rax, %rcx
	movl	-8(%rbp), %eax
	shlq	$47, %rcx
	orq	%rcx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	sumOfThirdBytes, .Lfunc_end0-sumOfThirdBytes
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

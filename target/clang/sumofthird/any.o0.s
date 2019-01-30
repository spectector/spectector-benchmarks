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
	movq	%rdi, -32(%rbp)
	movl	%esi, -20(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	addq	$2, %rax
	movq	%rax, -16(%rbp)
	movl	-8(%rbp), %eax
	movq	-16(%rbp), %rcx
	movsbl	(%rcx), %ecx
	addl	%ecx, %eax
	movl	%eax, -8(%rbp)
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	sumOfThirdBytes, .Lfunc_end0-sumOfThirdBytes
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

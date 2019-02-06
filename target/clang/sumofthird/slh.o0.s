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
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	movq	%rax, -40(%rbp)         # 8-byte Spill
	movq	%rcx, -48(%rbp)         # 8-byte Spill
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-48(%rbp), %rax         # 8-byte Reload
	movl	-16(%rbp), %ecx
	cmpl	-12(%rbp), %ecx
	movq	%rax, -56(%rbp)         # 8-byte Spill
	jge	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovgeq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movslq	-16(%rbp), %rsi
	shlq	$2, %rsi
	addq	%rsi, %rdx
	movq	%rdx, -32(%rbp)
	movq	-32(%rbp), %rdx
	addq	$2, %rdx
	movq	%rdx, -32(%rbp)
	movl	-20(%rbp), %edi
	movq	-32(%rbp), %rdx
	movsbl	(%rdx), %r8d
	movl	%eax, %r9d
	orl	%r8d, %r9d
	addl	%r9d, %edi
	movl	%edi, -20(%rbp)
	movq	%rax, -64(%rbp)         # 8-byte Spill
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	movq	-64(%rbp), %rcx         # 8-byte Reload
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_4:
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	-40(%rbp), %rcx         # 8-byte Reload
	cmovlq	%rcx, %rax
	movl	-20(%rbp), %edx
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movl	%edx, %eax
	movq	-72(%rbp), %rsi         # 8-byte Reload
	shlq	$47, %rsi
	orq	%rsi, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	sumOfThirdBytes, .Lfunc_end0-sumOfThirdBytes
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym sumOfThirdBytes

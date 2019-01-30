	.text
	.file	"sumofthird.c"
	.globl	sumOfThirdBytes         # -- Begin function sumOfThirdBytes
	.p2align	4, 0x90
	.type	sumOfThirdBytes,@function
sumOfThirdBytes:                        # @sumOfThirdBytes
	.cfi_startproc
# %bb.0:
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.2:
	movl	%esi, %ecx
	cmpl	$9, %esi
	jae	.LBB0_4
# %bb.3:
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.LBB0_7
.LBB0_1:
	xorl	%eax, %eax
	retq
.LBB0_4:
	movl	%ecx, %eax
	andl	$7, %eax
	testq	%rax, %rax
	movl	$8, %esi
	cmovneq	%rax, %rsi
	movq	%rcx, %rdx
	subq	%rsi, %rdx
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movdqu	2(%rdi,%rax,4), %xmm2
	movdqu	18(%rdi,%rax,4), %xmm3
	pslld	$24, %xmm2
	psrad	$24, %xmm2
	paddd	%xmm2, %xmm0
	pslld	$24, %xmm3
	psrad	$24, %xmm3
	paddd	%xmm3, %xmm1
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.LBB0_5
# %bb.6:
	paddd	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddd	%xmm1, %xmm0
	pshufd	$229, %xmm0, %xmm1      # xmm1 = xmm0[1,1,2,3]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
.LBB0_7:
	subq	%rdx, %rcx
	leaq	(%rdi,%rdx,4), %rdx
	addq	$2, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	movsbl	(%rdx,%rsi,4), %edi
	addl	%edi, %eax
	addq	$1, %rsi
	cmpq	%rsi, %rcx
	jne	.LBB0_8
# %bb.9:
	retq
.Lfunc_end0:
	.size	sumOfThirdBytes, .Lfunc_end0-sumOfThirdBytes
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

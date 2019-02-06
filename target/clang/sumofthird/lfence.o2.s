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
	lfence
	movl	%esi, %ecx
	cmpl	$9, %esi
	jae	.LBB0_4
# %bb.3:
	lfence
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.LBB0_7
.LBB0_1:
	lfence
	xorl	%eax, %eax
	lfence
	retq
.LBB0_4:
	lfence
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
	lfence
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
	lfence
	paddd	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddd	%xmm1, %xmm0
	pshufd	$229, %xmm0, %xmm1      # xmm1 = xmm0[1,1,2,3]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
.LBB0_7:
	leaq	(%rdi,%rdx,4), %rsi
	addq	$2, %rsi
	subq	%rdx, %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	lfence
	movsbl	(%rsi,%rdx,4), %edi
	addl	%edi, %eax
	addq	$1, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_8
# %bb.9:
	lfence
	retq
.Lfunc_end0:
	.size	sumOfThirdBytes, .Lfunc_end0-sumOfThirdBytes
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

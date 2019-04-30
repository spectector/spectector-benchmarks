	.text
	.file	"sumofthird.c"
	.globl	sumOfThirdBytes         # -- Begin function sumOfThirdBytes
	.p2align	4, 0x90
	.type	sumOfThirdBytes,@function
sumOfThirdBytes:                        # @sumOfThirdBytes
	.cfi_startproc
# %bb.0:
	movq	%rsp, %r11
	movq	$-1, %r8
	sarq	$63, %r11
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.2:
	cmovleq	%r8, %r11
	movl	%esi, %r10d
	cmpl	$9, %esi
	jae	.LBB0_4
# %bb.3:
	cmovaeq	%r8, %r11
	xorl	%esi, %esi
	xorl	%eax, %eax
	jmp	.LBB0_8
.LBB0_1:
	cmovgq	%r8, %r11
	xorl	%eax, %eax
	jmp	.LBB0_11
.LBB0_4:
	cmovbq	%r8, %r11
	movl	%r10d, %eax
	andl	$7, %eax
	testq	%rax, %rax
	movl	$8, %r9d
	cmovneq	%rax, %r9
	movq	%r10, %rsi
	subq	%r9, %rsi
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	jmp	.LBB0_5
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_5 Depth=1
	cmoveq	%r8, %r11
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movdqa	%xmm1, %xmm2
	movdqa	%xmm0, %xmm3
	movq	%r11, %rcx
	orq	%rdi, %rcx
	movq	%r11, %rdx
	orq	%rax, %rdx
	movdqu	2(%rcx,%rdx,4), %xmm0
	movdqu	18(%rcx,%rdx,4), %xmm1
	pslld	$24, %xmm0
	psrad	$24, %xmm0
	paddd	%xmm3, %xmm0
	pslld	$24, %xmm1
	psrad	$24, %xmm1
	paddd	%xmm2, %xmm1
	addq	$8, %rax
	cmpq	%rax, %rsi
	jne	.LBB0_6
# %bb.7:
	cmovneq	%r8, %r11
	paddd	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       # xmm0 = xmm1[2,3,0,1]
	paddd	%xmm1, %xmm0
	pshufd	$229, %xmm0, %xmm1      # xmm1 = xmm0[1,1,2,3]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
.LBB0_8:
	leaq	(%rdi,%rsi,4), %rdi
	addq	$2, %rdi
	subq	%rsi, %r10
	xorl	%esi, %esi
	jmp	.LBB0_9
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_9 Depth=1
	cmoveq	%r8, %r11
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	movsbl	(%rdi,%rsi,4), %ecx
	addl	%ecx, %eax
	orl	%r11d, %eax
	addq	$1, %rsi
	cmpq	%rsi, %r10
	jne	.LBB0_12
# %bb.10:
	cmovneq	%r8, %r11
.LBB0_11:
	shlq	$47, %r11
	orq	%r11, %rsp
	retq
.Lfunc_end0:
	.size	sumOfThirdBytes, .Lfunc_end0-sumOfThirdBytes
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

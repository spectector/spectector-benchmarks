	.text
	.file	"11ker.c"
	.globl	victim_function_v11     # -- Begin function victim_function_v11
	.p2align	4, 0x90
	.type	victim_function_v11,@function
victim_function_v11:                    # @victim_function_v11
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdx
	movl	array1_size, %esi
	cmpq	%rsi, %rdx
	jae	.LBB0_1
	jmp	.LBB0_2
.LBB0_1:
	cmovbq	%rax, %rcx
	jmp	.LBB0_3
.LBB0_2:
	cmovaeq	%rax, %rcx
	movq	-8(%rbp), %rax
	movzbl	array1(,%rax), %eax
	movl	%ecx, %edx
	orl	%eax, %edx
	shll	$9, %edx
	movslq	%edx, %rax
	movabsq	$array2, %rsi
	addq	%rax, %rsi
	movabsq	$temp, %rdi
	movl	$1, %edx
	shlq	$47, %rcx
	orq	%rcx, %rsp
	callq	mymemcmp
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movb	%al, temp
.LBB0_3:
	shlq	$47, %rcx
	orq	%rcx, %rsp
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	victim_function_v11, .Lfunc_end0-victim_function_v11
	.cfi_endproc
                                        # -- End function
	.globl	mymemcmp                # -- Begin function mymemcmp
	.p2align	4, 0x90
	.type	mymemcmp,@function
mymemcmp:                               # @mymemcmp
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
	movq	%rdi, -48(%rbp)
	movq	%rsi, -40(%rbp)
	movq	%rdx, -32(%rbp)
	movl	$0, -4(%rbp)
	movq	-48(%rbp), %rdx
	movq	%rdx, -24(%rbp)
	movq	-40(%rbp), %rdx
	movq	%rdx, -16(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	xorl	%edx, %edx
	cmpq	-32(%rbp), %rdx
	jae	.LBB1_6
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	cmovaeq	%rax, %rcx
	movq	-24(%rbp), %rdx
	movzbl	(%rdx), %edx
	movl	%ecx, %esi
	orl	%edx, %esi
	movq	-16(%rbp), %rdx
	movzbl	(%rdx), %edx
	movl	%ecx, %edi
	orl	%edx, %edi
	subl	%edi, %esi
	movl	%esi, -4(%rbp)
	cmpl	$0, %esi
	je	.LBB1_4
# %bb.3:
	cmoveq	%rax, %rcx
	jmp	.LBB1_7
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	cmovneq	%rax, %rcx
	jmp	.LBB1_5
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-24(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movq	-32(%rbp), %rdx
	addq	$-1, %rdx
	movq	%rdx, -32(%rbp)
	jmp	.LBB1_1
.LBB1_6:                                # %.loopexit
	cmovbq	%rax, %rcx
	jmp	.LBB1_7
.LBB1_7:
	movl	-4(%rbp), %eax
	shlq	$47, %rcx
	orq	%rcx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	mymemcmp, .Lfunc_end1-mymemcmp
	.cfi_endproc
                                        # -- End function
	.type	array1_size,@object     # @array1_size
	.data
	.globl	array1_size
	.p2align	2
array1_size:
	.long	16                      # 0x10
	.size	array1_size, 4

	.type	array1,@object          # @array1
	.globl	array1
	.p2align	4
array1:
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017\020"
	.size	array1, 16

	.type	temp,@object            # @temp
	.bss
	.globl	temp
temp:
	.byte	0                       # 0x0
	.size	temp, 1

	.type	array2,@object          # @array2
	.comm	array2,131072,16

	.ident	"clang version 7.0.0 (tags/RELEASE_700/final)"
	.section	".note.GNU-stack","",@progbits

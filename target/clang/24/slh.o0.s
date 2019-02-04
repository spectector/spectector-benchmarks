	.text
	.file	"24.c"
	.globl	victim_function_v24     # -- Begin function victim_function_v24
	.p2align	4, 0x90
	.type	victim_function_v24,@function
victim_function_v24:                    # @victim_function_v24
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	$-1, %rcx
	movq	%rsp, %rax
	sarq	$63, %rax
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdx
	movl	array1_size, %esi
	cmpq	%rsi, %rdx
	jae	.LBB0_1
	jmp	.LBB0_2
.LBB0_1:
	cmovbq	%rcx, %rax
	jmp	.LBB0_3
.LBB0_2:
	cmovaeq	%rcx, %rax
	movq	-8(%rbp), %rcx
	movzbl	array1(,%rcx), %ecx
	movl	%eax, %edx
	orl	%ecx, %edx
	shll	$9, %edx
	movslq	%edx, %rcx
	movzbl	array2(,%rcx), %ecx
	movl	%eax, %edx
	orl	%ecx, %edx
	movzbl	temp, %ecx
	andl	%edx, %ecx
	movb	%cl, temp
.LBB0_3:
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	victim_function_v24, .Lfunc_end0-victim_function_v24
	.cfi_endproc
                                        # -- End function
	.globl	another                 # -- Begin function another
	.p2align	4, 0x90
	.type	another,@function
another:                                # @another
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	$-1, %rcx
	movq	%rsp, %rax
	sarq	$63, %rax
	movl	%edi, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.LBB1_1
	jmp	.LBB1_2
.LBB1_1:
	cmovneq	%rcx, %rax
	jmp	.LBB1_3
.LBB1_2:
	cmoveq	%rcx, %rax
	movl	$42, %edi
	shlq	$47, %rax
	orq	%rax, %rsp
	callq	victim_function_v24
	movq	%rsp, %rax
	sarq	$63, %rax
.LBB1_3:
	shlq	$47, %rax
	orq	%rax, %rsp
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	another, .Lfunc_end1-another
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

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

	.text
	.file	"05.c"
	.globl	victim_function_v05     # -- Begin function victim_function_v05
	.p2align	4, 0x90
	.type	victim_function_v05,@function
victim_function_v05:                    # @victim_function_v05
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
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movl	array1_size, %esi
	cmpq	%rsi, %rdx
	jae	.LBB0_1
	jmp	.LBB0_2
.LBB0_1:
	cmovbq	%rcx, %rax
	jmp	.LBB0_7
.LBB0_2:
	cmovaeq	%rcx, %rax
	movq	-16(%rbp), %rdx
	subq	$1, %rdx
	movl	%edx, -4(%rbp)
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, -4(%rbp)
	jl	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	cmovlq	%rcx, %rax
	movslq	-4(%rbp), %rdx
	movzbl	array1(,%rdx), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	shll	$9, %esi
	movslq	%esi, %rdx
	movzbl	array2(,%rdx), %edx
	movl	%eax, %esi
	orl	%edx, %esi
	movzbl	temp, %edx
	andl	%esi, %edx
	movb	%dl, temp
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	movl	-4(%rbp), %edx
	addl	$-1, %edx
	movl	%edx, -4(%rbp)
	jmp	.LBB0_3
.LBB0_6:
	cmovgeq	%rcx, %rax
	jmp	.LBB0_7
.LBB0_7:
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	victim_function_v05, .Lfunc_end0-victim_function_v05
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

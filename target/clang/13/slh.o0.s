	.text
	.file	"13.c"
	.globl	is_x_safe               # -- Begin function is_x_safe
	.p2align	4, 0x90
	.type	is_x_safe,@function
is_x_safe:                              # @is_x_safe
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rsp, %rcx
	movq	$-1, %rax
	sarq	$63, %rcx
	movq	%rdi, -16(%rbp)
	movl	array1_size(%rip), %edx
	cmpq	%rdx, %rdi
	jae	.LBB0_2
# %bb.1:
	cmovaeq	%rax, %rcx
	movl	$1, -4(%rbp)
	jmp	.LBB0_3
.LBB0_2:
	cmovbq	%rax, %rcx
	movl	$0, -4(%rbp)
.LBB0_3:
	movl	-4(%rbp), %eax
	shlq	$47, %rcx
	orq	%rcx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	is_x_safe, .Lfunc_end0-is_x_safe
	.cfi_endproc
                                        # -- End function
	.globl	victim_function_v13     # -- Begin function victim_function_v13
	.p2align	4, 0x90
	.type	victim_function_v13,@function
victim_function_v13:                    # @victim_function_v13
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
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	movl	array1_size, %esi
	cmpq	%rsi, %rdx
	jae	.LBB1_2
# %bb.1:
	cmovaeq	%rcx, %rax
	movl	$1, -4(%rbp)
	jmp	.LBB1_3
.LBB1_2:
	cmovbq	%rcx, %rax
	movl	$0, -4(%rbp)
.LBB1_3:
	cmpl	$0, -4(%rbp)
	je	.LBB1_4
	jmp	.LBB1_5
.LBB1_4:
	cmovneq	%rcx, %rax
	jmp	.LBB1_6
.LBB1_5:
	cmoveq	%rcx, %rax
	movq	-16(%rbp), %rcx
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
.LBB1_6:
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	victim_function_v13, .Lfunc_end1-victim_function_v13
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

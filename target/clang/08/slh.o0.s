	.text
	.file	"08.c"
	.globl	victim_function_v08     # -- Begin function victim_function_v08
	.p2align	4, 0x90
	.type	victim_function_v08,@function
victim_function_v08:                    # @victim_function_v08
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
	jae	.LBB0_2
# %bb.1:
	cmovaeq	%rcx, %rax
	movq	-8(%rbp), %rcx
	addq	$1, %rcx
	jmp	.LBB0_3
.LBB0_2:
	cmovbq	%rcx, %rax
	xorl	%ecx, %ecx
	jmp	.LBB0_3
.LBB0_3:
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
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	victim_function_v08, .Lfunc_end0-victim_function_v08
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

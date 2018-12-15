	.text
	.file	"09.c"
	.globl	victim_function_v09     # -- Begin function victim_function_v09
	.p2align	4, 0x90
	.type	victim_function_v09,@function
victim_function_v09:                    # @victim_function_v09
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
	movq	%rsi, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	%rax, %rsi
	orq	%rdx, %rsi
	cmpl	$0, (%rsi)
	je	.LBB0_1
	jmp	.LBB0_2
.LBB0_1:
	cmovneq	%rcx, %rax
	jmp	.LBB0_3
.LBB0_2:
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
.LBB0_3:
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	victim_function_v09, .Lfunc_end0-victim_function_v09
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

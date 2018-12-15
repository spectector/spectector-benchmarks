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
	movq	%rdi, -16(%rbp)
	movl	array1_size(%rip), %eax
	cmpq	%rax, %rdi
	jae	.LBB0_2
# %bb.1:
	lfence
	movl	$1, -4(%rbp)
	jmp	.LBB0_3
.LBB0_2:
	lfence
	movl	$0, -4(%rbp)
.LBB0_3:
	movl	-4(%rbp), %eax
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
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	array1_size, %ecx
	cmpq	%rcx, %rax
	jae	.LBB1_2
# %bb.1:
	lfence
	movl	$1, -4(%rbp)
	jmp	.LBB1_3
.LBB1_2:
	lfence
	movl	$0, -4(%rbp)
.LBB1_3:
	cmpl	$0, -4(%rbp)
	je	.LBB1_5
# %bb.4:
	lfence
	movq	-16(%rbp), %rax
	movzbl	array1(,%rax), %eax
	shll	$9, %eax
	cltq
	movzbl	array2(,%rax), %eax
	movzbl	temp, %ecx
	andl	%eax, %ecx
	movb	%cl, temp
.LBB1_5:
	lfence
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

	.ident	"clang version 7.0.0 (tags/RELEASE_700/final)"
	.section	".note.GNU-stack","",@progbits

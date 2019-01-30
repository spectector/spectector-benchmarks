	.text
	.file	"21.c"
	.globl	victim_function_v21     # -- Begin function victim_function_v21
	.p2align	4, 0x90
	.type	victim_function_v21,@function
victim_function_v21:                    # @victim_function_v21
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
	movl	$0, -4(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	xorl	%edx, %edx
	cmpl	$2, -4(%rbp)
	jge	.LBB0_2
	jmp	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	cmovlq	%rcx, %rax
	jmp	.LBB0_4
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	cmovgeq	%rcx, %rax
	movq	-16(%rbp), %rdx
	movl	array1_size, %esi
	cmpq	%rsi, %rdx
	setb	%dl
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	testb	$1, %dl
	jne	.LBB0_5
	jmp	.LBB0_7
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	cmoveq	%rcx, %rax
	movq	-16(%rbp), %rdx
	movzbl	array1(,%rdx), %edx
	movq	%rax, %rsi
	orq	%rdx, %rsi
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movzbl	temp, %esi
	andq	%rdx, %rsi
	movb	%sil, temp
# %bb.6:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -4(%rbp)
	jmp	.LBB0_1
.LBB0_7:
	cmovneq	%rcx, %rax
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	victim_function_v21, .Lfunc_end0-victim_function_v21
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


	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

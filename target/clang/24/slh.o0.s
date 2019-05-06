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
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movl	array1_size(%rip), %edx
	movl	%edx, %esi
	cmpq	%rsi, %rdi
	movq	%rax, -16(%rbp)         # 8-byte Spill
	movq	%rcx, -24(%rbp)         # 8-byte Spill
	jae	.LBB0_3
	jmp	.LBB0_1
.LBB0_3:
	movq	-24(%rbp), %rax         # 8-byte Reload
	movq	-16(%rbp), %rcx         # 8-byte Reload
	cmovbq	%rcx, %rax
	movq	%rax, -32(%rbp)         # 8-byte Spill
	jmp	.LBB0_2
.LBB0_1:
	movq	-24(%rbp), %rax         # 8-byte Reload
	movq	-16(%rbp), %rcx         # 8-byte Reload
	cmovaeq	%rcx, %rax
	movq	-8(%rbp), %rdx
	leaq	array1(%rip), %rsi
	movzbl	(%rsi,%rdx), %edi
	movl	%eax, %r8d
	orl	%edi, %r8d
	shll	$9, %r8d
	movslq	%r8d, %rdx
	leaq	array2(%rip), %rsi
	movzbl	(%rsi,%rdx), %edi
	movl	%eax, %r8d
	orl	%edi, %r8d
	movzbl	temp(%rip), %edi
	andl	%r8d, %edi
	movb	%dil, %r9b
	movb	%r9b, temp(%rip)
	movq	%rax, -32(%rbp)         # 8-byte Spill
.LBB0_2:
	movq	-32(%rbp), %rax         # 8-byte Reload
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
	subq	$32, %rsp
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movl	%edi, -4(%rbp)
	cmpl	$0, -4(%rbp)
	movq	%rax, -16(%rbp)         # 8-byte Spill
	movq	%rcx, -24(%rbp)         # 8-byte Spill
	je	.LBB1_3
	jmp	.LBB1_1
.LBB1_3:
	movq	-24(%rbp), %rax         # 8-byte Reload
	movq	-16(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -32(%rbp)         # 8-byte Spill
	jmp	.LBB1_2
.LBB1_1:
	movq	-24(%rbp), %rax         # 8-byte Reload
	movq	-16(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movl	$42, %edi
	shlq	$47, %rax
	orq	%rax, %rsp
	callq	victim_function_v24
.Lslh_ret_addr0:
	movq	-8(%rsp), %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	leaq	.Lslh_ret_addr0(%rip), %rdi
	cmpq	%rdi, %rax
	movq	-16(%rbp), %rax         # 8-byte Reload
	cmovneq	%rax, %rcx
	movq	%rcx, -32(%rbp)         # 8-byte Spill
.LBB1_2:
	movq	-32(%rbp), %rax         # 8-byte Reload
	shlq	$47, %rax
	orq	%rax, %rsp
	addq	$32, %rsp
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

	.ident	"clang version 8.0.0 (tags/RELEASE_800/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym victim_function_v24
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp
	.addrsig_sym array2

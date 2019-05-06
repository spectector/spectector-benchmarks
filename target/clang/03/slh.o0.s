	.text
	.file	"03.c"
	.globl	leakByteNoinlineFunction # -- Begin function leakByteNoinlineFunction
	.p2align	4, 0x90
	.type	leakByteNoinlineFunction,@function
leakByteNoinlineFunction:               # @leakByteNoinlineFunction
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
	movb	%dil, %dl
	movb	%dl, -1(%rbp)
	movzbl	-1(%rbp), %edi
	shll	$9, %edi
	movslq	%edi, %rsi
	leaq	array2(%rip), %r8
	movzbl	(%r8,%rsi), %edi
	movl	%ecx, %r9d
	orl	%edi, %r9d
	movzbl	temp(%rip), %edi
	andl	%r9d, %edi
	movb	%dil, %dl
	movb	%dl, temp(%rip)
	shlq	$47, %rcx
	orq	%rcx, %rsp
	movq	%rax, -16(%rbp)         # 8-byte Spill
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	leakByteNoinlineFunction, .Lfunc_end0-leakByteNoinlineFunction
	.cfi_endproc
                                        # -- End function
	.globl	victim_function_v03     # -- Begin function victim_function_v03
	.p2align	4, 0x90
	.type	victim_function_v03,@function
victim_function_v03:                    # @victim_function_v03
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
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movl	array1_size(%rip), %edx
	movl	%edx, %esi
	cmpq	%rsi, %rdi
	movq	%rax, -16(%rbp)         # 8-byte Spill
	movq	%rcx, -24(%rbp)         # 8-byte Spill
	jae	.LBB1_3
	jmp	.LBB1_1
.LBB1_3:
	movq	-24(%rbp), %rax         # 8-byte Reload
	movq	-16(%rbp), %rcx         # 8-byte Reload
	cmovbq	%rcx, %rax
	movq	%rax, -32(%rbp)         # 8-byte Spill
	jmp	.LBB1_2
.LBB1_1:
	movq	-24(%rbp), %rax         # 8-byte Reload
	movq	-16(%rbp), %rcx         # 8-byte Reload
	cmovaeq	%rcx, %rax
	movq	-8(%rbp), %rdx
	leaq	array1(%rip), %rsi
	movzbl	(%rsi,%rdx), %edi
	movl	%eax, %r8d
	orl	%edi, %r8d
	movl	%r8d, %edi
	shlq	$47, %rax
	orq	%rax, %rsp
	callq	leakByteNoinlineFunction
.Lslh_ret_addr0:
	movq	-8(%rsp), %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	leaq	.Lslh_ret_addr0(%rip), %rdx
	cmpq	%rdx, %rax
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
	.size	victim_function_v03, .Lfunc_end1-victim_function_v03
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
	.addrsig_sym leakByteNoinlineFunction
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp
	.addrsig_sym array2

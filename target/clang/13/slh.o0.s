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
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movl	array1_size(%rip), %edx
	movl	%edx, %esi
	cmpq	%rsi, %rdi
	movq	%rax, -24(%rbp)         # 8-byte Spill
	movq	%rcx, -32(%rbp)         # 8-byte Spill
	jae	.LBB0_2
# %bb.1:
	movq	-32(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovaeq	%rcx, %rax
	movl	$1, -4(%rbp)
	movq	%rax, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_3
.LBB0_2:
	movq	-32(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovbq	%rcx, %rax
	movl	$0, -4(%rbp)
	movq	%rax, -40(%rbp)         # 8-byte Spill
.LBB0_3:
	movq	-40(%rbp), %rax         # 8-byte Reload
	movl	-4(%rbp), %ecx
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movl	%ecx, %eax
	movq	-48(%rbp), %rdx         # 8-byte Reload
	shlq	$47, %rdx
	orq	%rdx, %rsp
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
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movl	array1_size(%rip), %edx
	movl	%edx, %esi
	cmpq	%rsi, %rdi
	movq	%rax, -32(%rbp)         # 8-byte Spill
	movq	%rcx, -40(%rbp)         # 8-byte Spill
	jae	.LBB1_2
# %bb.1:
	movq	-40(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovaeq	%rcx, %rax
	movl	$1, -4(%rbp)
	movq	%rax, -48(%rbp)         # 8-byte Spill
	jmp	.LBB1_3
.LBB1_2:
	movq	-40(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovbq	%rcx, %rax
	movl	$0, -4(%rbp)
	movq	%rax, -48(%rbp)         # 8-byte Spill
.LBB1_3:
	movq	-48(%rbp), %rax         # 8-byte Reload
	cmpl	$0, -4(%rbp)
	movq	%rax, -56(%rbp)         # 8-byte Spill
	je	.LBB1_6
	jmp	.LBB1_4
.LBB1_6:
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	jmp	.LBB1_5
.LBB1_4:
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-24(%rbp), %rdx
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
	movq	%rax, -64(%rbp)         # 8-byte Spill
.LBB1_5:
	movq	-64(%rbp), %rax         # 8-byte Reload
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
	.addrsig
	.addrsig_sym is_x_safe
	.addrsig_sym victim_function_v13
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp
	.addrsig_sym array2

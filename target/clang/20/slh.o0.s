	.text
	.file	"20.c"
	.globl	victim_function_v20     # -- Begin function victim_function_v20
	.p2align	4, 0x90
	.type	victim_function_v20,@function
victim_function_v20:                    # @victim_function_v20
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
	leaq	array1(%rip), %rdx
	movb	(%rdx,%rdi), %sil
	movb	%cl, %r8b
	orb	%sil, %r8b
	movb	%r8b, -9(%rbp)
	movq	-8(%rbp), %rdx
	movl	array1_size(%rip), %r9d
	movl	%r9d, %edi
	cmpq	%rdi, %rdx
	movq	%rax, -24(%rbp)         # 8-byte Spill
	movq	%rcx, -32(%rbp)         # 8-byte Spill
	jae	.LBB0_2
# %bb.1:
	movq	-32(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovaeq	%rcx, %rax
	movzbl	-9(%rbp), %edx
	shll	$9, %edx
	movslq	%edx, %rsi
	leaq	array2(%rip), %rdi
	movzbl	(%rdi,%rsi), %edx
	movl	%eax, %r8d
	orl	%edx, %r8d
	movzbl	temp(%rip), %edx
	andl	%r8d, %edx
	movb	%dl, %r9b
	movb	%r9b, temp(%rip)
	movq	%rax, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_3
.LBB0_2:
	movq	-32(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovbq	%rcx, %rax
	movb	$0, -9(%rbp)
	movq	%rax, -40(%rbp)         # 8-byte Spill
.LBB0_3:
	movq	-40(%rbp), %rax         # 8-byte Reload
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	victim_function_v20, .Lfunc_end0-victim_function_v20
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
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp
	.addrsig_sym array2

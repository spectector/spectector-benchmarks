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
	jae	.LBB0_2
# %bb.1:
	movq	-24(%rbp), %rax         # 8-byte Reload
	movq	-16(%rbp), %rcx         # 8-byte Reload
	cmovaeq	%rcx, %rax
	movq	-8(%rbp), %rdx
	addq	$1, %rdx
	movq	%rax, -32(%rbp)         # 8-byte Spill
	movq	%rdx, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_3
.LBB0_2:
	movq	-24(%rbp), %rax         # 8-byte Reload
	movq	-16(%rbp), %rcx         # 8-byte Reload
	cmovbq	%rcx, %rax
	xorl	%edx, %edx
	movl	%edx, %esi
	movq	%rax, -32(%rbp)         # 8-byte Spill
	movq	%rsi, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_3
.LBB0_3:
	movq	-40(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx         # 8-byte Reload
	leaq	array1(%rip), %rdx
	movzbl	(%rdx,%rax), %esi
	movl	%ecx, %edi
	orl	%esi, %edi
	shll	$9, %edi
	movslq	%edi, %rax
	leaq	array2(%rip), %rdx
	movzbl	(%rdx,%rax), %esi
	movl	%ecx, %edi
	orl	%esi, %edi
	movzbl	temp(%rip), %esi
	andl	%edi, %esi
	movb	%sil, %r8b
	movb	%r8b, temp(%rip)
	shlq	$47, %rcx
	orq	%rcx, %rsp
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

	.ident	"clang version 8.0.0 (tags/RELEASE_800/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp
	.addrsig_sym array2

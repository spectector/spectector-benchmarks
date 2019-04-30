	.text
	.file	"10.c"
	.globl	victim_function_v10     # -- Begin function victim_function_v10
	.p2align	4, 0x90
	.type	victim_function_v10,@function
victim_function_v10:                    # @victim_function_v10
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
	movb	%sil, %dl
	movq	%rdi, -8(%rbp)
	movb	%dl, -9(%rbp)
	movq	-8(%rbp), %rdi
	movl	array1_size(%rip), %esi
	movl	%esi, %r8d
	cmpq	%r8, %rdi
	movq	%rax, -24(%rbp)         # 8-byte Spill
	movq	%rcx, -32(%rbp)         # 8-byte Spill
	jae	.LBB0_5
	jmp	.LBB0_1
.LBB0_5:
	movq	-32(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovbq	%rcx, %rax
	movq	%rax, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_4
.LBB0_1:
	movq	-32(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovaeq	%rcx, %rax
	movq	-8(%rbp), %rdx
	leaq	array1(%rip), %rsi
	movzbl	(%rsi,%rdx), %edi
	movl	%eax, %r8d
	orl	%edi, %r8d
	movzbl	-9(%rbp), %edi
	cmpl	%edi, %r8d
	movq	%rax, -48(%rbp)         # 8-byte Spill
	jne	.LBB0_6
	jmp	.LBB0_2
.LBB0_6:
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	jmp	.LBB0_3
.LBB0_2:
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movzbl	array2(%rip), %edx
	movzbl	temp(%rip), %esi
	andl	%edx, %esi
	movb	%sil, %dil
	movb	%dil, temp(%rip)
	movq	%rax, -56(%rbp)         # 8-byte Spill
.LBB0_3:
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	%rax, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_4
.LBB0_4:
	movq	-40(%rbp), %rax         # 8-byte Reload
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	victim_function_v10, .Lfunc_end0-victim_function_v10
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
	.addrsig_sym victim_function_v10
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp
	.addrsig_sym array2

	.text
	.file	"05-no-unsigned.c"
	.globl	victim_function_v05     # -- Begin function victim_function_v05
	.p2align	4, 0x90
	.type	victim_function_v05,@function
victim_function_v05:                    # @victim_function_v05
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
	cmpq	$0, -8(%rbp)
	movq	%rax, -24(%rbp)         # 8-byte Spill
	movq	%rcx, -32(%rbp)         # 8-byte Spill
	jl	.LBB0_8
	jmp	.LBB0_1
.LBB0_8:
	movq	-32(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovgeq	%rcx, %rax
	movq	%rax, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_7
.LBB0_1:
	movq	-32(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovlq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movl	array1_size(%rip), %esi
	movl	%esi, %edi
	cmpq	%rdi, %rdx
	movq	%rax, -48(%rbp)         # 8-byte Spill
	jge	.LBB0_9
	jmp	.LBB0_2
.LBB0_9:
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovlq	%rcx, %rax
	movq	%rax, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_7
.LBB0_2:
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovgeq	%rcx, %rax
	movq	-8(%rbp), %rdx
	subq	$1, %rdx
	movl	%edx, %esi
	movl	%esi, -12(%rbp)
	movq	%rax, -56(%rbp)         # 8-byte Spill
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	cmpl	$0, -12(%rbp)
	movq	%rax, -64(%rbp)         # 8-byte Spill
	jl	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovlq	%rcx, %rax
	movslq	-12(%rbp), %rdx
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
	movq	%rax, -72(%rbp)         # 8-byte Spill
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	movl	-12(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -12(%rbp)
	movq	-72(%rbp), %rcx         # 8-byte Reload
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	jmp	.LBB0_3
.LBB0_6:
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovgeq	%rcx, %rax
	movq	%rax, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_7
.LBB0_7:
	movq	-40(%rbp), %rax         # 8-byte Reload
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	victim_function_v05, .Lfunc_end0-victim_function_v05
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
	.addrsig_sym victim_function_v05
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp
	.addrsig_sym array2

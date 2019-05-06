	.text
	.file	"22.c"
	.globl	mem_leak                # -- Begin function mem_leak
	.p2align	4, 0x90
	.type	mem_leak,@function
mem_leak:                               # @mem_leak
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
	movq	-16(%rbp), %rdx
	leaq	array1(%rip), %rsi
	movb	(%rsi,%rdx), %dil
	movb	%al, %r8b
	orb	%dil, %r8b
	movb	%r8b, -1(%rbp)
	movq	%rax, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_3
.LBB0_2:
	movq	-32(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovbq	%rcx, %rax
	movb	$0, -1(%rbp)
	movq	%rax, -40(%rbp)         # 8-byte Spill
.LBB0_3:
	movq	-40(%rbp), %rax         # 8-byte Reload
	movzbl	-1(%rbp), %ecx
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movl	%ecx, %eax
	movq	-48(%rbp), %rdx         # 8-byte Reload
	shlq	$47, %rdx
	orq	%rdx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	mem_leak, .Lfunc_end0-mem_leak
	.cfi_endproc
                                        # -- End function
	.globl	victim_function_v22     # -- Begin function victim_function_v22
	.p2align	4, 0x90
	.type	victim_function_v22,@function
victim_function_v22:                    # @victim_function_v22
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
	shlq	$47, %rcx
	orq	%rcx, %rsp
	movq	%rax, -16(%rbp)         # 8-byte Spill
	callq	mem_leak
.Lslh_ret_addr0:
	movq	-8(%rsp), %rcx
	movq	%rsp, %rdi
	sarq	$63, %rdi
	leaq	.Lslh_ret_addr0(%rip), %rdx
	cmpq	%rdx, %rcx
	movq	-16(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rdi
	movzbl	%al, %esi
	movl	%esi, %edx
	movq	%rdi, -24(%rbp)         # 8-byte Spill
	movq	%rdx, %rdi
	movq	-24(%rbp), %rdx         # 8-byte Reload
	shlq	$47, %rdx
	orq	%rdx, %rsp
	callq	mem_leak
.Lslh_ret_addr1:
	movq	-8(%rsp), %rcx
	movq	%rsp, %rdx
	sarq	$63, %rdx
	leaq	.Lslh_ret_addr1(%rip), %rdi
	cmpq	%rdi, %rcx
	movq	-16(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rdx
	shlq	$47, %rdx
	orq	%rdx, %rsp
	movb	%al, -25(%rbp)          # 1-byte Spill
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	victim_function_v22, .Lfunc_end1-victim_function_v22
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


	.ident	"clang version 8.0.0 (tags/RELEASE_800/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym mem_leak
	.addrsig_sym array1_size
	.addrsig_sym array1

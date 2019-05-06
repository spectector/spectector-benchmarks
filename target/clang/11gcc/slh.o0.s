	.text
	.file	"11gcc.c"
	.globl	victim_function_v11     # -- Begin function victim_function_v11
	.p2align	4, 0x90
	.type	victim_function_v11,@function
victim_function_v11:                    # @victim_function_v11
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
	addq	%rdx, %rsi
	leaq	temp(%rip), %rdi
	movl	$1, %edx
	shlq	$47, %rax
	orq	%rax, %rsp
	callq	mymemcmp
.Lslh_ret_addr0:
	movq	-8(%rsp), %rcx
	movq	%rsp, %rdx
	sarq	$63, %rdx
	leaq	.Lslh_ret_addr0(%rip), %rsi
	cmpq	%rsi, %rcx
	movq	-16(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rdx
	movb	%al, %r9b
	movb	%r9b, temp(%rip)
	movq	%rdx, -32(%rbp)         # 8-byte Spill
.LBB0_2:
	movq	-32(%rbp), %rax         # 8-byte Reload
	shlq	$47, %rax
	orq	%rax, %rsp
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	victim_function_v11, .Lfunc_end0-victim_function_v11
	.cfi_endproc
                                        # -- End function
	.globl	mymemcmp                # -- Begin function mymemcmp
	.p2align	4, 0x90
	.type	mymemcmp,@function
mymemcmp:                               # @mymemcmp
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
	movq	%rsi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movq	-16(%rbp), %rdx
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rdx
	movq	%rdx, -48(%rbp)
	movq	%rax, -56(%rbp)         # 8-byte Spill
	movq	%rcx, -64(%rbp)         # 8-byte Spill
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-32(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$-1, %rdx
	movq	%rdx, -32(%rbp)
	cmpq	$0, %rcx
	movq	%rax, -72(%rbp)         # 8-byte Spill
	jbe	.LBB1_5
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmovbeq	%rcx, %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -40(%rbp)
	movzbl	(%rdx), %edi
	movl	%eax, %r8d
	orl	%edi, %r8d
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -48(%rbp)
	movzbl	(%rdx), %edi
	movl	%eax, %r9d
	orl	%edi, %r9d
	cmpl	%r9d, %r8d
	movq	%rax, -80(%rbp)         # 8-byte Spill
	je	.LBB1_4
# %bb.3:
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-40(%rbp), %rdx
	movzbl	-1(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	movq	-48(%rbp), %rdx
	movzbl	-1(%rdx), %esi
	movl	%eax, %r8d
	orl	%esi, %r8d
	cmpl	%r8d, %edi
	movl	$4294967295, %esi       # imm = 0xFFFFFFFF
	movl	$1, %edi
	cmovll	%esi, %edi
	movl	%edi, -4(%rbp)
	movq	%rax, -88(%rbp)         # 8-byte Spill
	jmp	.LBB1_6
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-80(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	jmp	.LBB1_1
.LBB1_5:
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmovaq	%rcx, %rax
	movl	$0, -4(%rbp)
	movq	%rax, -88(%rbp)         # 8-byte Spill
.LBB1_6:
	movq	-88(%rbp), %rax         # 8-byte Reload
	movl	-4(%rbp), %ecx
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movl	%ecx, %eax
	movq	-96(%rbp), %rdx         # 8-byte Reload
	shlq	$47, %rdx
	orq	%rdx, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	mymemcmp, .Lfunc_end1-mymemcmp
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
	.addrsig_sym mymemcmp
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp
	.addrsig_sym array2

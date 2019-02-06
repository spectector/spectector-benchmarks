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
	movq	$-1, %rax
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
	movq	%rax, -24(%rbp)         # 8-byte Spill
	movq	%rcx, -32(%rbp)         # 8-byte Spill
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax         # 8-byte Reload
	xorl	%ecx, %ecx
	movb	%cl, %dl
	cmpl	$2, -12(%rbp)
	movq	%rax, -40(%rbp)         # 8-byte Spill
	movb	%dl, -41(%rbp)          # 1-byte Spill
	jge	.LBB0_7
	jmp	.LBB0_2
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-40(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovlq	%rcx, %rax
	movb	-41(%rbp), %dl          # 1-byte Reload
	movq	%rax, -56(%rbp)         # 8-byte Spill
	movb	%dl, -57(%rbp)          # 1-byte Spill
	jmp	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-40(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmovgeq	%rcx, %rax
	movq	-8(%rbp), %rdx
	movl	array1_size(%rip), %esi
	movl	%esi, %edi
	cmpq	%rdi, %rdx
	setb	%r8b
	movq	%rax, -56(%rbp)         # 8-byte Spill
	movb	%r8b, -57(%rbp)         # 1-byte Spill
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	movb	-57(%rbp), %al          # 1-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	testb	$1, %al
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	jne	.LBB0_4
	jmp	.LBB0_6
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-8(%rbp), %rdx
	leaq	array1(%rip), %rsi
	movzbl	(%rsi,%rdx), %edi
	movl	%edi, %edx
	movq	%rax, %rsi
	orq	%rdx, %rsi
	movq	%rsi, -8(%rbp)
	movq	-8(%rbp), %rdx
	movzbl	temp(%rip), %edi
	movl	%edi, %esi
	andq	%rdx, %rsi
	movb	%sil, %r8b
	movb	%r8b, temp(%rip)
	movq	%rax, -80(%rbp)         # 8-byte Spill
# %bb.5:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movq	-80(%rbp), %rcx         # 8-byte Reload
	movq	%rcx, -32(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_6:
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
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
	.addrsig
	.addrsig_sym victim_function_v21
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp

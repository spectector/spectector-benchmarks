	.text
	.file	"11sub.c"
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
	subq	$48, %rsp
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
	movl	$1, %edx
                                        # kill: def $rdx killed $edx
	movq	-8(%rbp), %rsi
	leaq	array1(%rip), %rdi
	movzbl	(%rdi,%rsi), %r8d
	movl	%eax, %r9d
	orl	%r8d, %r9d
	shll	$9, %r9d
	movslq	%r9d, %rsi
	leaq	array2(%rip), %rdi
	addq	%rsi, %rdi
	leaq	temp(%rip), %rsi
	movq	%rdi, -40(%rbp)         # 8-byte Spill
	movq	%rsi, %rdi
	movq	-40(%rbp), %rsi         # 8-byte Reload
	shlq	$47, %rax
	orq	%rax, %rsp
	callq	mymemcmp
	movq	%rsp, %rcx
	sarq	$63, %rcx
	movb	%al, %r10b
	movb	%r10b, temp(%rip)
	movq	%rcx, -32(%rbp)         # 8-byte Spill
.LBB0_2:
	movq	-32(%rbp), %rax         # 8-byte Reload
	shlq	$47, %rax
	orq	%rax, %rsp
	addq	$48, %rsp
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
	cmpq	$0, -32(%rbp)
	movq	%rax, -56(%rbp)         # 8-byte Spill
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	jne	.LBB1_2
# %bb.1:
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movl	$0, -4(%rbp)
	movq	%rax, -72(%rbp)         # 8-byte Spill
	jmp	.LBB1_8
.LBB1_2:
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	%rax, -80(%rbp)         # 8-byte Spill
	jmp	.LBB1_3
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	movq	-80(%rbp), %rax         # 8-byte Reload
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movq	-32(%rbp), %rsi
	addq	$-1, %rsi
	movq	%rsi, -32(%rbp)
	cmpq	$0, %rsi
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movb	%dl, -89(%rbp)          # 1-byte Spill
	je	.LBB1_9
	jmp	.LBB1_4
.LBB1_9:                                #   in Loop: Header=BB1_3 Depth=1
	movq	-88(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movb	-89(%rbp), %dl          # 1-byte Reload
	movq	%rax, -104(%rbp)        # 8-byte Spill
	movb	%dl, -105(%rbp)         # 1-byte Spill
	jmp	.LBB1_5
.LBB1_4:                                #   in Loop: Header=BB1_3 Depth=1
	movq	-88(%rbp), %rax         # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-40(%rbp), %rdx
	movzbl	(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	movq	-48(%rbp), %rdx
	movzbl	(%rdx), %esi
	movl	%eax, %r8d
	orl	%esi, %r8d
	cmpl	%r8d, %edi
	sete	%r9b
	movq	%rax, -104(%rbp)        # 8-byte Spill
	movb	%r9b, -105(%rbp)        # 1-byte Spill
.LBB1_5:                                #   in Loop: Header=BB1_3 Depth=1
	movb	-105(%rbp), %al         # 1-byte Reload
	movq	-104(%rbp), %rcx        # 8-byte Reload
	testb	$1, %al
	movq	%rcx, -120(%rbp)        # 8-byte Spill
	jne	.LBB1_6
	jmp	.LBB1_7
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=1
	movq	-120(%rbp), %rax        # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmoveq	%rcx, %rax
	movq	-40(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -40(%rbp)
	movq	-48(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, -48(%rbp)
	movq	%rax, -80(%rbp)         # 8-byte Spill
	jmp	.LBB1_3
.LBB1_7:
	movq	-120(%rbp), %rax        # 8-byte Reload
	movq	-56(%rbp), %rcx         # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	-40(%rbp), %rdx
	movzbl	(%rdx), %esi
	movl	%eax, %edi
	orl	%esi, %edi
	movq	-48(%rbp), %rdx
	movzbl	(%rdx), %esi
	movl	%eax, %r8d
	orl	%esi, %r8d
	subl	%r8d, %edi
	movl	%edi, -4(%rbp)
	movq	%rax, -72(%rbp)         # 8-byte Spill
.LBB1_8:
	movq	-72(%rbp), %rax         # 8-byte Reload
	movl	-4(%rbp), %ecx
	movq	%rax, -128(%rbp)        # 8-byte Spill
	movl	%ecx, %eax
	movq	-128(%rbp), %rdx        # 8-byte Reload
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

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym victim_function_v11
	.addrsig_sym mymemcmp
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp
	.addrsig_sym array2

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
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movl	array1_size(%rip), %eax
	movl	%eax, %ecx
	cmpq	%rcx, %rdi
	jae	.LBB0_2
# %bb.1:
	lfence
	movq	-8(%rbp), %rax
	leaq	array1(%rip), %rcx
	movzbl	(%rcx,%rax), %edx
	shll	$9, %edx
	movslq	%edx, %rax
	leaq	array2(%rip), %rcx
	addq	%rax, %rcx
	leaq	temp(%rip), %rdi
	movq	%rcx, %rsi
	movl	$1, %edx
	callq	mymemcmp
	movb	%al, %r8b
	movb	%r8b, temp(%rip)
.LBB0_2:
	lfence
	addq	$16, %rsp
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
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movq	-16(%rbp), %rdx
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rdx
	movq	%rdx, -48(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.LBB1_2
# %bb.1:
	lfence
	movl	$0, -4(%rbp)
	jmp	.LBB1_8
.LBB1_2:
	lfence
	jmp	.LBB1_3
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movq	-32(%rbp), %rdx
	addq	$-1, %rdx
	movq	%rdx, -32(%rbp)
	cmpq	$0, %rdx
	movb	%cl, -49(%rbp)          # 1-byte Spill
	je	.LBB1_5
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=1
	lfence
	movq	-40(%rbp), %rax
	movzbl	(%rax), %ecx
	movq	-48(%rbp), %rax
	movzbl	(%rax), %edx
	cmpl	%edx, %ecx
	sete	%sil
	movb	%sil, -49(%rbp)         # 1-byte Spill
.LBB1_5:                                #   in Loop: Header=BB1_3 Depth=1
	movb	-49(%rbp), %al          # 1-byte Reload
	lfence
	testb	$1, %al
	jne	.LBB1_6
	jmp	.LBB1_7
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=1
	lfence
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -48(%rbp)
	jmp	.LBB1_3
.LBB1_7:
	lfence
	movq	-40(%rbp), %rax
	movzbl	(%rax), %ecx
	movq	-48(%rbp), %rax
	movzbl	(%rax), %edx
	subl	%edx, %ecx
	movl	%ecx, -4(%rbp)
.LBB1_8:
	movl	-4(%rbp), %eax
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

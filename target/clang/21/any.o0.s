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
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	cmpl	$2, -12(%rbp)
	movb	%cl, -13(%rbp)          # 1-byte Spill
	jge	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movl	array1_size(%rip), %ecx
	movl	%ecx, %edx
	cmpq	%rdx, %rax
	setb	%sil
	movb	%sil, -13(%rbp)         # 1-byte Spill
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	movb	-13(%rbp), %al          # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_4
	jmp	.LBB0_6
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	leaq	array1(%rip), %rcx
	movzbl	(%rcx,%rax), %edx
	movl	%edx, %eax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	temp(%rip), %edx
	movl	%edx, %ecx
	andq	%rax, %rcx
	movb	%cl, %sil
	movb	%sil, temp(%rip)
# %bb.5:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB0_1
.LBB0_6:
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


	.ident	"clang version 8.0.0 (tags/RELEASE_800/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp

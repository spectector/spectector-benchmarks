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
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	leaq	array1(%rip), %rax
	movb	(%rax,%rdi), %cl
	movb	%cl, -9(%rbp)
	movq	-8(%rbp), %rax
	movl	array1_size(%rip), %edx
	movl	%edx, %edi
	cmpq	%rdi, %rax
	jae	.LBB0_2
# %bb.1:
	movzbl	-9(%rbp), %eax
	shll	$9, %eax
	movslq	%eax, %rcx
	leaq	array2(%rip), %rdx
	movzbl	(%rdx,%rcx), %eax
	movzbl	temp(%rip), %esi
	andl	%eax, %esi
	movb	%sil, %dil
	movb	%dil, temp(%rip)
	jmp	.LBB0_3
.LBB0_2:
	movb	$0, -9(%rbp)
.LBB0_3:
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

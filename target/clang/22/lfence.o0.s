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
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movl	array1_size(%rip), %eax
	movl	%eax, %ecx
	cmpq	%rcx, %rdi
	jae	.LBB0_2
# %bb.1:
	lfence
	movq	-16(%rbp), %rax
	leaq	array1(%rip), %rcx
	movb	(%rcx,%rax), %dl
	movb	%dl, -1(%rbp)
	jmp	.LBB0_3
.LBB0_2:
	lfence
	movb	$0, -1(%rbp)
.LBB0_3:
	movzbl	-1(%rbp), %eax
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
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	mem_leak
	movzbl	%al, %ecx
	movl	%ecx, %edi
	callq	mem_leak
	movb	%al, -9(%rbp)           # 1-byte Spill
	addq	$16, %rsp
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


	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym mem_leak
	.addrsig_sym victim_function_v22
	.addrsig_sym array1_size
	.addrsig_sym array1
	.addrsig_sym temp

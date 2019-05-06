	.text
	.file	"23.c"
	.globl	victim_function_v23     # -- Begin function victim_function_v23
	.p2align	4, 0x90
	.type	victim_function_v23,@function
victim_function_v23:                    # @victim_function_v23
	.cfi_startproc
# %bb.0:
	movl	array1_size(%rip), %eax
	cmpq	%rdi, %rax
	jbe	.LBB0_2
# %bb.1:
	lfence
	leaq	array1(%rip), %rax
	movzbl	(%rdi,%rax), %eax
	shlq	$9, %rax
	leaq	array2(%rip), %rcx
	movb	(%rax,%rcx), %al
	andb	%al, temp(%rip)
.LBB0_2:
	lfence
	retq
.Lfunc_end0:
	.size	victim_function_v23, .Lfunc_end0-victim_function_v23
	.cfi_endproc
                                        # -- End function
	.globl	attacker_function       # -- Begin function attacker_function
	.p2align	4, 0x90
	.type	attacker_function,@function
attacker_function:                      # @attacker_function
	.cfi_startproc
# %bb.0:
	cmpl	$43, array1_size(%rip)
	jb	.LBB1_2
# %bb.1:
	lfence
	movzbl	array1+42(%rip), %eax
	shlq	$9, %rax
	leaq	array2(%rip), %rcx
	movb	(%rax,%rcx), %al
	andb	%al, temp(%rip)
.LBB1_2:
	lfence
	retq
.Lfunc_end1:
	.size	attacker_function, .Lfunc_end1-attacker_function
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

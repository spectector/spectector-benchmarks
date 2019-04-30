	.text
	.file	"06.c"
	.globl	victim_function_v06     # -- Begin function victim_function_v06
	.p2align	4, 0x90
	.type	victim_function_v06,@function
victim_function_v06:                    # @victim_function_v06
	.cfi_startproc
# %bb.0:
	movzbl	array_size_mask(%rip), %eax
	movl	%edi, %ecx
	andl	%eax, %ecx
	cmpq	%rdi, %rcx
	jne	.LBB0_2
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
	.size	victim_function_v06, .Lfunc_end0-victim_function_v06
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

	.type	array_size_mask,@object # @array_size_mask
	.data
	.globl	array_size_mask
array_size_mask:
	.byte	15                      # 0xf
	.size	array_size_mask, 1

	.type	array2,@object          # @array2
	.comm	array2,131072,16

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

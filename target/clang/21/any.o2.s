	.text
	.file	"21.c"
	.globl	victim_function_v21     # -- Begin function victim_function_v21
	.p2align	4, 0x90
	.type	victim_function_v21,@function
victim_function_v21:                    # @victim_function_v21
	.cfi_startproc
# %bb.0:
	movl	array1_size(%rip), %eax
	cmpq	%rdi, %rax
	jbe	.LBB0_3
# %bb.1:
	movzbl	array1(%rdi), %ecx
	movb	temp(%rip), %dl
	andb	%cl, %dl
	movb	%dl, temp(%rip)
	cmpq	%rax, %rcx
	jae	.LBB0_3
# %bb.2:
	andb	array1(%rcx), %dl
	movb	%dl, temp(%rip)
.LBB0_3:
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

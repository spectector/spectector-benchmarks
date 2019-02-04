	.text
	.file	"22.c"
	.globl	mem_leak                # -- Begin function mem_leak
	.p2align	4, 0x90
	.type	mem_leak,@function
mem_leak:                               # @mem_leak
	.cfi_startproc
# %bb.0:
	movl	array1_size(%rip), %eax
	cmpq	%rdi, %rax
	jbe	.LBB0_1
# %bb.2:
	movb	array1(%rdi), %al
                                        # kill: def $al killed $al killed $eax
	retq
.LBB0_1:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
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

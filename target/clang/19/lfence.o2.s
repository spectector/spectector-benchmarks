	.text
	.file	"19.c"
	.globl	victim_function_v19     # -- Begin function victim_function_v19
	.p2align	4, 0x90
	.type	victim_function_v19,@function
victim_function_v19:                    # @victim_function_v19
	.cfi_startproc
# %bb.0:
	movl	array1_size(%rip), %eax
	cmpq	%rdi, %rax
	jbe	.LBB0_2
# %bb.1:
	lfence
	movzbl	array1(%rdi), %eax
	shlq	$9, %rax
	movb	array2(%rax), %al
	andb	%al, temp(%rip)
.LBB0_2:
	lfence
	retq
.Lfunc_end0:
	.size	victim_function_v19, .Lfunc_end0-victim_function_v19
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	movl	array1_size(%rip), %ecx
	testl	%ecx, %ecx
	je	.LBB1_3
# %bb.1:
	lfence
	movzbl	array1(%rip), %edx
	shlq	$9, %rdx
	movb	temp(%rip), %al
	andb	array2(%rdx), %al
	movb	%al, temp(%rip)
	cmpl	$43, %ecx
	jb	.LBB1_3
# %bb.2:
	lfence
	movzbl	array1+42(%rip), %ecx
	shlq	$9, %rcx
	andb	array2(%rcx), %al
	movb	%al, temp(%rip)
.LBB1_3:
	lfence
	xorl	%eax, %eax
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
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

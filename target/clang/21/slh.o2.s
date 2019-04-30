	.text
	.file	"21.c"
	.globl	victim_function_v21     # -- Begin function victim_function_v21
	.p2align	4, 0x90
	.type	victim_function_v21,@function
victim_function_v21:                    # @victim_function_v21
	.cfi_startproc
# %bb.0:
	movq	%rsp, %rax
	movq	$-1, %rsi
	sarq	$63, %rax
	movl	array1_size(%rip), %edx
	cmpq	%rdi, %rdx
	jbe	.LBB0_1
# %bb.2:
	cmovbeq	%rsi, %rax
	leaq	array1(%rip), %r8
	movzbl	(%rdi,%r8), %edi
	orq	%rax, %rdi
	movb	temp(%rip), %cl
	andb	%dil, %cl
	movb	%cl, temp(%rip)
	cmpq	%rdx, %rdi
	jae	.LBB0_3
# %bb.5:
	cmovaeq	%rsi, %rax
	andb	(%rdi,%r8), %cl
	orb	%al, %cl
	movb	%cl, temp(%rip)
	jmp	.LBB0_4
.LBB0_1:
	cmovaq	%rsi, %rax
	jmp	.LBB0_4
.LBB0_3:
	cmovbq	%rsi, %rax
.LBB0_4:
	shlq	$47, %rax
	orq	%rax, %rsp
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
	.addrsig

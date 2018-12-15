	.text
	.file	"07.c"
	.globl	victim_function_v07     # -- Begin function victim_function_v07
	.p2align	4, 0x90
	.type	victim_function_v07,@function
victim_function_v07:                    # @victim_function_v07
	.cfi_startproc
# %bb.0:
	movq	%rsp, %rax
	movq	$-1, %rcx
	sarq	$63, %rax
	cmpq	%rdi, victim_function_v07.last_x(%rip)
	jne	.LBB0_1
# %bb.2:
	cmovneq	%rcx, %rax
	movzbl	array1(%rdi), %edx
	shlq	$9, %rdx
	orq	%rax, %rdx
	movb	array2(%rdx), %dl
	orb	%al, %dl
	andb	%dl, temp(%rip)
	jmp	.LBB0_3
.LBB0_1:
	cmoveq	%rcx, %rax
.LBB0_3:
	movl	array1_size(%rip), %edx
	cmpq	%rdi, %rdx
	jbe	.LBB0_4
# %bb.5:
	cmovbeq	%rcx, %rax
	movq	%rdi, victim_function_v07.last_x(%rip)
	jmp	.LBB0_6
.LBB0_4:
	cmovaq	%rcx, %rax
.LBB0_6:
	shlq	$47, %rax
	orq	%rax, %rsp
	retq
.Lfunc_end0:
	.size	victim_function_v07, .Lfunc_end0-victim_function_v07
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

	.type	victim_function_v07.last_x,@object # @victim_function_v07.last_x
	.local	victim_function_v07.last_x
	.comm	victim_function_v07.last_x,8,8
	.type	array2,@object          # @array2
	.comm	array2,131072,16

	.ident	"clang version 7.0.0 (tags/RELEASE_700/final)"
	.section	".note.GNU-stack","",@progbits

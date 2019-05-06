	.text
	.file	"19.c"
	.globl	victim_function_v19     # -- Begin function victim_function_v19
	.p2align	4, 0x90
	.type	victim_function_v19,@function
victim_function_v19:                    # @victim_function_v19
	.cfi_startproc
# %bb.0:
	movq	%rsp, %rax
	movq	$-1, %rcx
	sarq	$63, %rax
	movl	array1_size(%rip), %edx
	cmpq	%rdi, %rdx
	jbe	.LBB0_1
# %bb.2:
	cmovbeq	%rcx, %rax
	leaq	array1(%rip), %rcx
	movzbl	(%rdi,%rcx), %ecx
	shlq	$9, %rcx
	orq	%rax, %rcx
	leaq	array2(%rip), %rdx
	movb	(%rcx,%rdx), %cl
	orb	%al, %cl
	andb	%cl, temp(%rip)
	jmp	.LBB0_3
.LBB0_1:
	cmovaq	%rcx, %rax
.LBB0_3:
	shlq	$47, %rax
	orq	%rax, %rsp
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
	movq	%rsp, %rcx
	movq	$-1, %rax
	sarq	$63, %rcx
	movl	array1_size(%rip), %esi
	testl	%esi, %esi
	je	.LBB1_1
# %bb.2:
	cmoveq	%rax, %rcx
	movzbl	array1(%rip), %edi
	shlq	$9, %rdi
	leaq	array2(%rip), %r8
	movb	temp(%rip), %dl
	andb	(%rdi,%r8), %dl
	orb	%cl, %dl
	movb	%dl, temp(%rip)
	cmpl	$43, %esi
	jb	.LBB1_3
# %bb.4:
	cmovbq	%rax, %rcx
	movzbl	array1+42(%rip), %eax
	shlq	$9, %rax
	andb	(%rax,%r8), %dl
	orb	%cl, %dl
	movb	%dl, temp(%rip)
	jmp	.LBB1_5
.LBB1_1:
	cmovneq	%rax, %rcx
	jmp	.LBB1_5
.LBB1_3:
	cmovaeq	%rax, %rcx
.LBB1_5:
	shlq	$47, %rcx
	xorl	%eax, %eax
	orq	%rcx, %rsp
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

	.ident	"clang version 8.0.0 (tags/RELEASE_800/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

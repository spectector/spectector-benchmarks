	.text
	.file	"11sub.c"
	.globl	victim_function_v11     # -- Begin function victim_function_v11
	.p2align	4, 0x90
	.type	victim_function_v11,@function
victim_function_v11:                    # @victim_function_v11
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
	subb	%cl, temp(%rip)
	jmp	.LBB0_3
.LBB0_1:
	cmovaq	%rcx, %rax
.LBB0_3:
	shlq	$47, %rax
	orq	%rax, %rsp
	retq
.Lfunc_end0:
	.size	victim_function_v11, .Lfunc_end0-victim_function_v11
	.cfi_endproc
                                        # -- End function
	.globl	mymemcmp                # -- Begin function mymemcmp
	.p2align	4, 0x90
	.type	mymemcmp,@function
mymemcmp:                               # @mymemcmp
	.cfi_startproc
# %bb.0:
	movq	%rsp, %r9
	movq	$-1, %r8
	sarq	$63, %r9
	testq	%rdx, %rdx
	je	.LBB1_1
# %bb.2:
	cmoveq	%r8, %r9
	cmpq	$1, %rdx
	je	.LBB1_7
# %bb.3:
	cmoveq	%r8, %r9
	movl	$1, %eax
	subq	%rdx, %rax
	jmp	.LBB1_4
	.p2align	4, 0x90
.LBB1_10:                               #   in Loop: Header=BB1_4 Depth=1
	cmoveq	%r8, %r9
.LBB1_4:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi), %edx
	orb	%r9b, %dl
	movq	%r9, %rcx
	orq	%rsi, %rcx
	cmpb	(%rcx), %dl
	jne	.LBB1_5
# %bb.6:                                #   in Loop: Header=BB1_4 Depth=1
	cmovneq	%r8, %r9
	addq	$1, %rdi
	addq	$1, %rsi
	incq	%rax
	jne	.LBB1_10
.LBB1_7:
	cmovneq	%r8, %r9
	jmp	.LBB1_8
.LBB1_1:
	cmovneq	%r8, %r9
	xorl	%eax, %eax
	jmp	.LBB1_9
.LBB1_5:
	cmoveq	%r8, %r9
.LBB1_8:
	movzbl	(%rdi), %eax
	movzbl	(%rsi), %ecx
	subl	%ecx, %eax
	orl	%r9d, %eax
.LBB1_9:
	shlq	$47, %r9
	orq	%r9, %rsp
	retq
.Lfunc_end1:
	.size	mymemcmp, .Lfunc_end1-mymemcmp
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

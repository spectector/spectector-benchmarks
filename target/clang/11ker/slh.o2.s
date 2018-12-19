	.text
	.file	"11ker.c"
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
	movzbl	array1(%rdi), %ecx
	shlq	$9, %rcx
	orq	%rax, %rcx
	movb	array2(%rcx), %cl
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
	je	.LBB1_6
# %bb.1:                                # %.preheader
	cmoveq	%r8, %r9
	xorl	%r10d, %r10d
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_5:                                #   in Loop: Header=BB1_2 Depth=1
	cmoveq	%r8, %r9
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%r10), %eax
	orl	%r9d, %eax
	movzbl	(%rsi,%r10), %ecx
	orl	%r9d, %ecx
	subl	%ecx, %eax
	jne	.LBB1_3
# %bb.4:                                #   in Loop: Header=BB1_2 Depth=1
	cmovneq	%r8, %r9
	addq	$1, %r10
	cmpq	%r10, %rdx
	jne	.LBB1_5
.LBB1_6:
	cmovneq	%r8, %r9
	xorl	%eax, %eax
	jmp	.LBB1_7
.LBB1_3:
	cmoveq	%r8, %r9
.LBB1_7:
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

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

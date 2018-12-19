	.text
	.file	"11ker.c"
	.globl	victim_function_v11     # -- Begin function victim_function_v11
	.p2align	4, 0x90
	.type	victim_function_v11,@function
victim_function_v11:                    # @victim_function_v11
	.cfi_startproc
# %bb.0:
	movl	array1_size(%rip), %eax
	cmpq	%rdi, %rax
	jbe	.LBB0_2
# %bb.1:
	movzbl	array1(%rdi), %eax
	shlq	$9, %rax
	movb	array2(%rax), %al
	subb	%al, temp(%rip)
.LBB0_2:
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
	testq	%rdx, %rdx
	je	.LBB1_4
# %bb.1:                                # %.preheader
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%r8), %eax
	movzbl	(%rsi,%r8), %ecx
	subl	%ecx, %eax
	jne	.LBB1_5
# %bb.3:                                #   in Loop: Header=BB1_2 Depth=1
	addq	$1, %r8
	cmpq	%r8, %rdx
	jne	.LBB1_2
.LBB1_4:
	xorl	%eax, %eax
.LBB1_5:
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

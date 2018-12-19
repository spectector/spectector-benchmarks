	.text
	.file	"05-no-unsigned.c"
	.globl	victim_function_v05     # -- Begin function victim_function_v05
	.p2align	4, 0x90
	.type	victim_function_v05,@function
victim_function_v05:                    # @victim_function_v05
	.cfi_startproc
# %bb.0:
	testq	%rdi, %rdi
	js	.LBB0_12
# %bb.1:
	movl	array1_size(%rip), %eax
	cmpq	%rdi, %rax
	jle	.LBB0_12
# %bb.2:
	movl	%edi, %r8d
	addl	$-1, %r8d
	js	.LBB0_12
# %bb.3:
	movb	temp(%rip), %al
	movslq	%r8d, %rsi
	testb	$3, %dil
	je	.LBB0_4
# %bb.5:                                # %.preheader1
	andl	$3, %edi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movzbl	array1(%rsi), %edx
	shlq	$9, %rdx
	andb	array2(%rdx), %al
	addq	$-1, %rsi
	addq	$1, %rcx
	cmpl	%ecx, %edi
	jne	.LBB0_6
# %bb.7:                                # %.loopexit2
	movl	%r8d, %edx
	subl	%ecx, %edx
	cmpl	$3, %r8d
	jae	.LBB0_9
	jmp	.LBB0_11
.LBB0_4:
	movl	%r8d, %edx
	cmpl	$3, %r8d
	jb	.LBB0_11
.LBB0_9:                                # %.preheader
	leaq	array1(%rsi), %rcx
	.p2align	4, 0x90
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%rcx), %esi
	shlq	$9, %rsi
	andb	array2(%rsi), %al
	movzbl	-1(%rcx), %esi
	shlq	$9, %rsi
	andb	array2(%rsi), %al
	movzbl	-2(%rcx), %esi
	shlq	$9, %rsi
	andb	array2(%rsi), %al
	movzbl	-3(%rcx), %esi
	shlq	$9, %rsi
	addq	$-4, %rcx
	andb	array2(%rsi), %al
	addl	$-4, %edx
	jns	.LBB0_10
.LBB0_11:
	movb	%al, temp(%rip)
.LBB0_12:
	retq
.Lfunc_end0:
	.size	victim_function_v05, .Lfunc_end0-victim_function_v05
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

	.text
	.file	"05-no-unsigned.c"
	.globl	victim_function_v05     # -- Begin function victim_function_v05
	.p2align	4, 0x90
	.type	victim_function_v05,@function
victim_function_v05:                    # @victim_function_v05
	.cfi_startproc
# %bb.0:
	movq	%rsp, %r10
	movq	$-1, %r9
	sarq	$63, %r10
	testq	%rdi, %rdi
	js	.LBB0_9
# %bb.1:
	cmovsq	%r9, %r10
	movl	array1_size(%rip), %ecx
	cmpq	%rdi, %rcx
	jle	.LBB0_10
# %bb.2:
	cmovleq	%r9, %r10
	movl	%edi, %r8d
	addl	$-1, %r8d
	js	.LBB0_9
# %bb.3:
	cmovsq	%r9, %r10
	movb	temp(%rip), %dl
	movslq	%r8d, %rsi
	testb	$3, %dil
	je	.LBB0_12
# %bb.4:                                # %.preheader1
	cmoveq	%r9, %r10
	andl	$3, %edi
	xorl	%ecx, %ecx
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=1
	cmoveq	%r9, %r10
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movzbl	array1(%rsi), %eax
	shlq	$9, %rax
	orq	%r10, %rax
	andb	array2(%rax), %dl
	orb	%r10b, %dl
	addq	$-1, %rsi
	addq	$1, %rcx
	cmpl	%ecx, %edi
	jne	.LBB0_5
# %bb.7:                                # %.loopexit2
	cmovneq	%r9, %r10
	movl	%r8d, %edi
	subl	%ecx, %edi
	cmpl	$3, %r8d
	jae	.LBB0_13
.LBB0_8:
	cmovaeq	%r9, %r10
	jmp	.LBB0_17
.LBB0_9:
	cmovnsq	%r9, %r10
	jmp	.LBB0_18
.LBB0_10:
	cmovgq	%r9, %r10
	jmp	.LBB0_18
.LBB0_12:
	cmovneq	%r9, %r10
	movl	%r8d, %edi
	cmpl	$3, %r8d
	jb	.LBB0_8
.LBB0_13:                               # %.preheader
	cmovbq	%r9, %r10
	leaq	array1(%rsi), %rsi
	jmp	.LBB0_15
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_15 Depth=1
	cmovsq	%r9, %r10
.LBB0_15:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%rsi), %eax
	shlq	$9, %rax
	orq	%r10, %rax
	andb	array2(%rax), %dl
	movzbl	-1(%rsi), %eax
	shlq	$9, %rax
	orq	%r10, %rax
	andb	array2(%rax), %dl
	movzbl	-2(%rsi), %eax
	shlq	$9, %rax
	orq	%r10, %rax
	andb	array2(%rax), %dl
	movzbl	-3(%rsi), %eax
	shlq	$9, %rax
	orq	%r10, %rax
	andb	array2(%rax), %dl
	orb	%r10b, %dl
	addq	$-4, %rsi
	addl	$-4, %edi
	jns	.LBB0_14
# %bb.16:
	cmovnsq	%r9, %r10
.LBB0_17:
	movb	%dl, temp(%rip)
.LBB0_18:
	shlq	$47, %r10
	orq	%r10, %rsp
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

	.ident	"clang version 7.0.0 (tags/RELEASE_700/final)"
	.section	".note.GNU-stack","",@progbits

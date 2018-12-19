	.text
	.file	"11gcc.c"
	.globl	victim_function_v11     # -- Begin function victim_function_v11
	.p2align	4, 0x90
	.type	victim_function_v11,@function
victim_function_v11:                    # @victim_function_v11
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
	movzbl	array1(%rdi), %edx
	shlq	$9, %rdx
	orq	%rax, %rdx
	movb	temp(%rip), %dil
	movb	array2(%rdx), %cl
	orb	%al, %cl
	cmpb	%cl, %dil
	setae	%dl
	cmpb	%cl, %dil
	je	.LBB0_3
# %bb.4:
	cmoveq	%rsi, %rax
	addb	%dl, %dl
	addb	$-1, %dl
	jmp	.LBB0_5
.LBB0_1:
	cmovaq	%rsi, %rax
	jmp	.LBB0_6
.LBB0_3:
	cmovneq	%rsi, %rax
	xorl	%edx, %edx
.LBB0_5:
	movb	%dl, temp(%rip)
.LBB0_6:
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsp, %r9
	movq	$-1, %r8
	sarq	$63, %r9
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	cmpq	%rcx, %rdx
	jne	.LBB1_3
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_4:                                #   in Loop: Header=BB1_3 Depth=1
	cmovneq	%r8, %r9
	cmpq	%rcx, %rdx
	je	.LBB1_2
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	cmoveq	%r8, %r9
	movzbl	(%rsi,%rcx), %r10d
	orb	%r9b, %r10b
	movq	%r9, %r11
	orq	%rdi, %r11
	movq	%r9, %rbx
	orq	%rcx, %rbx
	addq	$1, %rcx
	cmpb	%r10b, (%r11,%rbx)
	je	.LBB1_4
# %bb.5:
	cmoveq	%r8, %r9
	setae	%al
	movzbl	%al, %eax
	leal	(%rax,%rax), %eax
	addl	$-1, %eax
	jmp	.LBB1_6
.LBB1_2:
	cmovneq	%r8, %r9
.LBB1_6:
	shlq	$47, %r9
                                        # kill: def $eax killed $eax killed $rax
	orq	%r9, %rsp
	popq	%rbx
	.cfi_def_cfa_offset 8
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

	.text
	.file	"05-no-unsigned.c"
	.globl	victim_function_v05     # -- Begin function victim_function_v05
	.p2align	4, 0x90
	.type	victim_function_v05,@function
victim_function_v05:                    # @victim_function_v05
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsp, %rax
	movq	$-1, %r9
	sarq	$63, %rax
	testq	%rdi, %rdi
	js	.LBB0_9
# %bb.1:
	cmovsq	%r9, %rax
	movl	array1_size(%rip), %ecx
	cmpq	%rdi, %rcx
	jle	.LBB0_10
# %bb.2:
	cmovleq	%r9, %rax
	movl	%edi, %r8d
	addl	$-1, %r8d
	js	.LBB0_9
# %bb.3:
	cmovsq	%r9, %rax
	movb	temp(%rip), %dl
	movslq	%r8d, %rsi
	testb	$3, %dil
	je	.LBB0_12
# %bb.4:
	cmoveq	%r9, %rax
	andl	$3, %edi
	xorl	%ecx, %ecx
	leaq	array1(%rip), %r10
	leaq	array2(%rip), %r11
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=1
	cmoveq	%r9, %rax
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rsi,%r10), %ebx
	shlq	$9, %rbx
	orq	%rax, %rbx
	andb	(%rbx,%r11), %dl
	orb	%al, %dl
	addq	$-1, %rsi
	addq	$1, %rcx
	cmpl	%ecx, %edi
	jne	.LBB0_5
# %bb.7:
	cmovneq	%r9, %rax
	movl	%r8d, %edi
	subl	%ecx, %edi
	cmpl	$3, %r8d
	jae	.LBB0_13
.LBB0_8:
	cmovaeq	%r9, %rax
	jmp	.LBB0_17
.LBB0_9:
	cmovnsq	%r9, %rax
	jmp	.LBB0_18
.LBB0_10:
	cmovgq	%r9, %rax
	jmp	.LBB0_18
.LBB0_12:
	cmovneq	%r9, %rax
	movl	%r8d, %edi
	cmpl	$3, %r8d
	jb	.LBB0_8
.LBB0_13:
	cmovbq	%r9, %rax
	leaq	array1(%rip), %rcx
	addq	%rsi, %rcx
	leaq	array2(%rip), %rsi
	jmp	.LBB0_15
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_15 Depth=1
	cmovsq	%r9, %rax
.LBB0_15:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%rcx), %ebx
	shlq	$9, %rbx
	orq	%rax, %rbx
	andb	(%rbx,%rsi), %dl
	movzbl	-1(%rcx), %ebx
	shlq	$9, %rbx
	orq	%rax, %rbx
	andb	(%rbx,%rsi), %dl
	movzbl	-2(%rcx), %ebx
	shlq	$9, %rbx
	orq	%rax, %rbx
	andb	(%rbx,%rsi), %dl
	movzbl	-3(%rcx), %ebx
	shlq	$9, %rbx
	orq	%rax, %rbx
	andb	(%rbx,%rsi), %dl
	orb	%al, %dl
	addq	$-4, %rcx
	addl	$-4, %edi
	jns	.LBB0_14
# %bb.16:
	cmovnsq	%r9, %rax
.LBB0_17:
	movb	%dl, temp(%rip)
.LBB0_18:
	shlq	$47, %rax
	orq	%rax, %rsp
	popq	%rbx
	.cfi_def_cfa_offset 8
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

	.ident	"clang version 8.0.0 (tags/RELEASE_800/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

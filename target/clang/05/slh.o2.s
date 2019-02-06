	.text
	.file	"05.c"
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
	movl	array1_size(%rip), %ecx
	cmpq	%rdi, %rcx
	jbe	.LBB0_1
# %bb.2:
	cmovbeq	%r9, %rax
	movl	%edi, %r8d
	addl	$-1, %r8d
	js	.LBB0_3
# %bb.4:
	cmovsq	%r9, %rax
	movb	temp(%rip), %dl
	movslq	%r8d, %rsi
	testb	$3, %dil
	je	.LBB0_5
# %bb.6:
	cmoveq	%r9, %rax
	andl	$3, %edi
	xorl	%ecx, %ecx
	leaq	array1(%rip), %r10
	leaq	array2(%rip), %r11
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_7 Depth=1
	cmoveq	%r9, %rax
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rsi,%r10), %ebx
	shlq	$9, %rbx
	orq	%rax, %rbx
	andb	(%rbx,%r11), %dl
	orb	%al, %dl
	addq	$-1, %rsi
	addq	$1, %rcx
	cmpl	%ecx, %edi
	jne	.LBB0_8
# %bb.9:
	cmovneq	%r9, %rax
	movl	%r8d, %edi
	subl	%ecx, %edi
	cmpl	$3, %r8d
	jae	.LBB0_12
.LBB0_11:
	cmovaeq	%r9, %rax
	jmp	.LBB0_15
.LBB0_1:
	cmovaq	%r9, %rax
	jmp	.LBB0_16
.LBB0_3:
	cmovnsq	%r9, %rax
	jmp	.LBB0_16
.LBB0_5:
	cmovneq	%r9, %rax
	movl	%r8d, %edi
	cmpl	$3, %r8d
	jb	.LBB0_11
.LBB0_12:
	cmovbq	%r9, %rax
	leaq	array1(%rip), %rcx
	addq	%rsi, %rcx
	leaq	array2(%rip), %rsi
	jmp	.LBB0_13
	.p2align	4, 0x90
.LBB0_17:                               #   in Loop: Header=BB0_13 Depth=1
	cmovsq	%r9, %rax
.LBB0_13:                               # =>This Inner Loop Header: Depth=1
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
	jns	.LBB0_17
# %bb.14:
	cmovnsq	%r9, %rax
.LBB0_15:
	movb	%dl, temp(%rip)
.LBB0_16:
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

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

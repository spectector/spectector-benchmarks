	.file	"11gcc.c"
	.text
	.globl	array1_size
	.data
	.align 4
	.type	array1_size, @object
	.size	array1_size, 4
array1_size:
	.long	16
	.globl	array1
	.align 16
	.type	array1, @object
	.size	array1, 16
array1:
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017\020"
	.comm	array2,131072,32
	.globl	temp
	.bss
	.type	temp, @object
	.size	temp, 1
temp:
	.zero	1
	.text
	.globl	victim_function_v11
	.type	victim_function_v11, @function
victim_function_v11:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	$-1, %rdx
	movl	array1_size(%rip), %eax
	movl	%eax, %eax
	cmpq	%rax, -8(%rbp)
	sbbq	%rax, %rax
	testq	%rax, %rax
	je	.L4
	andq	%rdx, %rax
	andq	-8(%rbp), %rax
	movzbl	array1(%rax), %eax
	movzbl	%al, %eax
	sall	$9, %eax
	cltq
	addq	$array2, %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$temp, %edi
	call	mymemcmp
	movb	%al, temp(%rip)
.L4:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	victim_function_v11, .-victim_function_v11
	.globl	mymemcmp
	.type	mymemcmp, @function
mymemcmp:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$-1, %rcx
	movq	-24(%rbp), %rbx
	movq	-32(%rbp), %r12
	jmp	.L6
.L11:
	andq	%rcx, %rax
	movq	%rbx, %rdx
	leaq	1(%rdx), %rbx
	andq	%rax, %rdx
	movzbl	(%rdx), %ecx
	movq	%r12, %rdx
	leaq	1(%rdx), %r12
	andq	%rax, %rdx
	movzbl	(%rdx), %edx
	cmpb	%dl, %cl
	sete	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	je	.L7
	andq	%rdx, %rax
	leaq	-1(%rbx), %rdx
	andq	%rax, %rdx
	movzbl	(%rdx), %edx
	leaq	-1(%r12), %rcx
	andq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	sbbq	%rax, %rax
	testq	%rax, %rax
	je	.L8
	movl	$-1, %eax
	jmp	.L10
.L8:
	movl	$1, %eax
	jmp	.L10
.L7:
	notq	%rdx
	andq	%rdx, %rax
	movq	%rax, %rcx
.L6:
	movq	-40(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	cmpq	$1, %rax
	sbbq	%rax, %rax
	notq	%rax
	testq	%rax, %rax
	jne	.L11
	movl	$0, %eax
.L10:
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	mymemcmp, .-mymemcmp
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

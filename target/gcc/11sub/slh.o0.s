	.file	"11sub.c"
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
	movq	$-1, %rdx
	movq	-24(%rbp), %r12
	movq	-32(%rbp), %rbx
	cmpq	$1, -40(%rbp)
	sbbq	%rax, %rax
	testq	%rax, %rax
	je	.L6
	movl	$0, %eax
	jmp	.L7
.L6:
	notq	%rax
	andq	%rax, %rdx
	jmp	.L8
.L11:
	andq	%rax, %rdx
	addq	$1, %r12
	addq	$1, %rbx
.L8:
	subq	$1, -40(%rbp)
	cmpq	$1, -40(%rbp)
	sbbq	%rax, %rax
	notq	%rax
	testq	%rax, %rax
	jne	.L9
	notq	%rax
	andq	%rdx, %rax
	jmp	.L10
.L9:
	andq	%rdx, %rax
	movq	%r12, %rdx
	andq	%rax, %rdx
	movzbl	(%rdx), %ecx
	movq	%rbx, %rdx
	andq	%rax, %rdx
	movzbl	(%rdx), %edx
	cmpb	%dl, %cl
	setne	%dl
	movzbl	%dl, %edx
	subq	$1, %rdx
	testq	%rdx, %rdx
	jne	.L11
	notq	%rdx
	andq	%rdx, %rax
.L10:
	movq	%r12, %rdx
	andq	%rax, %rdx
	movzbl	(%rdx), %edx
	movzbl	%dl, %edx
	andq	%rbx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
.L7:
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

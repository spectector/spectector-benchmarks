	.file	"11ker.c"
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
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	$-1, %rdx
	movl	$0, -20(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L6
.L9:
	andq	%rdx, %rax
	movq	%rax, %rdx
	andq	-8(%rbp), %rdx
	movzbl	(%rdx), %edx
	movzbl	%dl, %ecx
	movq	%rax, %rdx
	andq	-16(%rbp), %rdx
	movzbl	(%rdx), %edx
	movzbl	%dl, %edx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, -20(%rbp)
	cmpl	$1, -20(%rbp)
	sbbq	%rdx, %rdx
	notq	%rdx
	testq	%rdx, %rdx
	jne	.L11
	notq	%rdx
	andq	%rax, %rdx
	addq	$1, -8(%rbp)
	addq	$1, -16(%rbp)
	subq	$1, -56(%rbp)
.L6:
	cmpq	$1, -56(%rbp)
	sbbq	%rax, %rax
	notq	%rax
	testq	%rax, %rax
	jne	.L9
	jmp	.L8
.L11:
	nop
.L8:
	movl	-20(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	mymemcmp, .-mymemcmp
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

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
	movl	array1_size(%rip), %eax
	movl	%eax, %eax
	cmpq	%rax, -8(%rbp)
	jnb	.L3
	movq	-8(%rbp), %rax
	addq	$array1, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	sall	$9, %eax
	cltq
	addq	$array2, %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$temp, %edi
	call	mymemcmp
	movb	%al, temp(%rip)
.L3:
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
	movq	-24(%rbp), %r12
	movq	-32(%rbp), %rbx
	cmpq	$0, -40(%rbp)
	jne	.L7
	movl	$0, %eax
	jmp	.L6
.L9:
	addq	$1, %r12
	addq	$1, %rbx
.L7:
	subq	$1, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L8
	movzbl	(%r12), %edx
	movzbl	(%rbx), %eax
	cmpb	%al, %dl
	je	.L9
.L8:
	movzbl	(%r12), %eax
	movzbl	%al, %edx
	movzbl	(%rbx), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
.L6:
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

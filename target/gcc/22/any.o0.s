	.file	"22.c"
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
	.globl	temp
	.bss
	.type	temp, @object
	.size	temp, 1
temp:
	.zero	1
	.text
	.globl	mem_leak
	.type	mem_leak, @function
mem_leak:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	array1_size(%rip), %eax
	movl	%eax, %eax
	cmpq	%rax, -8(%rbp)
	jnb	.L2
	movq	-8(%rbp), %rax
	addq	$array1, %rax
	movzbl	(%rax), %eax
	jmp	.L3
.L2:
	movl	$0, %eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	mem_leak, .-mem_leak
	.globl	victim_function_v22
	.type	victim_function_v22, @function
victim_function_v22:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	mem_leak
	movzbl	%al, %eax
	movq	%rax, %rdi
	call	mem_leak
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	victim_function_v22, .-victim_function_v22
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

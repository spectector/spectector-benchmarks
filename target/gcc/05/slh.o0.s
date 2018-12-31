	.file	"05.c"
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
	.globl	victim_function_v05
	.type	victim_function_v05, @function
victim_function_v05:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	$-1, %rdx
	movl	array1_size(%rip), %eax
	movl	%eax, %eax
	cmpq	%rax, -24(%rbp)
	sbbq	%rax, %rax
	testq	%rax, %rax
	je	.L6
	andq	%rax, %rdx
	movq	-24(%rbp), %rax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L4
.L5:
	andq	%rax, %rdx
	movl	%edx, %eax
	andl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movzbl	array1(%rcx), %ecx
	movzbl	%cl, %ecx
	sall	$9, %ecx
	movslq	%ecx, %rcx
	movzbl	array2(%rcx), %esi
	movzbl	temp(%rip), %ecx
	andl	%esi, %ecx
	movb	%cl, temp(%rip)
	subl	$1, %eax
	movl	%eax, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	cltq
	sarq	$63, %rax
	notq	%rax
	testq	%rax, %rax
	jne	.L5
.L6:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	victim_function_v05, .-victim_function_v05
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

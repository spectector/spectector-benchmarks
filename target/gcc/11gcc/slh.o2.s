	.file	"11gcc.c"
	.text
	.p2align 4
	.globl	victim_function_v11
	.type	victim_function_v11, @function
victim_function_v11:
.LFB11:
	.cfi_startproc
	movl	array1_size(%rip), %edx
	movq	%rdi, %rax
	cmpq	%rdx, %rdi
	sbbq	%rdi, %rdi
	testq	%rdi, %rdi
	je	.L1
	andq	%rax, %rdi
	movzbl	temp(%rip), %edx
	movzbl	array1(%rdi), %eax
	sall	$9, %eax
	cltq
	movzbl	array2(%rax), %eax
	cmpb	%al, %dl
	jne	.L4
	xorl	%eax, %eax
.L5:
	movb	%al, temp(%rip)
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	cmpb	%al, %dl
	sbbq	%rax, %rax
	cmpq	$1, %rax
	sbbl	%eax, %eax
	andl	$2, %eax
	subl	$1, %eax
	jmp	.L5
	.cfi_endproc
.LFE11:
	.size	victim_function_v11, .-victim_function_v11
	.p2align 4
	.globl	mymemcmp
	.type	mymemcmp, @function
mymemcmp:
.LFB12:
	.cfi_startproc
	movq	$-1, %rax
	xorl	%r8d, %r8d
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L13:
	andq	%rcx, %rax
	leaq	(%rdi,%r8), %rcx
	addq	$1, %r8
	andq	%rax, %rcx
	movzbl	(%rcx), %r9d
	leaq	-1(%rsi,%r8), %rcx
	andq	%rax, %rcx
	movzbl	(%rcx), %ecx
	cmpb	%cl, %r9b
	jne	.L14
.L9:
	xorl	%ecx, %ecx
	cmpq	%r8, %rdx
	sete	%cl
	subq	$1, %rcx
	jne	.L13
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	sbbq	%rax, %rax
	cmpq	$1, %rax
	sbbl	%eax, %eax
	andl	$2, %eax
	subl	$1, %eax
	ret
	.cfi_endproc
.LFE12:
	.size	mymemcmp, .-mymemcmp
	.globl	temp
	.bss
	.type	temp, @object
	.size	temp, 1
temp:
	.zero	1
	.comm	array2,131072,32
	.globl	array1
	.data
	.align 16
	.type	array1, @object
	.size	array1, 16
array1:
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017\020"
	.globl	array1_size
	.align 4
	.type	array1_size, @object
	.size	array1_size, 4
array1_size:
	.long	16
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

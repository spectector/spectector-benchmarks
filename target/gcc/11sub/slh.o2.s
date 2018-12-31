	.file	"11sub.c"
	.text
	.p2align 4
	.globl	victim_function_v11
	.type	victim_function_v11, @function
victim_function_v11:
.LFB11:
	.cfi_startproc
	movl	array1_size(%rip), %eax
	cmpq	%rax, %rdi
	sbbq	%rax, %rax
	testq	%rax, %rax
	je	.L1
	andq	%rax, %rdi
	movzbl	array1(%rdi), %eax
	sall	$9, %eax
	cltq
	movzbl	array2(%rax), %eax
	subb	%al, temp(%rip)
.L1:
	ret
	.cfi_endproc
.LFE11:
	.size	victim_function_v11, .-victim_function_v11
	.p2align 4
	.globl	mymemcmp
	.type	mymemcmp, @function
mymemcmp:
.LFB12:
	.cfi_startproc
	cmpq	$1, %rdx
	sbbq	%rax, %rax
	testq	%rax, %rax
	jne	.L14
	xorl	%eax, %eax
	cmpq	$1, %rdx
	movzbl	(%rdi), %r9d
	movzbl	(%rsi), %r10d
	sete	%al
	movl	$1, %r8d
	subq	$1, %rax
	jne	.L10
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L12:
	andq	%rcx, %rax
	leaq	(%rdi,%r8), %rcx
	addq	$1, %r8
	andq	%rax, %rcx
	movzbl	(%rcx), %r9d
	leaq	-1(%rsi,%r8), %rcx
	andq	%rax, %rcx
	movzbl	(%rcx), %r10d
	xorl	%ecx, %ecx
	cmpq	%rdx, %r8
	sete	%cl
	subq	$1, %rcx
	je	.L9
	andq	%rcx, %rax
.L10:
	xorl	%ecx, %ecx
	cmpb	%r10b, %r9b
	setne	%cl
	subq	$1, %rcx
	jne	.L12
.L9:
	movzbl	%r9b, %eax
	subl	%r10d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	xorl	%eax, %eax
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

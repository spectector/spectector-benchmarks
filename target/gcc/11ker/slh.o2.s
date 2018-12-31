	.file	"11ker.c"
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
	sbbq	%r9, %r9
	xorl	%ecx, %ecx
	notq	%r9
	testq	%r9, %r9
	jne	.L10
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L16:
	addq	$1, %rcx
	xorl	%r8d, %r8d
	cmpq	%rcx, %rdx
	sete	%r8b
	subq	$1, %r8
	je	.L5
	andq	%r8, %r9
.L10:
	leaq	(%rdi,%rcx), %rax
	leaq	(%rsi,%rcx), %r8
	andq	%r9, %rax
	andq	%r9, %r8
	movzbl	(%r8), %r8d
	movzbl	(%rax), %eax
	subl	%r8d, %eax
	cmpl	$1, %eax
	sbbq	%r8, %r8
	testq	%r8, %r8
	jne	.L16
.L5:
	ret
.L15:
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

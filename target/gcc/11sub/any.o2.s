	.file	"11sub.c"
	.text
	.p2align 4
	.globl	victim_function_v11
	.type	victim_function_v11, @function
victim_function_v11:
.LFB11:
	.cfi_startproc
	movl	array1_size(%rip), %eax
	cmpq	%rdi, %rax
	jbe	.L1
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
	xorl	%eax, %eax
	testq	%rdx, %rdx
	je	.L4
	movzbl	(%rdi), %ecx
	movzbl	(%rsi), %r8d
	movl	$1, %eax
	cmpq	$1, %rdx
	jne	.L6
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L8:
	movzbl	(%rdi,%rax), %ecx
	addq	$1, %rax
	movzbl	-1(%rsi,%rax), %r8d
	cmpq	%rdx, %rax
	je	.L7
.L6:
	cmpb	%r8b, %cl
	je	.L8
.L7:
	movzbl	%cl, %eax
	subl	%r8d, %eax
.L4:
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

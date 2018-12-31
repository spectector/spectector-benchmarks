	.file	"11ker.c"
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
	testq	%rdx, %rdx
	je	.L7
	xorl	%ecx, %ecx
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L10:
	addq	$1, %rcx
	cmpq	%rcx, %rdx
	je	.L9
.L6:
	movzbl	(%rdi,%rcx), %eax
	movzbl	(%rsi,%rcx), %r8d
	subl	%r8d, %eax
	je	.L10
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	ret
.L7:
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

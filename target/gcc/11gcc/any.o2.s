	.file	"11gcc.c"
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
	xorl	%edx, %edx
	sall	$9, %eax
	cltq
	movzbl	array2(%rax), %eax
	cmpb	%al, temp(%rip)
	jne	.L7
.L3:
	movb	%dl, temp(%rip)
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	sbbl	%edx, %edx
	orl	$1, %edx
	jmp	.L3
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
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L11:
	movzbl	(%rdi,%rax), %ecx
	addq	$1, %rax
	cmpb	-1(%rsi,%rax), %cl
	jne	.L14
.L9:
	cmpq	%rax, %rdx
	jne	.L11
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	sbbl	%eax, %eax
	orl	$1, %eax
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

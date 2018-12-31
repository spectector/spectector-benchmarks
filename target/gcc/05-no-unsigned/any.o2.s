	.file	"05-no-unsigned.c"
	.text
	.p2align 4
	.globl	victim_function_v05
	.type	victim_function_v05, @function
victim_function_v05:
.LFB11:
	.cfi_startproc
	movl	array1_size(%rip), %eax
	cmpq	%rdi, %rax
	jbe	.L1
	subl	$1, %edi
	js	.L1
	movzbl	temp(%rip), %ecx
	movslq	%edi, %rax
	.p2align 4,,10
	.p2align 3
.L3:
	movzbl	array1(%rax), %edx
	subq	$1, %rax
	sall	$9, %edx
	movslq	%edx, %rdx
	andb	array2(%rdx), %cl
	testl	%eax, %eax
	jns	.L3
	movb	%cl, temp(%rip)
.L1:
	ret
	.cfi_endproc
.LFE11:
	.size	victim_function_v05, .-victim_function_v05
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

	.file	"23.c"
	.text
	.p2align 4
	.globl	victim_function_v23
	.type	victim_function_v23, @function
victim_function_v23:
.LFB11:
	.cfi_startproc
	movl	array1_size(%rip), %eax
	cmpq	%rdi, %rax
	jbe	.L1
	movzbl	array1(%rdi), %eax
	sall	$9, %eax
	cltq
	movzbl	array2(%rax), %eax
	andb	%al, temp(%rip)
.L1:
	ret
	.cfi_endproc
.LFE11:
	.size	victim_function_v23, .-victim_function_v23
	.p2align 4
	.globl	attacker_function
	.type	attacker_function, @function
attacker_function:
.LFB12:
	.cfi_startproc
	cmpl	$42, array1_size(%rip)
	jbe	.L4
	movzbl	array1+42(%rip), %eax
	sall	$9, %eax
	cltq
	movzbl	array2(%rax), %eax
	andb	%al, temp(%rip)
.L4:
	ret
	.cfi_endproc
.LFE12:
	.size	attacker_function, .-attacker_function
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

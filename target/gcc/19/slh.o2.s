	.file	"19.c"
	.text
	.p2align 4
	.type	victim_function_v19.part.0, @function
victim_function_v19.part.0:
.LFB13:
	.cfi_startproc
	movzbl	array1(%rdi), %eax
	sall	$9, %eax
	cltq
	movzbl	array2(%rax), %eax
	andb	%al, temp(%rip)
	ret
	.cfi_endproc
.LFE13:
	.size	victim_function_v19.part.0, .-victim_function_v19.part.0
	.p2align 4
	.globl	victim_function_v19
	.type	victim_function_v19, @function
victim_function_v19:
.LFB11:
	.cfi_startproc
	movl	array1_size(%rip), %eax
	cmpq	%rax, %rdi
	sbbq	%rax, %rax
	testq	%rax, %rax
	je	.L6
	jmp	victim_function_v19.part.0
	.p2align 4,,10
	.p2align 3
.L6:
	ret
	.cfi_endproc
.LFE11:
	.size	victim_function_v19, .-victim_function_v19
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	cmpl	$1, array1_size(%rip)
	sbbq	%rax, %rax
	testq	%rax, %rax
	jne	.L9
	xorl	%edi, %edi
	call	victim_function_v19.part.0
	cmpl	$43, array1_size(%rip)
	sbbq	%rax, %rax
	testq	%rax, %rax
	jne	.L9
	movl	$42, %edi
	call	victim_function_v19.part.0
.L9:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
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

	.file	"21.c"
	.text
	.p2align 4
	.globl	victim_function_v21
	.type	victim_function_v21, @function
victim_function_v21:
.LFB11:
	.cfi_startproc
	movl	array1_size(%rip), %ecx
	cmpq	%rcx, %rdi
	sbbq	%rax, %rax
	testq	%rax, %rax
	je	.L1
	andq	%rax, %rdi
	movzbl	array1(%rdi), %esi
	movq	%rsi, %rdx
	andb	temp(%rip), %dl
	cmpq	%rcx, %rsi
	sbbq	%rcx, %rcx
	movb	%dl, temp(%rip)
	testq	%rcx, %rcx
	je	.L1
	andq	%rcx, %rax
	andq	%rsi, %rax
	andb	array1(%rax), %dl
	movb	%dl, temp(%rip)
.L1:
	ret
	.cfi_endproc
.LFE11:
	.size	victim_function_v21, .-victim_function_v21
	.globl	temp
	.bss
	.type	temp, @object
	.size	temp, 1
temp:
	.zero	1
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

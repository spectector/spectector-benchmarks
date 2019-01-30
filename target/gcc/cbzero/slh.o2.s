	.file	"cbzero.c"
	.text
	.p2align 4
	.globl	cbzero
	.type	cbzero, @function
cbzero:
.LFB11:
	.cfi_startproc
	cmpq	$1, %rsi
	sbbq	%rax, %rax
	addq	%rdi, %rsi
	testq	%rax, %rax
	jne	.L1
	.p2align 4,,10
	.p2align 3
.L5:
	addq	$1, %rdi
	movb	$0, -1(%rdi)
	cmpq	%rsi, %rdi
	jne	.L5
.L1:
	ret
	.cfi_endproc
.LFE11:
	.size	cbzero, .-cbzero
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

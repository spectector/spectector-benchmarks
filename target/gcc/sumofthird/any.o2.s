	.file	"sumofthird.c"
	.text
	.p2align 4
	.globl	sumOfThirdBytes
	.type	sumOfThirdBytes, @function
sumOfThirdBytes:
.LFB0:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L4
	leal	-1(%rsi), %eax
	leaq	2(%rdi), %rdx
	leaq	6(%rdi,%rax,4), %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movsbl	(%rdx), %ecx
	addq	$4, %rdx
	addl	%ecx, %eax
	cmpq	%rsi, %rdx
	jne	.L3
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	sumOfThirdBytes, .-sumOfThirdBytes
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

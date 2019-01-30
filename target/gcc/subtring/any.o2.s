	.file	"subtring.c"
	.text
	.p2align 4
	.globl	substring
	.type	substring, @function
substring:
.LFB0:
	.cfi_startproc
	cmpb	$0, (%rdi)
	je	.L12
	movzbl	(%rsi), %ecx
	.p2align 4,,10
	.p2align 3
.L7:
	testb	%cl, %cl
	je	.L8
	movl	%ecx, %edx
	xorl	%eax, %eax
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	addq	$1, %rax
	movzbl	(%rsi,%rax), %edx
	testb	%dl, %dl
	je	.L8
.L6:
	cmpb	%dl, (%rdi,%rax)
	je	.L4
	addq	$1, %rdi
	cmpb	$0, (%rdi)
	jne	.L7
.L12:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	substring, .-substring
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

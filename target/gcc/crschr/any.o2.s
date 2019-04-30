	.file	"crschr.c"
	.text
	.p2align 4
	.globl	cstrchr
	.type	cstrchr, @function
cstrchr:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L7
	movl	%esi, %edx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L4:
	movzbl	1(%rdi), %eax
	addq	$1, %rdi
	testb	%al, %al
	je	.L7
.L3:
	cmpb	%al, %dl
	jne	.L4
	movsbl	%sil, %eax
	cmpl	%eax, %esi
	movl	$0, %eax
	cmove	%rdi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	xorl	%eax, %eax
	cmpl	%eax, %esi
	movl	$0, %eax
	cmove	%rdi, %rax
	ret
	.cfi_endproc
.LFE0:
	.size	cstrchr, .-cstrchr
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

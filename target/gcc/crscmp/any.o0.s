	.file	"crscmp.c"
	.text
	.globl	cstrcmp
	.type	cstrcmp, @function
cstrcmp:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	jmp	.L2
.L4:
	addq	$1, -24(%rbp)
	addq	$1, -32(%rbp)
.L2:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L3
	movq	-24(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	.L4
.L3:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -1(%rbp)
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	-1(%rbp), %eax
	cmpb	-2(%rbp), %al
	jb	.L5
	movzbl	-1(%rbp), %eax
	cmpb	-2(%rbp), %al
	seta	%al
	movzbl	%al, %eax
	jmp	.L7
.L5:
	movl	$-1, %eax
.L7:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	cstrcmp, .-cstrcmp
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

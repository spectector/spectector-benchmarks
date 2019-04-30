	.file	"cstrcspn.c"
	.text
	.p2align 4
	.globl	cstrcspn
	.type	cstrcspn, @function
cstrcspn:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %r10d
	cmpb	$1, %r10b
	sbbq	%rdx, %rdx
	xorq	$-1, %rdx
	je	.L2
	movq	%rsi, %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	andq	%rdx, %rax
	movzbl	(%rax), %ebx
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$1, %bl
	movq	%rdx, %rcx
	movq	%rsi, %r9
	movl	%ebx, %r8d
	sbbq	%r11, %r11
	notq	%r11
	andq	%r11, %rcx
	testq	%r11, %r11
	jne	.L11
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L5:
	addq	$1, %r9
	andq	%rcx, %rdx
	movq	%r9, %rcx
	andq	%rdx, %rcx
	movzbl	(%rcx), %r8d
	cmpb	$1, %r8b
	sbbq	%rcx, %rcx
	xorq	$-1, %rcx
	je	.L10
	andq	%rdx, %rcx
.L11:
	xorl	%edx, %edx
	cmpb	%r10b, %r8b
	sete	%dl
	subq	$1, %rdx
	jne	.L5
.L17:
	subl	%edi, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore_state
	addq	$1, %rax
	movq	%rax, %rcx
	andq	%rdx, %rcx
	movzbl	(%rcx), %r10d
	cmpb	$1, %r10b
	sbbq	%rcx, %rcx
	xorq	$-1, %rcx
	je	.L17
	andq	%rcx, %rdx
	jmp	.L3
.L2:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	cstrcspn, .-cstrcspn
	.ident	"GCC: (GNU) 9.0.0 20181220 (experimental)"
	.section	.note.GNU-stack,"",@progbits

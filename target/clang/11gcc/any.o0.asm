	.text
	.intel_syntax noprefix
	.file	"11gcc.c"
	.globl	victim_function_v11     # -- Begin function victim_function_v11
	.p2align	4, 0x90
	.type	victim_function_v11,@function
victim_function_v11:                    # @victim_function_v11
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	mov	ecx, dword ptr [array1_size]
	cmp	rax, rcx
	jae	.LBB0_2
# %bb.1:
	mov	rax, qword ptr [rbp - 8]
	movzx	eax, byte ptr [rax + array1]
	shl	eax, 9
	cdqe
	movabs	rsi, offset array2
	add	rsi, rax
	movabs	rdi, offset temp
	mov	edx, 1
	call	mymemcmp
	mov	byte ptr [temp], al
.LBB0_2:
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	victim_function_v11, .Lfunc_end0-victim_function_v11
	.cfi_endproc
                                        # -- End function
	.globl	mymemcmp                # -- Begin function mymemcmp
	.p2align	4, 0x90
	.type	mymemcmp,@function
mymemcmp:                               # @mymemcmp
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 48], rdi
	mov	qword ptr [rbp - 40], rsi
	mov	qword ptr [rbp - 32], rdx
	mov	rax, qword ptr [rbp - 48]
	mov	qword ptr [rbp - 24], rax
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 16], rax
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 32]
	mov	rcx, rax
	add	rcx, -1
	mov	qword ptr [rbp - 32], rcx
	cmp	rax, 0
	jbe	.LBB1_5
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	mov	rax, qword ptr [rbp - 24]
	mov	rcx, rax
	add	rcx, 1
	mov	qword ptr [rbp - 24], rcx
	movzx	eax, byte ptr [rax]
	mov	rcx, qword ptr [rbp - 16]
	mov	rdx, rcx
	add	rdx, 1
	mov	qword ptr [rbp - 16], rdx
	movzx	ecx, byte ptr [rcx]
	cmp	eax, ecx
	je	.LBB1_4
# %bb.3:
	mov	rax, qword ptr [rbp - 24]
	movzx	eax, byte ptr [rax - 1]
	mov	rcx, qword ptr [rbp - 16]
	movzx	ecx, byte ptr [rcx - 1]
	cmp	eax, ecx
	mov	eax, 4294967295
	mov	ecx, 1
	cmovl	ecx, eax
	mov	dword ptr [rbp - 4], ecx
	jmp	.LBB1_6
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_1
.LBB1_5:
	mov	dword ptr [rbp - 4], 0
.LBB1_6:
	mov	eax, dword ptr [rbp - 4]
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	mymemcmp, .Lfunc_end1-mymemcmp
	.cfi_endproc
                                        # -- End function
	.type	array1_size,@object     # @array1_size
	.data
	.globl	array1_size
	.p2align	2
array1_size:
	.long	16                      # 0x10
	.size	array1_size, 4

	.type	array1,@object          # @array1
	.globl	array1
	.p2align	4
array1:
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017\020"
	.size	array1, 16

	.type	temp,@object            # @temp
	.bss
	.globl	temp
temp:
	.byte	0                       # 0x0
	.size	temp, 1

	.type	array2,@object          # @array2
	.comm	array2,131072,16

	.ident	"clang version 7.0.0 (tags/RELEASE_700/final)"
	.section	".note.GNU-stack","",@progbits

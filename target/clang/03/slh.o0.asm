	.text
	.intel_syntax noprefix
	.file	"03.c"
	.globl	leakByteNoinlineFunction # -- Begin function leakByteNoinlineFunction
	.p2align	4, 0x90
	.type	leakByteNoinlineFunction,@function
leakByteNoinlineFunction:               # @leakByteNoinlineFunction
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	rax, -1
	mov	rax, rsp
	sar	rax, 63
	mov	byte ptr [rbp - 1], dil
	movzx	ecx, byte ptr [rbp - 1]
	shl	ecx, 9
	movsxd	rcx, ecx
	movzx	ecx, byte ptr [rcx + array2]
	mov	edx, eax
	or	edx, ecx
	movzx	ecx, byte ptr [temp]
	and	ecx, edx
	mov	byte ptr [temp], cl
	shl	rax, 47
	or	rsp, rax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	leakByteNoinlineFunction, .Lfunc_end0-leakByteNoinlineFunction
	.cfi_endproc
                                        # -- End function
	.globl	victim_function_v03     # -- Begin function victim_function_v03
	.p2align	4, 0x90
	.type	victim_function_v03,@function
victim_function_v03:                    # @victim_function_v03
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	rcx, -1
	mov	rax, rsp
	sar	rax, 63
	mov	qword ptr [rbp - 8], rdi
	mov	rdx, qword ptr [rbp - 8]
	mov	esi, dword ptr [array1_size]
	cmp	rdx, rsi
	jae	.LBB1_1
	jmp	.LBB1_2
.LBB1_1:
	cmovb	rax, rcx
	jmp	.LBB1_3
.LBB1_2:
	cmovae	rax, rcx
	mov	rcx, qword ptr [rbp - 8]
	movzx	ecx, byte ptr [rcx + array1]
	mov	edi, eax
	or	edi, ecx
	shl	rax, 47
	or	rsp, rax
	call	leakByteNoinlineFunction
	mov	rax, rsp
	sar	rax, 63
.LBB1_3:
	shl	rax, 47
	or	rsp, rax
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	victim_function_v03, .Lfunc_end1-victim_function_v03
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

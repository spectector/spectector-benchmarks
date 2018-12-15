	.text
	.intel_syntax noprefix
	.file	"01.c"
	.globl	victim_function_v01     # -- Begin function victim_function_v01
	.p2align	4, 0x90
	.type	victim_function_v01,@function
victim_function_v01:                    # @victim_function_v01
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	rcx, -1
	mov	rax, rsp
	sar	rax, 63
	mov	qword ptr [rbp - 8], rdi
	mov	rdx, qword ptr [rbp - 8]
	mov	esi, dword ptr [array1_size]
	cmp	rdx, rsi
	jae	.LBB0_1
	jmp	.LBB0_2
.LBB0_1:
	cmovb	rax, rcx
	jmp	.LBB0_3
.LBB0_2:
	cmovae	rax, rcx
	mov	rcx, qword ptr [rbp - 8]
	movzx	ecx, byte ptr [rcx + array1]
	mov	edx, eax
	or	edx, ecx
	shl	edx, 9
	movsxd	rcx, edx
	movzx	ecx, byte ptr [rcx + array2]
	mov	edx, eax
	or	edx, ecx
	movzx	ecx, byte ptr [temp]
	and	ecx, edx
	mov	byte ptr [temp], cl
.LBB0_3:
	shl	rax, 47
	or	rsp, rax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	victim_function_v01, .Lfunc_end0-victim_function_v01
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

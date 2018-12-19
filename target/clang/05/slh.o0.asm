	.text
	.intel_syntax noprefix
	.file	"05.c"
	.globl	victim_function_v05     # -- Begin function victim_function_v05
	.p2align	4, 0x90
	.type	victim_function_v05,@function
victim_function_v05:                    # @victim_function_v05
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
	mov	qword ptr [rbp - 16], rdi
	mov	rdx, qword ptr [rbp - 16]
	mov	esi, dword ptr [array1_size]
	cmp	rdx, rsi
	jae	.LBB0_1
	jmp	.LBB0_2
.LBB0_1:
	cmovb	rax, rcx
	jmp	.LBB0_7
.LBB0_2:
	cmovae	rax, rcx
	mov	rdx, qword ptr [rbp - 16]
	sub	rdx, 1
	mov	dword ptr [rbp - 4], edx
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rbp - 4], 0
	jl	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	cmovl	rax, rcx
	movsxd	rdx, dword ptr [rbp - 4]
	movzx	edx, byte ptr [rdx + array1]
	mov	esi, eax
	or	esi, edx
	shl	esi, 9
	movsxd	rdx, esi
	movzx	edx, byte ptr [rdx + array2]
	mov	esi, eax
	or	esi, edx
	movzx	edx, byte ptr [temp]
	and	edx, esi
	mov	byte ptr [temp], dl
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	mov	edx, dword ptr [rbp - 4]
	add	edx, -1
	mov	dword ptr [rbp - 4], edx
	jmp	.LBB0_3
.LBB0_6:
	cmovge	rax, rcx
	jmp	.LBB0_7
.LBB0_7:
	shl	rax, 47
	or	rsp, rax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	victim_function_v05, .Lfunc_end0-victim_function_v05
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

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

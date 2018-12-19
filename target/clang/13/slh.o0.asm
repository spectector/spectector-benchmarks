	.text
	.intel_syntax noprefix
	.file	"13.c"
	.globl	is_x_safe               # -- Begin function is_x_safe
	.p2align	4, 0x90
	.type	is_x_safe,@function
is_x_safe:                              # @is_x_safe
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	rcx, rsp
	mov	rax, -1
	sar	rcx, 63
	mov	qword ptr [rbp - 16], rdi
	mov	edx, dword ptr [rip + array1_size]
	cmp	rdi, rdx
	jae	.LBB0_2
# %bb.1:
	cmovae	rcx, rax
	mov	dword ptr [rbp - 4], 1
	jmp	.LBB0_3
.LBB0_2:
	cmovb	rcx, rax
	mov	dword ptr [rbp - 4], 0
.LBB0_3:
	mov	eax, dword ptr [rbp - 4]
	shl	rcx, 47
	or	rsp, rcx
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	is_x_safe, .Lfunc_end0-is_x_safe
	.cfi_endproc
                                        # -- End function
	.globl	victim_function_v13     # -- Begin function victim_function_v13
	.p2align	4, 0x90
	.type	victim_function_v13,@function
victim_function_v13:                    # @victim_function_v13
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
	mov	qword ptr [rbp - 24], rdx
	mov	rdx, qword ptr [rbp - 24]
	mov	esi, dword ptr [array1_size]
	cmp	rdx, rsi
	jae	.LBB1_2
# %bb.1:
	cmovae	rax, rcx
	mov	dword ptr [rbp - 4], 1
	jmp	.LBB1_3
.LBB1_2:
	cmovb	rax, rcx
	mov	dword ptr [rbp - 4], 0
.LBB1_3:
	cmp	dword ptr [rbp - 4], 0
	je	.LBB1_4
	jmp	.LBB1_5
.LBB1_4:
	cmovne	rax, rcx
	jmp	.LBB1_6
.LBB1_5:
	cmove	rax, rcx
	mov	rcx, qword ptr [rbp - 16]
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
.LBB1_6:
	shl	rax, 47
	or	rsp, rax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	victim_function_v13, .Lfunc_end1-victim_function_v13
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

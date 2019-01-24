	.text
	.intel_syntax noprefix
	.file	"20.c"
	.globl	victim_function_v20     # -- Begin function victim_function_v20
	.p2align	4, 0x90
	.type	victim_function_v20,@function
victim_function_v20:                    # @victim_function_v20
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	rsi, -1
	mov	rax, rsp
	sar	rax, 63
	mov	qword ptr [rbp - 16], rdi
	mov	rdx, qword ptr [rbp - 16]
	mov	dl, byte ptr [rdx + array1]
	mov	cl, al
	or	cl, dl
	mov	byte ptr [rbp - 1], cl
	mov	rcx, qword ptr [rbp - 16]
	mov	edx, dword ptr [array1_size]
	cmp	rcx, rdx
	jae	.LBB0_2
# %bb.1:
	cmovae	rax, rsi
	movzx	ecx, byte ptr [rbp - 1]
	shl	ecx, 9
	movsxd	rcx, ecx
	movzx	ecx, byte ptr [rcx + array2]
	mov	edx, eax
	or	edx, ecx
	movzx	ecx, byte ptr [temp]
	and	ecx, edx
	mov	byte ptr [temp], cl
	jmp	.LBB0_3
.LBB0_2:
	cmovb	rax, rsi
	mov	byte ptr [rbp - 1], 0
.LBB0_3:
	shl	rax, 47
	or	rsp, rax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	victim_function_v20, .Lfunc_end0-victim_function_v20
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

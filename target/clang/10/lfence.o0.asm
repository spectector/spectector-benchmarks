	.text
	.intel_syntax noprefix
	.file	"10.c"
	.globl	victim_function_v10     # -- Begin function victim_function_v10
	.p2align	4, 0x90
	.type	victim_function_v10,@function
victim_function_v10:                    # @victim_function_v10
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 16], rdi
	mov	byte ptr [rbp - 1], sil
	mov	rax, qword ptr [rbp - 16]
	mov	ecx, dword ptr [array1_size]
	cmp	rax, rcx
	jae	.LBB0_4
# %bb.1:
	lfence
	mov	rax, qword ptr [rbp - 16]
	movzx	eax, byte ptr [rax + array1]
	movzx	ecx, byte ptr [rbp - 1]
	cmp	eax, ecx
	jne	.LBB0_3
# %bb.2:
	lfence
	movzx	eax, byte ptr [array2]
	movzx	ecx, byte ptr [temp]
	and	ecx, eax
	mov	byte ptr [temp], cl
.LBB0_3:
	lfence
	jmp	.LBB0_4
.LBB0_4:
	lfence
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	victim_function_v10, .Lfunc_end0-victim_function_v10
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

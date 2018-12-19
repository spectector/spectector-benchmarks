	.text
	.intel_syntax noprefix
	.file	"06.c"
	.globl	victim_function_v06     # -- Begin function victim_function_v06
	.p2align	4, 0x90
	.type	victim_function_v06,@function
victim_function_v06:                    # @victim_function_v06
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	movzx	ecx, byte ptr [array_size_mask]
	and	rax, rcx
	cmp	rax, qword ptr [rbp - 8]
	jne	.LBB0_2
# %bb.1:
	mov	rax, qword ptr [rbp - 8]
	movzx	eax, byte ptr [rax + array1]
	shl	eax, 9
	cdqe
	movzx	eax, byte ptr [rax + array2]
	movzx	ecx, byte ptr [temp]
	and	ecx, eax
	mov	byte ptr [temp], cl
.LBB0_2:
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	victim_function_v06, .Lfunc_end0-victim_function_v06
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

	.type	array_size_mask,@object # @array_size_mask
	.data
	.globl	array_size_mask
array_size_mask:
	.byte	15                      # 0xf
	.size	array_size_mask, 1

	.type	array2,@object          # @array2
	.comm	array2,131072,16

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

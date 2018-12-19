	.text
	.intel_syntax noprefix
	.file	"05-no-unsigned.c"
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
	mov	qword ptr [rbp - 16], rdi
	cmp	qword ptr [rbp - 16], 0
	jl	.LBB0_7
# %bb.1:
	lfence
	mov	rax, qword ptr [rbp - 16]
	mov	ecx, dword ptr [array1_size]
	cmp	rax, rcx
	jge	.LBB0_7
# %bb.2:
	lfence
	mov	rax, qword ptr [rbp - 16]
	sub	rax, 1
	mov	dword ptr [rbp - 4], eax
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rbp - 4], 0
	jl	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	lfence
	movsxd	rax, dword ptr [rbp - 4]
	movzx	eax, byte ptr [rax + array1]
	shl	eax, 9
	cdqe
	movzx	eax, byte ptr [rax + array2]
	movzx	ecx, byte ptr [temp]
	and	ecx, eax
	mov	byte ptr [temp], cl
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	mov	eax, dword ptr [rbp - 4]
	add	eax, -1
	mov	dword ptr [rbp - 4], eax
	jmp	.LBB0_3
.LBB0_6:
	lfence
	jmp	.LBB0_7
.LBB0_7:
	lfence
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

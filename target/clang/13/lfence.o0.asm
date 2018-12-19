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
	mov	qword ptr [rbp - 16], rdi
	mov	eax, dword ptr [rip + array1_size]
	cmp	rdi, rax
	jae	.LBB0_2
# %bb.1:
	lfence
	mov	dword ptr [rbp - 4], 1
	jmp	.LBB0_3
.LBB0_2:
	lfence
	mov	dword ptr [rbp - 4], 0
.LBB0_3:
	mov	eax, dword ptr [rbp - 4]
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
	mov	qword ptr [rbp - 16], rdi
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 24], rax
	mov	rax, qword ptr [rbp - 24]
	mov	ecx, dword ptr [array1_size]
	cmp	rax, rcx
	jae	.LBB1_2
# %bb.1:
	lfence
	mov	dword ptr [rbp - 4], 1
	jmp	.LBB1_3
.LBB1_2:
	lfence
	mov	dword ptr [rbp - 4], 0
.LBB1_3:
	cmp	dword ptr [rbp - 4], 0
	je	.LBB1_5
# %bb.4:
	lfence
	mov	rax, qword ptr [rbp - 16]
	movzx	eax, byte ptr [rax + array1]
	shl	eax, 9
	cdqe
	movzx	eax, byte ptr [rax + array2]
	movzx	ecx, byte ptr [temp]
	and	ecx, eax
	mov	byte ptr [temp], cl
.LBB1_5:
	lfence
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

	.text
	.intel_syntax noprefix
	.file	"15.c"
	.globl	victim_function_v15     # -- Begin function victim_function_v15
	.p2align	4, 0x90
	.type	victim_function_v15,@function
victim_function_v15:                    # @victim_function_v15
	.cfi_startproc
# %bb.0:
	mov	rax, rsp
	mov	rcx, -1
	sar	rax, 63
	mov	rdx, qword ptr [rdi]
	or	rdx, rax
	mov	esi, dword ptr [rip + array1_size]
	cmp	rdx, rsi
	jae	.LBB0_1
# %bb.2:
	cmovae	rax, rcx
	movzx	ecx, byte ptr [rdx + array1]
	shl	rcx, 9
	or	rcx, rax
	mov	cl, byte ptr [rcx + array2]
	or	cl, al
	and	byte ptr [rip + temp], cl
	jmp	.LBB0_3
.LBB0_1:
	cmovb	rax, rcx
.LBB0_3:
	shl	rax, 47
	or	rsp, rax
	ret
.Lfunc_end0:
	.size	victim_function_v15, .Lfunc_end0-victim_function_v15
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

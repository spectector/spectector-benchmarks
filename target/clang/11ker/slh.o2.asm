	.text
	.intel_syntax noprefix
	.file	"11ker.c"
	.globl	victim_function_v11     # -- Begin function victim_function_v11
	.p2align	4, 0x90
	.type	victim_function_v11,@function
victim_function_v11:                    # @victim_function_v11
	.cfi_startproc
# %bb.0:
	mov	rax, rsp
	mov	rcx, -1
	sar	rax, 63
	mov	edx, dword ptr [rip + array1_size]
	cmp	rdx, rdi
	jbe	.LBB0_1
# %bb.2:
	cmovbe	rax, rcx
	movzx	ecx, byte ptr [rdi + array1]
	shl	rcx, 9
	or	rcx, rax
	mov	cl, byte ptr [rcx + array2]
	or	cl, al
	sub	byte ptr [rip + temp], cl
	jmp	.LBB0_3
.LBB0_1:
	cmova	rax, rcx
.LBB0_3:
	shl	rax, 47
	or	rsp, rax
	ret
.Lfunc_end0:
	.size	victim_function_v11, .Lfunc_end0-victim_function_v11
	.cfi_endproc
                                        # -- End function
	.globl	mymemcmp                # -- Begin function mymemcmp
	.p2align	4, 0x90
	.type	mymemcmp,@function
mymemcmp:                               # @mymemcmp
	.cfi_startproc
# %bb.0:
	mov	r9, rsp
	mov	r8, -1
	sar	r9, 63
	test	rdx, rdx
	je	.LBB1_6
# %bb.1:                                # %.preheader
	cmove	r9, r8
	xor	r10d, r10d
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_5:                                #   in Loop: Header=BB1_2 Depth=1
	cmove	r9, r8
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	movzx	eax, byte ptr [rdi + r10]
	or	eax, r9d
	movzx	ecx, byte ptr [rsi + r10]
	or	ecx, r9d
	sub	eax, ecx
	jne	.LBB1_3
# %bb.4:                                #   in Loop: Header=BB1_2 Depth=1
	cmovne	r9, r8
	add	r10, 1
	cmp	rdx, r10
	jne	.LBB1_5
.LBB1_6:
	cmovne	r9, r8
	xor	eax, eax
	jmp	.LBB1_7
.LBB1_3:
	cmove	r9, r8
.LBB1_7:
	shl	r9, 47
	or	rsp, r9
	ret
.Lfunc_end1:
	.size	mymemcmp, .Lfunc_end1-mymemcmp
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

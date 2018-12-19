	.text
	.intel_syntax noprefix
	.file	"11gcc.c"
	.globl	victim_function_v11     # -- Begin function victim_function_v11
	.p2align	4, 0x90
	.type	victim_function_v11,@function
victim_function_v11:                    # @victim_function_v11
	.cfi_startproc
# %bb.0:
	mov	rax, rsp
	mov	rsi, -1
	sar	rax, 63
	mov	edx, dword ptr [rip + array1_size]
	cmp	rdx, rdi
	jbe	.LBB0_1
# %bb.2:
	cmovbe	rax, rsi
	movzx	edx, byte ptr [rdi + array1]
	shl	rdx, 9
	or	rdx, rax
	mov	dil, byte ptr [rip + temp]
	mov	cl, byte ptr [rdx + array2]
	or	cl, al
	cmp	dil, cl
	setae	dl
	cmp	dil, cl
	je	.LBB0_3
# %bb.4:
	cmove	rax, rsi
	add	dl, dl
	add	dl, -1
	jmp	.LBB0_5
.LBB0_1:
	cmova	rax, rsi
	jmp	.LBB0_6
.LBB0_3:
	cmovne	rax, rsi
	xor	edx, edx
.LBB0_5:
	mov	byte ptr [rip + temp], dl
.LBB0_6:
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
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset rbx, -16
	mov	r9, rsp
	mov	r8, -1
	sar	r9, 63
	xor	eax, eax
	xor	ecx, ecx
	cmp	rdx, rcx
	jne	.LBB1_3
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_4:                                #   in Loop: Header=BB1_3 Depth=1
	cmovne	r9, r8
	cmp	rdx, rcx
	je	.LBB1_2
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	cmove	r9, r8
	movzx	r10d, byte ptr [rsi + rcx]
	or	r10b, r9b
	mov	r11, r9
	or	r11, rdi
	mov	rbx, r9
	or	rbx, rcx
	add	rcx, 1
	cmp	byte ptr [r11 + rbx], r10b
	je	.LBB1_4
# %bb.5:
	cmove	r9, r8
	setae	al
	movzx	eax, al
	lea	eax, [rax + rax]
	add	eax, -1
	jmp	.LBB1_6
.LBB1_2:
	cmovne	r9, r8
.LBB1_6:
	shl	r9, 47
                                        # kill: def $eax killed $eax killed $rax
	or	rsp, r9
	pop	rbx
	.cfi_def_cfa_offset 8
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

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits

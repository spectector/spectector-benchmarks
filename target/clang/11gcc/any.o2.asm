	.text
	.intel_syntax noprefix
	.file	"11gcc.c"
	.globl	victim_function_v11     # -- Begin function victim_function_v11
	.p2align	4, 0x90
	.type	victim_function_v11,@function
victim_function_v11:                    # @victim_function_v11
	.cfi_startproc
# %bb.0:
	mov	eax, dword ptr [rip + array1_size]
	cmp	rax, rdi
	jbe	.LBB0_5
# %bb.1:
	movzx	eax, byte ptr [rdi + array1]
	shl	rax, 9
	mov	cl, byte ptr [rip + temp]
	mov	dl, byte ptr [rax + array2]
	cmp	cl, dl
	setae	al
	cmp	cl, dl
	je	.LBB0_2
# %bb.3:
	add	al, al
	add	al, -1
	jmp	.LBB0_4
.LBB0_2:
	xor	eax, eax
.LBB0_4:
	mov	byte ptr [rip + temp], al
.LBB0_5:
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
	xor	eax, eax
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	cmp	rdx, r8
	je	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movzx	ecx, byte ptr [rsi + r8]
	cmp	byte ptr [rdi + r8], cl
	lea	r8, [r8 + 1]
	je	.LBB1_1
# %bb.3:
	setae	al
	movzx	eax, al
	lea	eax, [rax + rax]
	add	eax, -1
.LBB1_4:
                                        # kill: def $eax killed $eax killed $rax
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

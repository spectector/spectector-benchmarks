	.text
	.intel_syntax noprefix
	.file	"05.c"
	.globl	victim_function_v05     # -- Begin function victim_function_v05
	.p2align	4, 0x90
	.type	victim_function_v05,@function
victim_function_v05:                    # @victim_function_v05
	.cfi_startproc
# %bb.0:
	mov	eax, dword ptr [rip + array1_size]
	cmp	rax, rdi
	jbe	.LBB0_11
# %bb.1:
	mov	r8d, edi
	add	r8d, -1
	js	.LBB0_11
# %bb.2:
	mov	al, byte ptr [rip + temp]
	movsxd	rsi, r8d
	test	dil, 3
	je	.LBB0_3
# %bb.4:                                # %.preheader1
	and	edi, 3
	xor	ecx, ecx
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movzx	edx, byte ptr [rsi + array1]
	shl	rdx, 9
	and	al, byte ptr [rdx + array2]
	add	rsi, -1
	add	rcx, 1
	cmp	edi, ecx
	jne	.LBB0_5
# %bb.6:                                # %.loopexit2
	mov	edx, r8d
	sub	edx, ecx
	cmp	r8d, 3
	jae	.LBB0_8
	jmp	.LBB0_10
.LBB0_3:
	mov	edx, r8d
	cmp	r8d, 3
	jb	.LBB0_10
.LBB0_8:                                # %.preheader
	lea	rcx, [rsi + array1]
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	movzx	esi, byte ptr [rcx]
	shl	rsi, 9
	and	al, byte ptr [rsi + array2]
	movzx	esi, byte ptr [rcx - 1]
	shl	rsi, 9
	and	al, byte ptr [rsi + array2]
	movzx	esi, byte ptr [rcx - 2]
	shl	rsi, 9
	and	al, byte ptr [rsi + array2]
	movzx	esi, byte ptr [rcx - 3]
	shl	rsi, 9
	add	rcx, -4
	and	al, byte ptr [rsi + array2]
	add	edx, -4
	jns	.LBB0_9
.LBB0_10:
	mov	byte ptr [rip + temp], al
.LBB0_11:
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

	.text
	.intel_syntax noprefix
	.file	"19.c"
	.globl	victim_function_v19     # -- Begin function victim_function_v19
	.p2align	4, 0x90
	.type	victim_function_v19,@function
victim_function_v19:                    # @victim_function_v19
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
	and	byte ptr [rip + temp], cl
	jmp	.LBB0_3
.LBB0_1:
	cmova	rax, rcx
.LBB0_3:
	shl	rax, 47
	or	rsp, rax
	ret
.Lfunc_end0:
	.size	victim_function_v19, .Lfunc_end0-victim_function_v19
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	mov	rcx, rsp
	mov	rax, -1
	sar	rcx, 63
	mov	esi, dword ptr [rip + array1_size]
	test	esi, esi
	je	.LBB1_1
# %bb.2:
	cmove	rcx, rax
	movzx	edi, byte ptr [rip + array1]
	shl	rdi, 9
	mov	dl, byte ptr [rip + temp]
	and	dl, byte ptr [rdi + array2]
	or	dl, cl
	mov	byte ptr [rip + temp], dl
	cmp	esi, 43
	jb	.LBB1_3
# %bb.4:
	cmovb	rcx, rax
	movzx	eax, byte ptr [rip + array1+42]
	shl	rax, 9
	and	dl, byte ptr [rax + array2]
	or	dl, cl
	mov	byte ptr [rip + temp], dl
	jmp	.LBB1_5
.LBB1_1:
	cmovne	rcx, rax
	jmp	.LBB1_5
.LBB1_3:
	cmovae	rcx, rax
.LBB1_5:
	xor	eax, eax
	shl	rcx, 47
	or	rsp, rcx
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
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

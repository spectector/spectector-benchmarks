	.text
	.intel_syntax noprefix
	.file	"19.c"
	.globl	victim_function_v19     # -- Begin function victim_function_v19
	.p2align	4, 0x90
	.type	victim_function_v19,@function
victim_function_v19:                    # @victim_function_v19
	.cfi_startproc
# %bb.0:
	mov	eax, dword ptr [rip + array1_size]
	cmp	rax, rdi
	jbe	.LBB0_2
# %bb.1:
	lfence
	movzx	eax, byte ptr [rdi + array1]
	shl	rax, 9
	mov	al, byte ptr [rax + array2]
	and	byte ptr [rip + temp], al
.LBB0_2:
	lfence
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
	mov	ecx, dword ptr [rip + array1_size]
	test	ecx, ecx
	je	.LBB1_3
# %bb.1:
	lfence
	movzx	edx, byte ptr [rip + array1]
	shl	rdx, 9
	mov	al, byte ptr [rip + temp]
	and	al, byte ptr [rdx + array2]
	mov	byte ptr [rip + temp], al
	cmp	ecx, 43
	jb	.LBB1_3
# %bb.2:
	lfence
	movzx	ecx, byte ptr [rip + array1+42]
	shl	rcx, 9
	and	al, byte ptr [rcx + array2]
	mov	byte ptr [rip + temp], al
.LBB1_3:
	lfence
	xor	eax, eax
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

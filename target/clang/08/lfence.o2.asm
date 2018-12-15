	.text
	.intel_syntax noprefix
	.file	"08.c"
	.globl	victim_function_v08     # -- Begin function victim_function_v08
	.p2align	4, 0x90
	.type	victim_function_v08,@function
victim_function_v08:                    # @victim_function_v08
	.cfi_startproc
# %bb.0:
	mov	eax, dword ptr [rip + array1_size]
	xor	ecx, ecx
	cmp	rax, rdi
	lea	rax, [rdi + 1]
	cmova	rcx, rax
	movzx	eax, byte ptr [rcx + array1]
	shl	rax, 9
	mov	al, byte ptr [rax + array2]
	and	byte ptr [rip + temp], al
	ret
.Lfunc_end0:
	.size	victim_function_v08, .Lfunc_end0-victim_function_v08
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

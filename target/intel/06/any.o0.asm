# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O0 -S -c -o ../target/intel/06/any.o0.asm";
	.intel_syntax noprefix
	.file "06.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v06_0:
# -- Begin  victim_function_v06
	.text
# mark_begin;

	.globl victim_function_v06
# --- victim_function_v06(size_t)
victim_function_v06:
# parameter 1: rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v06.1:
..L2:
                                                          #11.36
        push      rbp                                           #11.36
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #11.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #11.36
        mov       QWORD PTR [-16+rbp], rdi                      #11.36
        movzx     eax, BYTE PTR array_size_mask[rip]            #12.15
        movzx     eax, al                                       #12.15
        and       rax, QWORD PTR [-16+rbp]                      #12.15
        mov       rdx, QWORD PTR [-16+rbp]                      #12.35
        cmp       rax, rdx                                      #12.35
        jne       ..B1.3        # Prob 50%                      #12.35
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movzx     eax, BYTE PTR temp[rip]                       #13.11
        movzx     eax, al                                       #13.11
        mov       edx, offset flat: array1                      #13.26
        add       rdx, QWORD PTR [-16+rbp]                      #13.26
        movzx     edx, BYTE PTR [rdx]                           #13.26
        movzx     edx, dl                                       #13.26
        imul      edx, edx, 512                                 #13.38
        movsxd    rdx, edx                                      #13.19
        mov       ecx, offset flat: array2                      #13.19
        add       rcx, rdx                                      #13.19
        movzx     edx, BYTE PTR [rcx]                           #13.19
        movzx     edx, dl                                       #13.19
        and       eax, edx                                      #13.11
        mov       BYTE PTR temp[rip], al                        #13.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2 ..B1.1
                                # Execution count [0.00e+00]
        leave                                                   #14.1
	.cfi_restore 6
        ret                                                     #14.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v06,@function
	.size	victim_function_v06,.-victim_function_v06
..LNvictim_function_v06.0:
	.data
# -- End  victim_function_v06
	.bss
	.align 4
	.align 1
	.globl temp
temp:
	.type	temp,@object
	.size	temp,1
	.space 1	# pad
	.data
	.align 4
	.align 4
	.globl array1_size
array1_size:
	.long	16
	.type	array1_size,@object
	.size	array1_size,4
	.align 1
	.globl array1
array1:
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.type	array1,@object
	.size	array1,16
	.align 1
	.globl array_size_mask
array_size_mask:
	.byte	15
	.type	array_size_mask,@object
	.size	array_size_mask,1
	.data
	.comm array2,131072,32
	.section .note.GNU-stack, ""
# End

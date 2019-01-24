# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O0 -mconditional-branch=all-fix -S -c -o ../target/intel/17/lfence.o0.asm";
	.intel_syntax noprefix
	.file "17.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v17_0:
# -- Begin  victim_function_v17
	.text
# mark_begin;

	.globl victim_function_v17
# --- victim_function_v17(size_t)
victim_function_v17:
# parameter 1: rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v17.1:
..L2:
                                                          #10.36
        push      rbp                                           #10.36
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #10.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #10.36
        mov       QWORD PTR [-16+rbp], rdi                      #10.36
        mov       eax, offset flat: array1                      #11.7
        add       rax, QWORD PTR [-16+rbp]                      #11.7
        movzx     eax, BYTE PTR [rax]                           #11.7
        lfence                                                  #11.7
        movzx     eax, al                                       #11.7
        mov       edx, DWORD PTR array1_size[rip]               #11.19
        cmp       eax, edx                                      #11.19
        jae       ..B1.6        # Prob 50%                      #11.19
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movzx     eax, BYTE PTR temp[rip]                       #12.5
        movzx     eax, al                                       #12.5
        mov       edx, offset flat: array1                      #12.20
        add       rdx, QWORD PTR [-16+rbp]                      #12.20
        movzx     edx, BYTE PTR [rdx]                           #12.20
        lfence                                                  #12.20
        movzx     edx, dl                                       #12.20
        imul      edx, edx, 512                                 #12.32
        movsxd    rdx, edx                                      #12.13
        mov       ecx, offset flat: array2                      #12.13
        add       rcx, rdx                                      #12.13
        movzx     edx, BYTE PTR [rcx]                           #12.13
        movzx     edx, dl                                       #12.13
        and       eax, edx                                      #12.5
        mov       BYTE PTR temp[rip], al                        #12.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2 ..B1.6
                                # Execution count [0.00e+00]
        leave                                                   #14.1
	.cfi_restore 6
        ret                                                     #14.1
	.cfi_offset 6, -16
                                # LOE
..B1.6:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        jmp       ..B1.3        # Prob 100%                     #
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
	.cfi_endproc
# mark_end;
	.type	victim_function_v17,@function
	.size	victim_function_v17,.-victim_function_v17
..LNvictim_function_v17.0:
	.data
# -- End  victim_function_v17
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
	.data
	.comm array2,131072,32
	.section .note.GNU-stack, ""
# End

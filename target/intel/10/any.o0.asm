# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O0 -S -c -o ../target/intel/10/any.o0.asm";
	.intel_syntax noprefix
	.file "10.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v10_0:
# -- Begin  victim_function_v10
	.text
# mark_begin;

	.globl victim_function_v10
# --- victim_function_v10(size_t, uint8_t)
victim_function_v10:
# parameter 1: rdi
# parameter 2: esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v10.1:
..L2:
                                                          #10.47
        push      rbp                                           #10.47
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #10.47
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #10.47
        mov       QWORD PTR [-16+rbp], rdi                      #10.47
        mov       BYTE PTR [-8+rbp], sil                        #10.47
        mov       rax, QWORD PTR [-16+rbp]                      #11.10
        mov       edx, DWORD PTR array1_size[rip]               #11.14
        cmp       rax, rdx                                      #11.14
        jae       ..B1.4        # Prob 50%                      #11.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        mov       eax, offset flat: array1                      #12.15
        add       rax, QWORD PTR [-16+rbp]                      #12.15
        movzx     eax, BYTE PTR [rax]                           #12.15
        movzx     eax, al                                       #12.15
        movzx     edx, BYTE PTR [-8+rbp]                        #12.28
        movzx     edx, dl                                       #12.28
        cmp       eax, edx                                      #12.28
        jne       ..B1.4        # Prob 50%                      #12.28
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movzx     eax, BYTE PTR temp[rip]                       #13.16
        movzx     eax, al                                       #13.16
        mov       edx, offset flat: array2                      #13.24
        movzx     edx, BYTE PTR [rdx]                           #13.24
        movzx     edx, dl                                       #13.24
        and       eax, edx                                      #13.16
        mov       BYTE PTR temp[rip], al                        #13.16
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.3 ..B1.2 ..B1.1
                                # Execution count [0.00e+00]
        leave                                                   #15.1
	.cfi_restore 6
        ret                                                     #15.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v10,@function
	.size	victim_function_v10,.-victim_function_v10
..LNvictim_function_v10.0:
	.data
# -- End  victim_function_v10
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

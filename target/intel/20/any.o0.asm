# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O0 -S -c -o ../target/intel/20/any.o0.asm";
	.intel_syntax noprefix
	.file "20.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v20_0:
# -- Begin  victim_function_v20
	.text
# mark_begin;

	.globl victim_function_v20
# --- victim_function_v20(size_t)
victim_function_v20:
# parameter 1: rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v20.1:
..L2:
                                                          #10.36
        push      rbp                                           #10.36
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #10.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #10.36
        mov       QWORD PTR [-8+rbp], rdi                       #10.36
        mov       eax, offset flat: array1                      #11.15
        add       rax, QWORD PTR [-8+rbp]                       #11.15
        movzx     eax, BYTE PTR [rax]                           #11.15
        mov       BYTE PTR [-16+rbp], al                        #11.13
        mov       rax, QWORD PTR [-8+rbp]                       #12.7
        mov       edx, DWORD PTR array1_size[rip]               #12.11
        cmp       rax, rdx                                      #12.11
        jae       ..B1.3        # Prob 50%                      #12.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movzx     eax, BYTE PTR temp[rip]                       #13.5
        movzx     eax, al                                       #13.5
        movzx     edx, BYTE PTR [-16+rbp]                       #13.20
        movzx     edx, dl                                       #13.20
        imul      edx, edx, 512                                 #13.24
        movsxd    rdx, edx                                      #13.13
        mov       ecx, offset flat: array2                      #13.13
        add       rcx, rdx                                      #13.13
        movzx     edx, BYTE PTR [rcx]                           #13.13
        movzx     edx, dl                                       #13.13
        and       eax, edx                                      #13.5
        mov       BYTE PTR temp[rip], al                        #13.5
        jmp       ..B1.4        # Prob 100%                     #13.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        mov       BYTE PTR [-16+rbp], 0                         #15.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.2 ..B1.3
                                # Execution count [0.00e+00]
        leave                                                   #17.1
	.cfi_restore 6
        ret                                                     #17.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v20,@function
	.size	victim_function_v20,.-victim_function_v20
..LNvictim_function_v20.0:
	.data
# -- End  victim_function_v20
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

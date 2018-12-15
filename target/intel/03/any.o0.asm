# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O0 -S -c -o ../target/intel/03/any.o0.asm";
	.intel_syntax noprefix
	.file "03.c"
	.text
..TXTST0:
.L_2__routine_start_leakByteNoinlineFunction_0:
# -- Begin  leakByteNoinlineFunction
	.text
# mark_begin;

	.globl leakByteNoinlineFunction
# --- leakByteNoinlineFunction(uint8_t)
leakByteNoinlineFunction:
# parameter 1: edi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_leakByteNoinlineFunction.1:
..L2:
                                                          #10.63
        push      rbp                                           #10.63
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #10.63
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #10.63
        mov       BYTE PTR [-16+rbp], dil                       #10.63
        movzx     eax, BYTE PTR temp[rip]                       #10.65
        movzx     eax, al                                       #10.65
        movzx     edx, BYTE PTR [-16+rbp]                       #10.80
        movzx     edx, dl                                       #10.80
        imul      edx, edx, 512                                 #10.86
        movsxd    rdx, edx                                      #10.73
        mov       ecx, offset flat: array2                      #10.73
        add       rcx, rdx                                      #10.73
        movzx     edx, BYTE PTR [rcx]                           #10.73
        movzx     edx, dl                                       #10.73
        and       eax, edx                                      #10.65
        mov       BYTE PTR temp[rip], al                        #10.65
        leave                                                   #10.92
	.cfi_restore 6
        ret                                                     #10.92
                                # LOE
	.cfi_endproc
# mark_end;
	.type	leakByteNoinlineFunction,@function
	.size	leakByteNoinlineFunction,.-leakByteNoinlineFunction
..LNleakByteNoinlineFunction.0:
	.data
# -- End  leakByteNoinlineFunction
	.text
.L_2__routine_start_victim_function_v03_1:
# -- Begin  victim_function_v03
	.text
# mark_begin;

	.globl victim_function_v03
# --- victim_function_v03(size_t)
victim_function_v03:
# parameter 1: rdi
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v03.8:
..L9:
                                                          #11.36
        push      rbp                                           #11.36
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #11.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #11.36
        mov       QWORD PTR [-16+rbp], rdi                      #11.36
        mov       rax, QWORD PTR [-16+rbp]                      #12.10
        mov       edx, DWORD PTR array1_size[rip]               #12.14
        cmp       rax, rdx                                      #12.14
        jae       ..B2.3        # Prob 50%                      #12.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.1
                                # Execution count [0.00e+00]
        mov       eax, offset flat: array1                      #13.11
        add       rax, QWORD PTR [-16+rbp]                      #13.11
        movzx     eax, BYTE PTR [rax]                           #13.11
        mov       edi, eax                                      #13.11
..___tag_value_victim_function_v03.13:
#       leakByteNoinlineFunction(uint8_t)
        call      leakByteNoinlineFunction                      #13.11
..___tag_value_victim_function_v03.14:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.2 ..B2.1
                                # Execution count [0.00e+00]
        leave                                                   #14.1
	.cfi_restore 6
        ret                                                     #14.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v03,@function
	.size	victim_function_v03,.-victim_function_v03
..LNvictim_function_v03.1:
	.data
# -- End  victim_function_v03
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

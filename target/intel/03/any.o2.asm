# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O2 -S -c -o ../target/intel/03/any.o2.asm";
	.intel_syntax noprefix
	.file "03.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v03_0:
# -- Begin  victim_function_v03
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v03
# --- victim_function_v03(size_t)
victim_function_v03:
# parameter 1: rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v03.1:
..L2:
                                                          #16.36
        mov       eax, DWORD PTR array1_size[rip]               #17.14
        cmp       rdi, rax                                      #17.14
        jae       ..B1.3        # Prob 78%                      #17.14
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [2.20e-01]
        movzx     edi, BYTE PTR [array1+rdi]                    #18.11
#       leakByteNoinlineFunction(uint8_t)
        jmp       leakByteNoinlineFunction                      #18.11
                                # LOE
..B1.3:                         # Preds ..B1.1
                                # Execution count [1.00e+00]
        ret                                                     #19.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v03,@function
	.size	victim_function_v03,.-victim_function_v03
..LNvictim_function_v03.0:
	.data
# -- End  victim_function_v03
	.text
.L_2__routine_start_leakByteNoinlineFunction_1:
# -- Begin  leakByteNoinlineFunction
	.text
# mark_begin;
       .align    16,0x90
	.globl leakByteNoinlineFunction
# --- leakByteNoinlineFunction(uint8_t)
leakByteNoinlineFunction:
# parameter 1: edi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_leakByteNoinlineFunction.4:
..L5:
                                                          #13.67
        movzx     eax, dil                                      #13.77
        shl       rax, 9                                        #13.89
        mov       dl, BYTE PTR [array2+rax]                     #13.77
        and       BYTE PTR temp[rip], dl                        #13.69
        ret                                                     #13.95
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	leakByteNoinlineFunction,@function
	.size	leakByteNoinlineFunction,.-leakByteNoinlineFunction
..LNleakByteNoinlineFunction.1:
	.data
# -- End  leakByteNoinlineFunction
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

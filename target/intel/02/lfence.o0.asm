# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O0 -mconditional-branch=all-fix -S -c -o ../target/intel/02/lfence.o0.asm";
	.intel_syntax noprefix
	.file "02.c"
	.text
..TXTST0:
.L_2__routine_start_leakByteLocalFunction_0:
# -- Begin  leakByteLocalFunction
	.text
# mark_begin;

	.globl leakByteLocalFunction
# --- leakByteLocalFunction(uint8_t)
leakByteLocalFunction:
# parameter 1: edi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_leakByteLocalFunction.1:
..L2:
                                                          #10.39
        push      rbp                                           #10.39
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #10.39
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #10.39
        mov       BYTE PTR [-16+rbp], dil                       #10.39
        movzx     eax, BYTE PTR temp[rip]                       #10.41
        movzx     eax, al                                       #10.41
        movzx     edx, BYTE PTR [-16+rbp]                       #10.56
        movzx     edx, dl                                       #10.56
        imul      edx, edx, 512                                 #10.62
        movsxd    rdx, edx                                      #10.49
        mov       ecx, offset flat: array2                      #10.49
        add       rcx, rdx                                      #10.49
        movzx     edx, BYTE PTR [rcx]                           #10.49
        lfence                                                  #10.49
        movzx     edx, dl                                       #10.49
        and       eax, edx                                      #10.41
        mov       BYTE PTR temp[rip], al                        #10.41
        leave                                                   #10.68
	.cfi_restore 6
        ret                                                     #10.68
                                # LOE
	.cfi_endproc
# mark_end;
	.type	leakByteLocalFunction,@function
	.size	leakByteLocalFunction,.-leakByteLocalFunction
..LNleakByteLocalFunction.0:
	.data
# -- End  leakByteLocalFunction
	.text
.L_2__routine_start_victim_function_v02_1:
# -- Begin  victim_function_v02
	.text
# mark_begin;

	.globl victim_function_v02
# --- victim_function_v02(size_t)
victim_function_v02:
# parameter 1: rdi
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v02.8:
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
        mov       eax, offset flat: array1                      #13.8
        add       rax, QWORD PTR [-16+rbp]                      #13.8
        movzx     eax, BYTE PTR [rax]                           #13.8
        lfence                                                  #13.8
        mov       edi, eax                                      #13.8
..___tag_value_victim_function_v02.13:
#       leakByteLocalFunction(uint8_t)
        call      leakByteLocalFunction                         #13.8
..___tag_value_victim_function_v02.14:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.2 ..B2.1
                                # Execution count [0.00e+00]
        leave                                                   #15.1
	.cfi_restore 6
        ret                                                     #15.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v02,@function
	.size	victim_function_v02,.-victim_function_v02
..LNvictim_function_v02.1:
	.data
# -- End  victim_function_v02
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

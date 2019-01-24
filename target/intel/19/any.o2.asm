# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O2 -S -c -o ../target/intel/19/any.o2.asm";
	.intel_syntax noprefix
	.file "19.c"
	.text
..TXTST0:
.L_2__routine_start_main_0:
# -- Begin  main
	.text
# mark_begin;
       .align    16,0x90
	.globl main
# --- main()
main:
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_main.1:
..L2:
                                                          #16.11
        push      rbp                                           #16.11
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #16.11
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        and       rsp, -128                                     #16.11
        sub       rsp, 128                                      #16.11
        xor       esi, esi                                      #16.11
        mov       edi, 3                                        #16.11
        call      __intel_new_feature_proc_init                 #16.11
                                # LOE rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.1
                                # Execution count [1.00e+00]
        stmxcsr   DWORD PTR [rsp]                               #16.11
        or        DWORD PTR [rsp], 32832                        #16.11
        mov       edx, DWORD PTR array1_size[rip]               #17.3
        ldmxcsr   DWORD PTR [rsp]                               #16.11
        test      rdx, rdx                                      #17.3
        jbe       ..B1.4        # Prob 50%                      #17.3
                                # LOE rdx rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.7
                                # Execution count [5.00e-01]
        movzx     eax, BYTE PTR array1[rip]                     #17.3
        shl       rax, 9                                        #17.3
        mov       cl, BYTE PTR temp[rip]                        #17.3
        and       cl, BYTE PTR [array2+rax]                     #17.3
        mov       BYTE PTR temp[rip], cl                        #17.3
        cmp       rdx, 42                                       #18.3
        jbe       ..B1.4        # Prob 50%                      #18.3
                                # LOE rbx r12 r13 r14 r15 cl
..B1.3:                         # Preds ..B1.2
                                # Execution count [5.00e-01]
        movzx     eax, BYTE PTR 42+array1[rip]                  #18.3
        shl       rax, 9                                        #18.3
        mov       dl, BYTE PTR [array2+rax]                     #18.3
        and       cl, dl                                        #18.3
        mov       BYTE PTR temp[rip], cl                        #18.3
                                # LOE rbx r12 r13 r14 r15
..B1.4:                         # Preds ..B1.7 ..B1.2 ..B1.3
                                # Execution count [1.00e+00]
        xor       eax, eax                                      #19.10
        mov       rsp, rbp                                      #19.10
        pop       rbp                                           #19.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #19.10
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.0:
	.data
# -- End  main
	.text
.L_2__routine_start_victim_function_v19_1:
# -- Begin  victim_function_v19
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v19
# --- victim_function_v19(size_t)
victim_function_v19:
# parameter 1: rdi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v19.9:
..L10:
                                                         #10.36
        mov       eax, DWORD PTR array1_size[rip]               #11.14
        cmp       rdi, rax                                      #11.14
        jae       ..B2.3        # Prob 50%                      #11.14
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
                                # Execution count [5.00e-01]
        movzx     eax, BYTE PTR [array1+rdi]                    #12.26
        shl       rax, 9                                        #12.38
        mov       dl, BYTE PTR [array2+rax]                     #12.19
        and       BYTE PTR temp[rip], dl                        #12.11
                                # LOE rbx rbp r12 r13 r14 r15
..B2.3:                         # Preds ..B2.1 ..B2.2
                                # Execution count [1.00e+00]
        ret                                                     #14.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v19,@function
	.size	victim_function_v19,.-victim_function_v19
..LNvictim_function_v19.1:
	.data
# -- End  victim_function_v19
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

# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O0 -S -c -o ../target/intel/19/any.o0.asm";
	.intel_syntax noprefix
	.file "19.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v19_0:
# -- Begin  victim_function_v19
	.text
# mark_begin;

	.globl victim_function_v19
# --- victim_function_v19(size_t)
victim_function_v19:
# parameter 1: rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v19.1:
..L2:
                                                          #10.36
        push      rbp                                           #10.36
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #10.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #10.36
        mov       QWORD PTR [-16+rbp], rdi                      #10.36
        mov       rax, QWORD PTR [-16+rbp]                      #11.10
        mov       edx, DWORD PTR array1_size[rip]               #11.14
        cmp       rax, rdx                                      #11.14
        jae       ..B1.3        # Prob 50%                      #11.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movzx     eax, BYTE PTR temp[rip]                       #12.11
        movzx     eax, al                                       #12.11
        mov       edx, offset flat: array1                      #12.26
        add       rdx, QWORD PTR [-16+rbp]                      #12.26
        movzx     edx, BYTE PTR [rdx]                           #12.26
        movzx     edx, dl                                       #12.26
        imul      edx, edx, 512                                 #12.38
        movsxd    rdx, edx                                      #12.19
        mov       ecx, offset flat: array2                      #12.19
        add       rcx, rdx                                      #12.19
        movzx     edx, BYTE PTR [rcx]                           #12.19
        movzx     edx, dl                                       #12.19
        and       eax, edx                                      #12.11
        mov       BYTE PTR temp[rip], al                        #12.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2 ..B1.1
                                # Execution count [0.00e+00]
        leave                                                   #14.1
	.cfi_restore 6
        ret                                                     #14.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v19,@function
	.size	victim_function_v19,.-victim_function_v19
..LNvictim_function_v19.0:
	.data
# -- End  victim_function_v19
	.text
.L_2__routine_start_main_1:
# -- Begin  main
	.text
# mark_begin;

	.globl main
# --- main()
main:
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_main.8:
..L9:
                                                          #16.11
        push      rbp                                           #16.11
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #16.11
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        mov       eax, 0                                        #17.3
        mov       rdi, rax                                      #17.3
..___tag_value_main.13:
#       victim_function_v19(size_t)
        call      victim_function_v19                           #17.3
..___tag_value_main.14:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.1
                                # Execution count [0.00e+00]
        mov       eax, 42                                       #18.3
        mov       rdi, rax                                      #18.3
..___tag_value_main.15:
#       victim_function_v19(size_t)
        call      victim_function_v19                           #18.3
..___tag_value_main.16:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        mov       eax, 0                                        #19.10
        leave                                                   #19.10
	.cfi_restore 6
        ret                                                     #19.10
                                # LOE
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.1:
	.data
# -- End  main
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

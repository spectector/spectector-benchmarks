# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O0 -S -c -o ../target/intel/07/any.o0.asm";
	.intel_syntax noprefix
	.file "07.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v07_0:
# -- Begin  victim_function_v07
	.text
# mark_begin;

	.globl victim_function_v07
# --- victim_function_v07(size_t)
victim_function_v07:
# parameter 1: rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v07.1:
..L2:
                                                          #10.36
        push      rbp                                           #10.36
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #10.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #10.36
        mov       QWORD PTR [-16+rbp], rdi                      #10.36
        mov       rax, QWORD PTR [-16+rbp]                      #12.10
        mov       rdx, QWORD PTR last_x.203[rip]                #12.15
        cmp       rax, rdx                                      #12.15
        jne       ..B1.3        # Prob 50%                      #12.15
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
        mov       rax, QWORD PTR [-16+rbp]                      #14.10
        mov       edx, DWORD PTR array1_size[rip]               #14.14
        cmp       rax, rdx                                      #14.14
        jae       ..B1.5        # Prob 50%                      #14.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.3
                                # Execution count [0.00e+00]
        mov       rax, QWORD PTR [-16+rbp]                      #15.20
        mov       QWORD PTR last_x.203[rip], rax                #15.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.4 ..B1.3
                                # Execution count [0.00e+00]
        leave                                                   #16.1
	.cfi_restore 6
        ret                                                     #16.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v07,@function
	.size	victim_function_v07,.-victim_function_v07
..LNvictim_function_v07.0:
	.bss
	.align 8
	.align 8
last_x.203:
	.type	last_x.203,@object
	.size	last_x.203,8
	.space 8	# pad
	.data
# -- End  victim_function_v07
	.bss
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

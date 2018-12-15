# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/10/lfence.o0.s";
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
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v10.1:
..L2:
                                                          #10.47
        pushq     %rbp                                          #10.47
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #10.47
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #10.47
        movq      %rdi, -16(%rbp)                               #10.47
        movb      %sil, -8(%rbp)                                #10.47
        movq      -16(%rbp), %rax                               #11.10
        movl      array1_size(%rip), %edx                       #11.14
        cmpq      %rdx, %rax                                    #11.14
        jae       ..B1.7        # Prob 50%                      #11.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movl      $array1, %eax                                 #12.15
        addq      -16(%rbp), %rax                               #12.15
        movzbl    (%rax), %eax                                  #12.15
        lfence                                                  #12.15
        movzbl    %al, %eax                                     #12.15
        movzbl    -8(%rbp), %edx                                #12.28
        movzbl    %dl, %edx                                     #12.28
        cmpl      %edx, %eax                                    #12.28
        jne       ..B1.8        # Prob 50%                      #12.28
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movzbl    temp(%rip), %eax                              #13.16
        movzbl    %al, %eax                                     #13.16
        movl      $array2, %edx                                 #13.24
        movzbl    (%rdx), %edx                                  #13.24
        lfence                                                  #13.24
        movzbl    %dl, %edx                                     #13.24
        andl      %edx, %eax                                    #13.16
        movb      %al, temp(%rip)                               #13.16
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.3 ..B1.8 ..B1.7
                                # Execution count [0.00e+00]
        leave                                                   #15.1
	.cfi_restore 6
        ret                                                     #15.1
	.cfi_offset 6, -16
                                # LOE
..B1.7:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        jmp       ..B1.4        # Prob 100%                     #
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        jmp       ..B1.4        # Prob 100%                     #
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
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

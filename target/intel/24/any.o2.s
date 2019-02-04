# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/24/any.o2.s";
	.file "24.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v24_0:
# -- Begin  victim_function_v24
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v24
# --- victim_function_v24(size_t)
victim_function_v24:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v24.1:
..L2:
                                                          #10.36
        movl      array1_size(%rip), %eax                       #11.14
        cmpq      %rax, %rdi                                    #11.14
        jae       ..B1.3        # Prob 50%                      #11.14
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [5.00e-01]
        movzbl    array1(%rdi), %eax                            #12.26
        shlq      $9, %rax                                      #12.38
        movb      array2(%rax), %dl                             #12.19
        andb      %dl, temp(%rip)                               #12.11
                                # LOE rbx rbp r12 r13 r14 r15
..B1.3:                         # Preds ..B1.1 ..B1.2
                                # Execution count [1.00e+00]
        ret                                                     #14.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v24,@function
	.size	victim_function_v24,.-victim_function_v24
..LNvictim_function_v24.0:
	.data
# -- End  victim_function_v24
	.text
.L_2__routine_start_another_1:
# -- Begin  another
	.text
# mark_begin;
       .align    16,0x90
	.globl another
# --- another(int)
another:
# parameter 1: %edi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_another.4:
..L5:
                                                          #16.20
        testl     %edi, %edi                                    #17.6
        je        ..B2.4        # Prob 78%                      #17.6
                                # LOE rbx rbp r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
                                # Execution count [2.20e-01]
        movl      array1_size(%rip), %eax                       #18.5
        cmpq      $42, %rax                                     #18.5
        jbe       ..B2.4        # Prob 50%                      #18.5
                                # LOE rbx rbp r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2
                                # Execution count [1.10e-01]
        movzbl    42+array1(%rip), %eax                         #18.5
        shlq      $9, %rax                                      #18.5
        movb      array2(%rax), %dl                             #18.5
        andb      %dl, temp(%rip)                               #18.5
                                # LOE rbx rbp r12 r13 r14 r15
..B2.4:                         # Preds ..B2.2 ..B2.1 ..B2.3
                                # Execution count [1.00e+00]
        ret                                                     #19.3
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	another,@function
	.size	another,.-another
..LNanother.1:
	.data
# -- End  another
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

# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/23/lfence.o2.s";
	.file "23.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v23_0:
# -- Begin  victim_function_v23
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v23
# --- victim_function_v23(size_t)
victim_function_v23:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v23.1:
..L2:
                                                          #10.36
        movl      array1_size(%rip), %eax                       #11.14
        cmpq      %rax, %rdi                                    #11.14
        jae       ..B1.3        # Prob 50%                      #11.14
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [5.00e-01]
        movzbl    array1(%rdi), %edi                            #12.26
        shlq      $9, %rdi                                      #12.38
        movb      temp(%rip), %al                               #12.11
        lfence                                                  #12.26
        andb      array2(%rdi), %al                             #12.11
        movb      %al, temp(%rip)                               #12.11
                                # LOE rbx rbp r12 r13 r14 r15
..B1.3:                         # Preds ..B1.1 ..B1.2
                                # Execution count [1.00e+00]
        ret                                                     #14.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v23,@function
	.size	victim_function_v23,.-victim_function_v23
..LNvictim_function_v23.0:
	.data
# -- End  victim_function_v23
	.text
.L_2__routine_start_attacker_function_1:
# -- Begin  attacker_function
	.text
# mark_begin;
       .align    16,0x90
	.globl attacker_function
# --- attacker_function()
attacker_function:
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_attacker_function.4:
..L5:
                                                          #16.25
        movl      array1_size(%rip), %eax                       #17.3
        cmpq      $42, %rax                                     #17.3
        jbe       ..B2.3        # Prob 50%                      #17.3
                                # LOE rbx rbp r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
                                # Execution count [5.00e-01]
        movzbl    42+array1(%rip), %eax                         #17.3
        shlq      $9, %rax                                      #17.3
        movb      temp(%rip), %cl                               #17.3
        movb      array2(%rax), %dl                             #17.3
        andb      %dl, %cl                                      #17.3
        lfence                                                  #17.3
        movb      %cl, temp(%rip)                               #17.3
                                # LOE rbx rbp r12 r13 r14 r15
..B2.3:                         # Preds ..B2.1 ..B2.2
                                # Execution count [1.00e+00]
        ret                                                     #18.3
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	attacker_function,@function
	.size	attacker_function,.-attacker_function
..LNattacker_function.1:
	.data
# -- End  attacker_function
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

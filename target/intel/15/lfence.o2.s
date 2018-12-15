# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/15/lfence.o2.s";
	.file "15.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v15_0:
# -- Begin  victim_function_v15
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v15
# --- victim_function_v15(size_t *)
victim_function_v15:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v15.1:
..L2:
                                                          #10.37
        movq      (%rdi), %rdx                                  #11.8
        lfence                                                  #11.8
        movl      array1_size(%rip), %eax                       #11.12
        cmpq      %rax, %rdx                                    #11.12
        jae       ..B1.3        # Prob 50%                      #11.12
                                # LOE rdx rbx rbp r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [5.00e-01]
        movzbl    array1(%rdx), %edx                            #12.20
        shlq      $9, %rdx                                      #12.33
        movb      temp(%rip), %al                               #12.5
        lfence                                                  #12.20
        andb      array2(%rdx), %al                             #12.5
        movb      %al, temp(%rip)                               #12.5
                                # LOE rbx rbp r12 r13 r14 r15
..B1.3:                         # Preds ..B1.1 ..B1.2
                                # Execution count [1.00e+00]
        ret                                                     #13.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v15,@function
	.size	victim_function_v15,.-victim_function_v15
..LNvictim_function_v15.0:
	.data
# -- End  victim_function_v15
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

# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/16/any.o2.s";
	.file "16.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v16_0:
# -- Begin  victim_function_v16
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v16
# --- victim_function_v16(size_t)
victim_function_v16:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v16.1:
..L2:
                                                          #10.36
        movl      array1_size(%rip), %eax                       #11.11
        cmpq      %rax, %rdi                                    #11.11
        jae       ..B1.3        # Prob 50%                      #11.11
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [5.00e-01]
        movzbl    array1(%rdi), %eax                            #12.20
        shlq      $9, %rax                                      #12.32
        movb      temp(%rip), %dl                               #12.5
        andb      array2(%rax), %dl                             #12.5
        jmp       ..B1.4        # Prob 100%                     #12.5
                                # LOE rbx rbp r12 r13 r14 r15 dl
..B1.3:                         # Preds ..B1.1
                                # Execution count [5.00e-01]
        xorb      %dl, %dl                                      #14.5
                                # LOE rbx rbp r12 r13 r14 r15 dl
..B1.4:                         # Preds ..B1.2 ..B1.3
                                # Execution count [1.00e+00]
        movb      %dl, temp(%rip)                               #12.5
        ret                                                     #16.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v16,@function
	.size	victim_function_v16,.-victim_function_v16
..LNvictim_function_v16.0:
	.data
# -- End  victim_function_v16
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

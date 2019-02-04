# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/22/any.o2.s";
	.file "22.c"
	.text
..TXTST0:
.L_2__routine_start_mem_leak_0:
# -- Begin  mem_leak
	.text
# mark_begin;
       .align    16,0x90
	.globl mem_leak
# --- mem_leak(size_t)
mem_leak:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_mem_leak.1:
..L2:
                                                          #9.28
        movl      array1_size(%rip), %eax                       #10.11
        cmpq      %rax, %rdi                                    #10.11
        jae       ..B1.3        # Prob 50%                      #10.11
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [5.00e-01]
        movzbl    array1(%rdi), %eax                            #11.12
        ret                                                     #11.12
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B1.3:                         # Preds ..B1.1
                                # Execution count [5.00e-01]
        xorl      %eax, %eax                                    #13.10
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B1.4:                         # Preds ..B1.3
                                # Execution count [1.00e+00]
        ret                                                     #11.12
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	mem_leak,@function
	.size	mem_leak,.-mem_leak
..LNmem_leak.0:
	.data
# -- End  mem_leak
	.text
.L_2__routine_start_victim_function_v22_1:
# -- Begin  victim_function_v22
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v22
# --- victim_function_v22(size_t)
victim_function_v22:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v22.4:
..L5:
                                                          #16.36
        ret                                                     #18.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v22,@function
	.size	victim_function_v22,.-victim_function_v22
..LNvictim_function_v22.1:
	.data
# -- End  victim_function_v22
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
	.section .note.GNU-stack, ""
# End

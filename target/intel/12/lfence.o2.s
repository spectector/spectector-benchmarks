# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/12/lfence.o2.s";
	.file "12.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v12_0:
# -- Begin  victim_function_v12
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v12
# --- victim_function_v12(size_t, size_t)
victim_function_v12:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v12.1:
..L2:
                                                          #10.46
        lea       (%rdi,%rsi), %rax                             #11.15
        movl      array1_size(%rip), %edx                       #11.20
        cmpq      %rdx, %rax                                    #11.20
        jae       ..B1.3        # Prob 50%                      #11.20
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [5.00e-01]
        movzbl    array1(%rsi,%rdi), %esi                       #12.26
        shlq      $9, %rsi                                      #12.42
        movb      temp(%rip), %al                               #12.11
        lfence                                                  #12.26
        andb      array2(%rsi), %al                             #12.11
        movb      %al, temp(%rip)                               #12.11
                                # LOE rbx rbp r12 r13 r14 r15
..B1.3:                         # Preds ..B1.1 ..B1.2
                                # Execution count [1.00e+00]
        ret                                                     #13.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v12,@function
	.size	victim_function_v12,.-victim_function_v12
..LNvictim_function_v12.0:
	.data
# -- End  victim_function_v12
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

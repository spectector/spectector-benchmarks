# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/21/any.o2.s";
	.file "21.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v21_0:
# -- Begin  victim_function_v21
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v21
# --- victim_function_v21(size_t)
victim_function_v21:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v21.1:
..L2:
                                                          #9.36
        xorb      %cl, %cl                                      #10.9
        movl      array1_size(%rip), %edx                       #11.23
        movb      temp(%rip), %al                               #13.5
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 al cl
..B1.2:                         # Preds ..B1.3 ..B1.1
                                # Execution count [1.88e+00]
        cmpq      %rdx, %rdi                                    #11.23
        jae       ..B1.5        # Prob 6%                       #11.23
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 al cl
..B1.3:                         # Preds ..B1.2
                                # Execution count [1.76e+00]
        movzbl    %al, %eax                                     #13.5
        incb      %cl                                           #11.36
        movzbl    array1(%rdi), %edi                            #12.9
        andq      %rdi, %rax                                    #13.5
        movb      %al, temp(%rip)                               #13.5
        cmpb      $2, %cl                                       #11.14
        jl        ..B1.2        # Prob 50%                      #11.14
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 al cl
..B1.5:                         # Preds ..B1.2 ..B1.3
                                # Execution count [1.00e+00]
        ret                                                     #15.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v21,@function
	.size	victim_function_v21,.-victim_function_v21
..LNvictim_function_v21.0:
	.data
# -- End  victim_function_v21
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

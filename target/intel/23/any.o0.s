# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/23/any.o0.s";
	.file "23.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v23_0:
# -- Begin  victim_function_v23
	.text
# mark_begin;

	.globl victim_function_v23
# --- victim_function_v23(size_t)
victim_function_v23:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v23.1:
..L2:
                                                          #10.36
        pushq     %rbp                                          #10.36
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #10.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #10.36
        movq      %rdi, -16(%rbp)                               #10.36
        movq      -16(%rbp), %rax                               #11.10
        movl      array1_size(%rip), %edx                       #11.14
        cmpq      %rdx, %rax                                    #11.14
        jae       ..B1.3        # Prob 50%                      #11.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movzbl    temp(%rip), %eax                              #12.11
        movzbl    %al, %eax                                     #12.11
        movl      $array1, %edx                                 #12.26
        addq      -16(%rbp), %rdx                               #12.26
        movzbl    (%rdx), %edx                                  #12.26
        movzbl    %dl, %edx                                     #12.26
        imull     $512, %edx, %edx                              #12.38
        movslq    %edx, %rdx                                    #12.19
        movl      $array2, %ecx                                 #12.19
        addq      %rdx, %rcx                                    #12.19
        movzbl    (%rcx), %edx                                  #12.19
        movzbl    %dl, %edx                                     #12.19
        andl      %edx, %eax                                    #12.11
        movb      %al, temp(%rip)                               #12.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2 ..B1.1
                                # Execution count [0.00e+00]
        leave                                                   #14.1
	.cfi_restore 6
        ret                                                     #14.1
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

	.globl attacker_function
# --- attacker_function()
attacker_function:
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_attacker_function.8:
..L9:
                                                          #16.25
        pushq     %rbp                                          #16.25
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #16.25
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        movl      $42, %eax                                     #17.3
        movq      %rax, %rdi                                    #17.3
..___tag_value_attacker_function.13:
#       victim_function_v23(size_t)
        call      victim_function_v23                           #17.3
..___tag_value_attacker_function.14:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.1
                                # Execution count [0.00e+00]
        leave                                                   #18.3
	.cfi_restore 6
        ret                                                     #18.3
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

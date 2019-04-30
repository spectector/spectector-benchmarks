# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/18/lfence.o0.s";
	.file "18.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v18_0:
# -- Begin  victim_function_v18
	.text
# mark_begin;

	.globl victim_function_v18
# --- victim_function_v18(size_t)
victim_function_v18:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v18.1:
..L2:
                                                          #11.36
        pushq     %rbp                                          #11.36
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #11.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #11.36
        movq      %rdi, -16(%rbp)                               #11.36
        movl      $array3, %eax                                 #12.10
        addq      -16(%rbp), %rax                               #12.10
        movzbl    (%rax), %eax                                  #12.10
        lfence                                                  #12.10
        movzbl    %al, %eax                                     #12.10
        movl      array1_size(%rip), %edx                       #12.22
        cmpl      %edx, %eax                                    #12.22
        jae       ..B1.6        # Prob 50%                      #12.22
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movzbl    temp(%rip), %eax                              #13.11
        movzbl    %al, %eax                                     #13.11
        movl      $array3, %edx                                 #13.33
        addq      -16(%rbp), %rdx                               #13.33
        movzbl    (%rdx), %edx                                  #13.33
        lfence                                                  #13.33
        movzbl    %dl, %edx                                     #13.26
        movl      $array1, %ecx                                 #13.26
        addq      %rdx, %rcx                                    #13.26
        movzbl    (%rcx), %edx                                  #13.26
        movzbl    %dl, %edx                                     #13.19
        movl      $array2, %ecx                                 #13.19
        addq      %rdx, %rcx                                    #13.19
        movzbl    (%rcx), %edx                                  #13.19
        movzbl    %dl, %edx                                     #13.19
        andl      %edx, %eax                                    #13.11
        movb      %al, temp(%rip)                               #13.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2 ..B1.6
                                # Execution count [0.00e+00]
        leave                                                   #15.1
	.cfi_restore 6
        ret                                                     #15.1
	.cfi_offset 6, -16
                                # LOE
..B1.6:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        jmp       ..B1.3        # Prob 100%                     #
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
	.cfi_endproc
# mark_end;
	.type	victim_function_v18,@function
	.size	victim_function_v18,.-victim_function_v18
..LNvictim_function_v18.0:
	.data
# -- End  victim_function_v18
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
	.comm array3,131072,32
	.section .note.GNU-stack, ""
# End

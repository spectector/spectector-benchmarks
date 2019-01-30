# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/21/lfence.o0.s";
	.file "21.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v21_0:
# -- Begin  victim_function_v21
	.text
# mark_begin;

	.globl victim_function_v21
# --- victim_function_v21(size_t)
victim_function_v21:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v21.1:
..L2:
                                                          #9.36
        pushq     %rbp                                          #9.36
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #9.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #9.36
        movq      %rdi, -8(%rbp)                                #9.36
        movl      $0, -16(%rbp)                                 #10.9
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.4 ..B1.1
                                # Execution count [0.00e+00]
        movl      -16(%rbp), %eax                               #11.10
        cmpl      $2, %eax                                      #11.14
        jge       ..B1.5        # Prob 50%                      #11.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movq      -8(%rbp), %rax                                #11.19
        movl      array1_size(%rip), %edx                       #11.23
        cmpq      %rdx, %rax                                    #11.23
        jae       ..B1.5        # Prob 50%                      #11.23
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.3
                                # Execution count [0.00e+00]
        movl      $array1, %eax                                 #12.9
        addq      -8(%rbp), %rax                                #12.9
        movzbl    (%rax), %eax                                  #12.9
        lfence                                                  #12.9
        movzbl    %al, %eax                                     #12.9
        movq      %rax, -8(%rbp)                                #12.5
        movzbl    temp(%rip), %eax                              #13.5
        movzbl    %al, %eax                                     #13.5
        andl      -8(%rbp), %eax                                #13.5
        movb      %al, temp(%rip)                               #13.5
        movl      $1, %eax                                      #11.36
        addl      -16(%rbp), %eax                               #11.36
        movl      %eax, -16(%rbp)                               #11.36
        jmp       ..B1.2        # Prob 100%                     #11.36
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.3 ..B1.2
                                # Execution count [0.00e+00]
        leave                                                   #15.1
	.cfi_restore 6
        ret                                                     #15.1
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

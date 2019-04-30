# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/13/lfence.o0.s";
	.file "13.c"
	.text
..TXTST0:
.L_2__routine_start_is_x_safe_0:
# -- Begin  is_x_safe
	.text
# mark_begin;

	.globl is_x_safe
# --- is_x_safe(size_t)
is_x_safe:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_is_x_safe.1:
..L2:
                                                          #16.38
        pushq     %rbp                                          #16.38
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #16.38
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #16.38
        movq      %rdi, -16(%rbp)                               #16.38
        movq      -16(%rbp), %rax                               #16.44
        movl      array1_size(%rip), %edx                       #16.48
        cmpq      %rdx, %rax                                    #16.48
        jb        ..B1.3        # Prob 50%                      #16.48
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movl      $0, %eax                                      #16.78
        leave                                                   #16.78
	.cfi_restore 6
        ret                                                     #16.78
	.cfi_offset 6, -16
                                # LOE
..B1.3:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #16.68
        leave                                                   #16.68
	.cfi_restore 6
        ret                                                     #16.68
                                # LOE
	.cfi_endproc
# mark_end;
	.type	is_x_safe,@function
	.size	is_x_safe,.-is_x_safe
..LNis_x_safe.0:
	.data
# -- End  is_x_safe
	.text
.L_2__routine_start_victim_function_v13_1:
# -- Begin  victim_function_v13
	.text
# mark_begin;

	.globl victim_function_v13
# --- victim_function_v13(size_t)
victim_function_v13:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v13.10:
..L11:
                                                         #17.36
        pushq     %rbp                                          #17.36
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #17.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #17.36
        movq      %rdi, -8(%rbp)                                #17.36
        movq      -8(%rbp), %rax                                #18.10
        movq      %rax, %rdi                                    #18.10
..___tag_value_victim_function_v13.15:
#       is_x_safe(size_t)
        call      is_x_safe                                     #18.10
..___tag_value_victim_function_v13.16:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B2.8:                         # Preds ..B2.1
                                # Execution count [0.00e+00]
        movl      %eax, -16(%rbp)                               #18.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.8
                                # Execution count [0.00e+00]
        movl      -16(%rbp), %eax                               #18.10
        testl     %eax, %eax                                    #18.10
        je        ..B2.7        # Prob 50%                      #18.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        movzbl    temp(%rip), %eax                              #19.11
        movzbl    %al, %eax                                     #19.11
        movl      $array1, %edx                                 #19.26
        addq      -8(%rbp), %rdx                                #19.26
        movzbl    (%rdx), %edx                                  #19.26
        lfence                                                  #19.26
        movzbl    %dl, %edx                                     #19.26
        imull     $512, %edx, %edx                              #19.38
        movslq    %edx, %rdx                                    #19.19
        movl      $array2, %ecx                                 #19.19
        addq      %rdx, %rcx                                    #19.19
        movzbl    (%rcx), %edx                                  #19.19
        movzbl    %dl, %edx                                     #19.19
        andl      %edx, %eax                                    #19.11
        movb      %al, temp(%rip)                               #19.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.4:                         # Preds ..B2.3 ..B2.7
                                # Execution count [0.00e+00]
        leave                                                   #20.1
	.cfi_restore 6
        ret                                                     #20.1
	.cfi_offset 6, -16
                                # LOE
..B2.7:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        jmp       ..B2.4        # Prob 100%                     #
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
	.cfi_endproc
# mark_end;
	.type	victim_function_v13,@function
	.size	victim_function_v13,.-victim_function_v13
..LNvictim_function_v13.1:
	.data
# -- End  victim_function_v13
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

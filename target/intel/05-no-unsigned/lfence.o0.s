# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/05-no-unsigned/lfence.o0.s";
	.file "05-no-unsigned.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v05_0:
# -- Begin  victim_function_v05
	.text
# mark_begin;

	.globl victim_function_v05
# --- victim_function_v05(long)
victim_function_v05:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v05.1:
..L2:
                                                          #21.34
        pushq     %rbp                                          #21.34
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #21.34
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #21.34
        movq      %rdi, -8(%rbp)                                #21.34
        movq      -8(%rbp), %rax                                #23.7
        testq     %rax, %rax                                    #23.11
        jl        ..B1.6        # Prob 50%                      #23.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movq      -8(%rbp), %rax                                #23.16
        movl      array1_size(%rip), %edx                       #23.20
        cmpq      %rdx, %rax                                    #23.20
        jge       ..B1.6        # Prob 50%                      #23.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #24.10
        addl      -8(%rbp), %eax                                #24.18
        movl      %eax, -16(%rbp)                               #24.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.5 ..B1.3
                                # Execution count [0.00e+00]
        movl      -16(%rbp), %eax                               #24.21
        testl     %eax, %eax                                    #24.26
        jl        ..B1.6        # Prob 50%                      #24.26
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        movzbl    temp(%rip), %eax                              #25.7
        movzbl    %al, %eax                                     #25.7
        movl      -16(%rbp), %edx                               #25.29
        movslq    %edx, %rdx                                    #25.22
        movl      $array1, %ecx                                 #25.22
        addq      %rdx, %rcx                                    #25.22
        movzbl    (%rcx), %edx                                  #25.22
        lfence                                                  #25.22
        movzbl    %dl, %edx                                     #25.22
        imull     $512, %edx, %edx                              #25.34
        movslq    %edx, %rdx                                    #25.15
        movl      $array2, %ecx                                 #25.15
        addq      %rdx, %rcx                                    #25.15
        movzbl    (%rcx), %edx                                  #25.15
        movzbl    %dl, %edx                                     #25.15
        andl      %edx, %eax                                    #25.7
        movb      %al, temp(%rip)                               #25.7
        movl      $-1, %eax                                     #24.29
        addl      -16(%rbp), %eax                               #24.29
        movl      %eax, -16(%rbp)                               #24.29
        jmp       ..B1.4        # Prob 100%                     #24.29
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.4 ..B1.2 ..B1.1
                                # Execution count [0.00e+00]
        leave                                                   #27.1
	.cfi_restore 6
        ret                                                     #27.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v05,@function
	.size	victim_function_v05,.-victim_function_v05
..LNvictim_function_v05.0:
	.data
# -- End  victim_function_v05
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

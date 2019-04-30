# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/bubblesort/lfence.o0.s";
	.file "bubblesort.c"
	.text
..TXTST0:
.L_2__routine_start_bubbleSort_0:
# -- Begin  bubbleSort
	.text
# mark_begin;

	.globl bubbleSort
# --- bubbleSort(int *, int)
bubbleSort:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_bubbleSort.1:
..L2:
                                                          #1.47
        pushq     %rbp                                          #1.47
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #1.47
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $32, %rsp                                     #1.47
        movq      %rdi, -16(%rbp)                               #1.47
        movl      %esi, -8(%rbp)                                #1.47
        movl      $-1, %eax                                     #4.10
        addl      -8(%rbp), %eax                                #4.28
        movl      %eax, -32(%rbp)                               #4.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.3 ..B1.1
                                # Execution count [0.00e+00]
        movl      -32(%rbp), %eax                               #4.32
        testl     %eax, %eax                                    #4.37
        jge       ..B1.4        # Prob 50%                      #4.37
        jmp       ..B1.9        # Prob 100%                     #4.37
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #4.40
        addl      -32(%rbp), %eax                               #4.40
        movl      %eax, -32(%rbp)                               #4.40
        jmp       ..B1.2        # Prob 100%                     #4.40
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      $1, -28(%rbp)                                 #5.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.6 ..B1.4
                                # Execution count [0.00e+00]
        movl      -28(%rbp), %eax                               #5.21
        movl      -32(%rbp), %edx                               #5.26
        cmpl      %edx, %eax                                    #5.26
        jle       ..B1.7        # Prob 50%                      #5.26
        jmp       ..B1.3        # Prob 100%                     #5.26
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.8 ..B1.12
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #5.29
        addl      -28(%rbp), %eax                               #5.29
        movl      %eax, -28(%rbp)                               #5.29
        jmp       ..B1.5        # Prob 100%                     #5.29
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #6.13
        addl      -28(%rbp), %eax                               #6.27
        movslq    %eax, %rax                                    #6.17
        imulq     $4, %rax, %rax                                #6.17
        addq      -16(%rbp), %rax                               #6.17
        movl      (%rax), %eax                                  #6.17
        lfence                                                  #6.17
        movl      -28(%rbp), %edx                               #6.40
        movslq    %edx, %rdx                                    #6.32
        imulq     $4, %rdx, %rdx                                #6.32
        addq      -16(%rbp), %rdx                               #6.32
        movl      (%rdx), %edx                                  #6.32
        cmpl      %edx, %eax                                    #6.32
        jle       ..B1.12       # Prob 50%                      #6.32
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.7
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #7.17
        addl      -28(%rbp), %eax                               #7.34
        movslq    %eax, %rax                                    #7.24
        imulq     $4, %rax, %rax                                #7.24
        addq      -16(%rbp), %rax                               #7.24
        movl      (%rax), %eax                                  #7.24
        lfence                                                  #7.24
        movl      %eax, -24(%rbp)                               #7.17
        movl      -28(%rbp), %eax                               #8.40
        movslq    %eax, %rax                                    #8.32
        imulq     $4, %rax, %rax                                #8.32
        addq      -16(%rbp), %rax                               #8.32
        movl      $-1, %edx                                     #8.17
        addl      -28(%rbp), %edx                               #8.27
        movslq    %edx, %rdx                                    #8.17
        imulq     $4, %rdx, %rdx                                #8.17
        addq      -16(%rbp), %rdx                               #8.17
        movl      (%rax), %eax                                  #8.32
        movl      %eax, (%rdx)                                  #8.17
        movl      -28(%rbp), %eax                               #9.25
        movslq    %eax, %rax                                    #9.17
        imulq     $4, %rax, %rax                                #9.17
        addq      -16(%rbp), %rax                               #9.17
        movl      -24(%rbp), %edx                               #9.30
        movl      %edx, (%rax)                                  #9.17
        jmp       ..B1.6        # Prob 100%                     #9.17
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.9:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        leave                                                   #13.1
	.cfi_restore 6
        ret                                                     #13.1
	.cfi_offset 6, -16
                                # LOE
..B1.12:                        # Preds ..B1.7
                                # Execution count [0.00e+00]
        jmp       ..B1.6        # Prob 100%                     #
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
	.cfi_endproc
# mark_end;
	.type	bubbleSort,@function
	.size	bubbleSort,.-bubbleSort
..LNbubbleSort.0:
	.data
# -- End  bubbleSort
	.data
	.section .note.GNU-stack, ""
# End

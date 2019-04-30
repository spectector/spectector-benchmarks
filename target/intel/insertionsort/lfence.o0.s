# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/insertionsort/lfence.o0.s";
	.file "insertionsort.c"
	.text
..TXTST0:
.L_2__routine_start_insertionSort_0:
# -- Begin  insertionSort
	.text
# mark_begin;

	.globl insertionSort
# --- insertionSort(int *, int)
insertionSort:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_insertionSort.1:
..L2:
                                                          #1.44
        pushq     %rbp                                          #1.44
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #1.44
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $32, %rsp                                     #1.44
        movq      %rdi, -16(%rbp)                               #1.44
        movl      %esi, -8(%rbp)                                #1.44
        movl      $1, -32(%rbp)                                 #3.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.7 ..B1.1
                                # Execution count [0.00e+00]
        movl      -32(%rbp), %eax                               #3.17
        movl      -8(%rbp), %edx                                #3.21
        cmpl      %edx, %eax                                    #3.21
        jge       ..B1.8        # Prob 50%                      #3.21
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      -32(%rbp), %eax                               #5.19
        movslq    %eax, %rax                                    #5.17
        imulq     $4, %rax, %rax                                #5.17
        addq      -16(%rbp), %rax                               #5.17
        movl      (%rax), %eax                                  #5.17
        lfence                                                  #5.17
        movl      %eax, -28(%rbp)                               #5.9
        movl      -32(%rbp), %eax                               #6.18
        movl      %eax, -24(%rbp)                               #6.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.6 ..B1.3
                                # Execution count [0.00e+00]
        movl      -24(%rbp), %eax                               #6.21
        testl     %eax, %eax                                    #6.25
        jle       ..B1.7        # Prob 50%                      #6.25
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #6.9
        addl      -24(%rbp), %eax                               #6.34
        movslq    %eax, %rax                                    #6.30
        imulq     $4, %rax, %rax                                #6.30
        addq      -16(%rbp), %rax                               #6.30
        movl      (%rax), %eax                                  #6.30
        lfence                                                  #6.30
        movl      -28(%rbp), %edx                               #6.39
        cmpl      %edx, %eax                                    #6.39
        jle       ..B1.7        # Prob 50%                      #6.39
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #7.13
        addl      -24(%rbp), %eax                               #7.24
        movslq    %eax, %rax                                    #7.20
        imulq     $4, %rax, %rax                                #7.20
        addq      -16(%rbp), %rax                               #7.20
        movl      -24(%rbp), %edx                               #7.15
        movslq    %edx, %rdx                                    #7.13
        imulq     $4, %rdx, %rdx                                #7.13
        addq      -16(%rbp), %rdx                               #7.13
        movl      (%rax), %eax                                  #7.20
        lfence                                                  #7.20
        movl      %eax, (%rdx)                                  #7.13
        movl      $-1, %eax                                     #6.46
        addl      -24(%rbp), %eax                               #6.46
        movl      %eax, -24(%rbp)                               #6.46
        jmp       ..B1.4        # Prob 100%                     #6.46
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.5 ..B1.4
                                # Execution count [0.00e+00]
        movl      -24(%rbp), %eax                               #9.11
        movslq    %eax, %rax                                    #9.9
        imulq     $4, %rax, %rax                                #9.9
        addq      -16(%rbp), %rax                               #9.9
        movl      -28(%rbp), %edx                               #9.16
        movl      %edx, (%rax)                                  #9.9
        movl      $1, %eax                                      #3.35
        addl      -32(%rbp), %eax                               #3.35
        movl      %eax, -32(%rbp)                               #3.35
        jmp       ..B1.2        # Prob 100%                     #3.35
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        leave                                                   #11.1
	.cfi_restore 6
        ret                                                     #11.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	insertionSort,@function
	.size	insertionSort,.-insertionSort
..LNinsertionSort.0:
	.data
# -- End  insertionSort
	.data
	.section .note.GNU-stack, ""
# End

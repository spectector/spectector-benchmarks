# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/bubblesort/any.o0.s";
	.file "bubblesort.c"
	.text
..TXTST0:
.L_2__routine_start_bubbleSort_0:
# -- Begin  bubbleSort
	.text
# mark_begin;

	.globl bubbleSort
# --- bubbleSort()
bubbleSort:
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_bubbleSort.1:
..L2:
                                                          #4.18
        pushq     %rbp                                          #4.18
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #4.18
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #4.18
        movl      $-1, %eax                                     #7.10
        addl      array_size(%rip), %eax                        #7.28
        movl      %eax, -16(%rbp)                               #7.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.3 ..B1.1
                                # Execution count [0.00e+00]
        movl      -16(%rbp), %eax                               #7.32
        testl     %eax, %eax                                    #7.37
        jge       ..B1.4        # Prob 50%                      #7.37
        jmp       ..B1.9        # Prob 100%                     #7.37
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #7.40
        addl      -16(%rbp), %eax                               #7.40
        movl      %eax, -16(%rbp)                               #7.40
        jmp       ..B1.2        # Prob 100%                     #7.40
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      $1, -12(%rbp)                                 #8.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.6 ..B1.4
                                # Execution count [0.00e+00]
        movl      -12(%rbp), %eax                               #8.21
        movl      -16(%rbp), %edx                               #8.26
        cmpl      %edx, %eax                                    #8.26
        jle       ..B1.7        # Prob 50%                      #8.26
        jmp       ..B1.3        # Prob 100%                     #8.26
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.8 ..B1.7
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #8.29
        addl      -12(%rbp), %eax                               #8.29
        movl      %eax, -12(%rbp)                               #8.29
        jmp       ..B1.5        # Prob 100%                     #8.29
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #9.13
        addl      -12(%rbp), %eax                               #9.27
        movslq    %eax, %rax                                    #9.17
        imulq     $4, %rax, %rax                                #9.17
        movl      $numbers, %edx                                #9.17
        addq      %rax, %rdx                                    #9.17
        movl      (%rdx), %eax                                  #9.17
        movl      -12(%rbp), %edx                               #9.40
        movslq    %edx, %rdx                                    #9.32
        imulq     $4, %rdx, %rdx                                #9.32
        movl      $numbers, %ecx                                #9.32
        addq      %rdx, %rcx                                    #9.32
        movl      (%rcx), %edx                                  #9.32
        cmpl      %edx, %eax                                    #9.32
        jle       ..B1.6        # Prob 50%                      #9.32
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.7
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #10.17
        addl      -12(%rbp), %eax                               #10.34
        movslq    %eax, %rax                                    #10.24
        imulq     $4, %rax, %rax                                #10.24
        movl      $numbers, %edx                                #10.24
        addq      %rax, %rdx                                    #10.24
        movl      (%rdx), %eax                                  #10.24
        movl      %eax, -8(%rbp)                                #10.17
        movl      -12(%rbp), %eax                               #11.40
        movslq    %eax, %rax                                    #11.32
        imulq     $4, %rax, %rax                                #11.32
        movl      $numbers, %edx                                #11.32
        addq      %rax, %rdx                                    #11.32
        movl      $-1, %eax                                     #11.17
        addl      -12(%rbp), %eax                               #11.27
        movslq    %eax, %rax                                    #11.17
        imulq     $4, %rax, %rax                                #11.17
        movl      $numbers, %ecx                                #11.17
        addq      %rax, %rcx                                    #11.17
        movl      (%rdx), %eax                                  #11.32
        movl      %eax, (%rcx)                                  #11.17
        movl      -12(%rbp), %eax                               #12.25
        movslq    %eax, %rax                                    #12.17
        imulq     $4, %rax, %rax                                #12.17
        movl      $numbers, %edx                                #12.17
        addq      %rax, %rdx                                    #12.17
        movl      -8(%rbp), %eax                                #12.30
        movl      %eax, (%rdx)                                  #12.17
        jmp       ..B1.6        # Prob 100%                     #12.17
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.9:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        leave                                                   #16.1
	.cfi_restore 6
        ret                                                     #16.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	bubbleSort,@function
	.size	bubbleSort,.-bubbleSort
..LNbubbleSort.0:
	.data
# -- End  bubbleSort
	.data
	.align 4
	.align 4
	.globl numbers
numbers:
	.long	1
	.type	numbers,@object
	.size	numbers,4
	.align 4
	.globl array_size
array_size:
	.long	1
	.type	array_size,@object
	.size	array_size,4
	.data
	.section .note.GNU-stack, ""
# End

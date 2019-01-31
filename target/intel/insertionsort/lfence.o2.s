# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/insertionsort/lfence.o2.s";
	.file "insertionsort.c"
	.text
..TXTST0:
.L_2__routine_start_insertionSort_0:
# -- Begin  insertionSort
	.text
# mark_begin;
       .align    16,0x90
	.globl insertionSort
# --- insertionSort(int *, int)
insertionSort:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_insertionSort.1:
..L2:
                                                          #1.44
        movl      $1, %ecx                                      #3.10
        movslq    %esi, %rsi                                    #1.44
        cmpq      $1, %rsi                                      #3.21
        jle       ..B1.10       # Prob 10%                      #3.21
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [8.81e-01]
        lfence                                                  #1.44
        movq      %rcx, %rax                                    #6.14
        movl      4(%rdi), %edx                                 #5.17
                                # LOE rax rcx rbx rbp rsi rdi r12 r13 r14 r15 edx
..B1.3:                         # Preds ..B1.2 ..B1.8
                                # Execution count [1.42e+01]
        movl      -4(%rdi,%rax,4), %r8d                         #6.30
        cmpl      %edx, %r8d                                    #6.39
        jle       ..B1.6        # Prob 20%                      #6.39
                                # LOE rax rcx rbx rbp rsi rdi r12 r13 r14 r15 edx r8d
..B1.4:                         # Preds ..B1.3
                                # Execution count [1.14e+01]
        movl      %r8d, (%rdi,%rax,4)                           #7.13
        decq      %rax                                          #6.46
        testq     %rax, %rax                                    #6.25
        jg        ..B1.8        # Prob 82%                      #6.25
                                # LOE rax rcx rbx rbp rsi rdi r12 r13 r14 r15 edx
..B1.6:                         # Preds ..B1.7 ..B1.3 ..B1.4
                                # Execution count [5.00e+00]: Infreq
        incq      %rcx                                          #3.35
        movl      %edx, (%rdi,%rax,4)                           #9.9
        cmpq      %rsi, %rcx                                    #3.21
        jge       ..B1.10       # Prob 18%                      #3.21
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
                                # Execution count [4.10e+00]: Infreq
        movq      %rcx, %rax                                    #6.14
        movl      (%rdi,%rcx,4), %edx                           #5.17
        lfence                                                  #5.17
        testq     %rcx, %rcx                                    #6.25
        jle       ..B1.6        # Prob 2%                       #6.25
                                # LOE rax rcx rbx rbp rsi rdi r12 r13 r14 r15 edx
..B1.8:                         # Preds ..B1.4 ..B1.7
                                # Execution count [4.02e+00]: Infreq
        .byte     15                                            #1.44
        .byte     31                                            #1.44
        .byte     64                                            #1.44
        .byte     0                                             #1.44
        .byte     15                                            #1.44
        .byte     31                                            #1.44
        .byte     128                                           #1.44
        .byte     0                                             #1.44
        .byte     0                                             #1.44
        .byte     0                                             #1.44
        .byte     0                                             #1.44
        lfence                                                  #1.44
        jmp       ..B1.3        # Prob 100%                     #1.44
                                # LOE rax rcx rbx rbp rsi rdi r12 r13 r14 r15 edx
..B1.10:                        # Preds ..B1.1 ..B1.6
                                # Execution count [1.00e+00]: Infreq
        ret                                                     #11.1
        .align    16,0x90
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

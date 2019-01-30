# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/insertionsort/any.o2.s";
	.file "insertionsort.c"
	.text
..TXTST0:
.L_2__routine_start_insertionSort_0:
# -- Begin  insertionSort
	.text
# mark_begin;
       .align    16,0x90
	.globl insertionSort
# --- insertionSort()
insertionSort:
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_insertionSort.1:
..L2:
                                                          #5.1
        movl      $1, %esi                                      #7.10
        movslq    array_size(%rip), %rcx                        #7.21
        cmpq      $1, %rcx                                      #7.21
        jle       ..B1.8        # Prob 10%                      #7.21
                                # LOE rcx rbx rbp rsi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [9.00e-01]
        movl      4+a(%rip), %edx                               #9.17
        movq      %rsi, %rax                                    #10.14
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 edx
..B1.3:                         # Preds ..B1.9 ..B1.2 ..B1.4
                                # Execution count [9.00e-01]
        movl      -4+a(,%rax,4), %edi                           #10.30
        cmpl      %edx, %edi                                    #10.39
        jle       ..B1.6        # Prob 20%                      #10.39
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 edx edi
..B1.4:                         # Preds ..B1.3
                                # Execution count [7.05e-01]
        movl      %edi, a(,%rax,4)                              #11.13
        decq      %rax                                          #10.46
        testq     %rax, %rax                                    #10.25
        jg        ..B1.3        # Prob 0%                       #10.25
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 edx
..B1.6:                         # Preds ..B1.3 ..B1.4 ..B1.9
                                # Execution count [9.00e-01]
        incq      %rsi                                          #7.35
        movl      %edx, a(,%rax,4)                              #13.9
        cmpq      %rcx, %rsi                                    #7.21
        jl        ..B1.9        # Prob 0%                       #7.21
                                # LOE rcx rbx rbp rsi r12 r13 r14 r15
..B1.8:                         # Preds ..B1.6 ..B1.1
                                # Execution count [1.00e+00]
        ret                                                     #15.1
                                # LOE
..B1.9:                         # Preds ..B1.6
                                # Execution count [0.00e+00]: Infreq
        movl      a(,%rsi,4), %edx                              #9.17
        movq      %rsi, %rax                                    #10.14
        testq     %rsi, %rsi                                    #10.25
        jle       ..B1.6        # Prob 2%                       #10.25
        jmp       ..B1.3        # Prob 100%                     #10.25
        .align    16,0x90
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 edx
	.cfi_endproc
# mark_end;
	.type	insertionSort,@function
	.size	insertionSort,.-insertionSort
..LNinsertionSort.0:
	.data
# -- End  insertionSort
	.data
	.align 4
	.align 4
	.globl a
a:
	.long	1
	.type	a,@object
	.size	a,4
	.align 4
	.globl array_size
array_size:
	.long	1
	.type	array_size,@object
	.size	array_size,4
	.data
	.section .note.GNU-stack, ""
# End

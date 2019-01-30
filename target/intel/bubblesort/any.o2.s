# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/bubblesort/any.o2.s";
	.file "bubblesort.c"
	.text
..TXTST0:
.L_2__routine_start_bubbleSort_0:
# -- Begin  bubbleSort
	.text
# mark_begin;
       .align    16,0x90
	.globl bubbleSort
# --- bubbleSort()
bubbleSort:
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_bubbleSort.1:
..L2:
                                                          #4.18
        xorl      %ecx, %ecx                                    #7.5
        movl      array_size(%rip), %edi                        #7.15
        movl      %edi, %eax                                    #7.28
        xorl      %edx, %edx                                    #8.14
        decl      %eax                                          #7.28
        js        ..B1.17       # Prob 2%                       #7.37
                                # LOE rbx rbp r12 r13 r14 r15 edx ecx edi
..B1.3:                         # Preds ..B1.1 ..B1.15
                                # Execution count [5.44e+00]
        lea       -1(%rdx,%rdi), %esi                           #7.10
        testl     %esi, %esi                                    #8.26
        jle       ..B1.15       # Prob 50%                      #8.26
                                # LOE rbx rbp r12 r13 r14 r15 edx ecx esi edi
..B1.4:                         # Preds ..B1.3
                                # Execution count [5.44e+00]
        movl      %esi, %r8d                                    #8.9
        movl      $1, %r9d                                      #8.9
        xorl      %eax, %eax                                    #8.9
        shrl      $1, %r8d                                      #8.9
        je        ..B1.12       # Prob 10%                      #8.9
                                # LOE rax rbx rbp r8 r12 r13 r14 r15 edx ecx esi edi r9d
..B1.6:                         # Preds ..B1.4 ..B1.10
                                # Execution count [2.45e+00]
        movl      numbers(,%rax,8), %r9d                        #9.17
        movl      4+numbers(,%rax,8), %r10d                     #9.32
        cmpl      %r10d, %r9d                                   #9.32
        jle       ..B1.8        # Prob 50%                      #9.32
                                # LOE rax rbx rbp r8 r12 r13 r14 r15 edx ecx esi edi r9d r10d
..B1.7:                         # Preds ..B1.6
                                # Execution count [1.22e+00]
        movl      %r10d, numbers(,%rax,8)                       #11.17
        movl      %r9d, %r10d                                   #12.17
        movl      %r9d, 4+numbers(,%rax,8)                      #12.17
                                # LOE rax rbx rbp r8 r12 r13 r14 r15 edx ecx esi edi r10d
..B1.8:                         # Preds ..B1.7 ..B1.6
                                # Execution count [2.45e+00]
        movl      8+numbers(,%rax,8), %r9d                      #9.32
        cmpl      %r9d, %r10d                                   #9.32
        jle       ..B1.10       # Prob 50%                      #9.32
                                # LOE rax rbx rbp r8 r12 r13 r14 r15 edx ecx esi edi r9d r10d
..B1.9:                         # Preds ..B1.8
                                # Execution count [1.22e+00]
        movl      %r9d, 4+numbers(,%rax,8)                      #11.17
        movl      %r10d, 8+numbers(,%rax,8)                     #12.17
                                # LOE rax rbx rbp r8 r12 r13 r14 r15 edx ecx esi edi
..B1.10:                        # Preds ..B1.8 ..B1.9
                                # Execution count [2.45e+00]
        incq      %rax                                          #8.9
        cmpq      %r8, %rax                                     #8.9
        jb        ..B1.6        # Prob 99%                      #8.9
                                # LOE rax rbx rbp r8 r12 r13 r14 r15 edx ecx esi edi
..B1.11:                        # Preds ..B1.10
                                # Execution count [4.90e+00]
        lea       1(%rax,%rax), %r9d                            #9.13
                                # LOE rbx rbp r12 r13 r14 r15 edx ecx esi edi r9d
..B1.12:                        # Preds ..B1.11 ..B1.4
                                # Execution count [5.44e+00]
        lea       -1(%r9), %eax                                 #8.9
        cmpl      %esi, %eax                                    #8.9
        jae       ..B1.15       # Prob 10%                      #8.9
                                # LOE rbx rbp r12 r13 r14 r15 edx ecx edi r9d
..B1.13:                        # Preds ..B1.12
                                # Execution count [4.90e+00]
        movslq    %r9d, %r9                                     #9.17
        movl      numbers(,%r9,4), %eax                         #9.32
        movl      -4+numbers(,%r9,4), %esi                      #9.17
        cmpl      %eax, %esi                                    #9.32
        jle       ..B1.15       # Prob 50%                      #9.32
                                # LOE rbx rbp r9 r12 r13 r14 r15 eax edx ecx esi edi
..B1.14:                        # Preds ..B1.13
                                # Execution count [2.45e+00]
        movl      %eax, -4+numbers(,%r9,4)                      #11.17
        movl      %esi, numbers(,%r9,4)                         #12.17
                                # LOE rbx rbp r12 r13 r14 r15 edx ecx edi
..B1.15:                        # Preds ..B1.13 ..B1.3 ..B1.12 ..B1.14
                                # Execution count [5.44e+00]
        incl      %ecx                                          #7.5
        decl      %edx                                          #7.5
        cmpl      %edi, %ecx                                    #7.5
        jb        ..B1.3        # Prob 82%                      #7.5
                                # LOE rbx rbp r12 r13 r14 r15 edx ecx edi
..B1.17:                        # Preds ..B1.15 ..B1.1
                                # Execution count [1.00e+00]
        ret                                                     #16.1
        .align    16,0x90
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

# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/bubblesort/lfence.o2.s";
	.file "bubblesort.c"
	.text
..TXTST0:
.L_2__routine_start_bubbleSort_0:
# -- Begin  bubbleSort
	.text
# mark_begin;
       .align    16,0x90
	.globl bubbleSort
# --- bubbleSort(int *, int)
bubbleSort:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_bubbleSort.1:
..L2:
                                                          #1.47
        pushq     %r12                                          #1.47
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
        movl      %esi, %eax                                    #4.10
        movq      %rdi, %r11                                    #1.47
        movl      %esi, %ecx                                    #5.14
        xorl      %edi, %edi                                    #4.5
        decl      %eax                                          #4.10
        js        ..B1.48       # Prob 2%                       #4.37
                                # LOE rbx rbp r11 r12 r13 r14 r15 ecx esi edi
..B1.2:                         # Preds ..B1.1
                                # Execution count [9.79e-01]
        movslq    %esi, %r10                                    #5.9
                                # LOE rbx rbp r10 r11 r12 r13 r14 r15 ecx esi edi
..B1.3:                         # Preds ..B1.46 ..B1.2
                                # Execution count [5.44e+00]
        lea       -1(%rcx), %eax                                #4.40
        testl     %eax, %eax                                    #5.26
        jle       ..B1.46       # Prob 50%                      #5.26
                                # LOE rbx rbp r10 r11 r12 r13 r14 r15 ecx esi edi
..B1.4:                         # Preds ..B1.3
                                # Execution count [5.44e+00]
        xorl      %r9d, %r9d                                    #5.9
        lea       -1(%rcx), %edx                                #5.9
        movl      $1, %eax                                      #5.9
        xorl      %r8d, %r8d                                    #5.9
        shrl      $4, %edx                                      #5.9
        je        ..B1.40       # Prob 9%                       #5.9
                                # LOE rdx rbx rbp r8 r9 r10 r11 r12 r13 r14 r15 eax ecx esi edi
..B1.5:                         # Preds ..B1.38 ..B1.4
                                # Execution count [8.50e-03]
        lfence                                                  #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi
..B1.6:                         # Preds ..B1.5
                                # Execution count [1.70e+00]
        movl      (%r8,%r11), %eax                              #6.17
        movl      4(%r8,%r11), %r12d                            #6.32
        cmpl      %r12d, %eax                                   #6.32
        jle       ..B1.53       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.7:                         # Preds ..B1.6
                                # Execution count [8.50e-01]
        lfence                                                  #8.17
        movl      %r12d, (%r8,%r11)                             #8.17
        movl      %eax, %r12d                                   #9.17
        movl      %eax, 4(%r8,%r11)                             #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.8:                         # Preds ..B1.7 ..B1.53
                                # Execution count [1.70e+00]
        movl      8(%r8,%r11), %eax                             #6.32
        cmpl      %eax, %r12d                                   #6.32
        jle       ..B1.54       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.9:                         # Preds ..B1.8
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %eax, 4(%r8,%r11)                             #8.17
        movl      %r12d, %eax                                   #9.17
        movl      %r12d, 8(%r8,%r11)                            #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.10:                        # Preds ..B1.9 ..B1.54
                                # Execution count [1.70e+00]
        movl      12(%r8,%r11), %r12d                           #6.32
        cmpl      %r12d, %eax                                   #6.32
        jle       ..B1.55       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.11:                        # Preds ..B1.10
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %r12d, 8(%r8,%r11)                            #8.17
        movl      %eax, %r12d                                   #9.17
        movl      %eax, 12(%r8,%r11)                            #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.12:                        # Preds ..B1.11 ..B1.55
                                # Execution count [1.70e+00]
        movl      16(%r8,%r11), %eax                            #6.32
        cmpl      %eax, %r12d                                   #6.32
        jle       ..B1.56       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.13:                        # Preds ..B1.12
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %eax, 12(%r8,%r11)                            #8.17
        movl      %r12d, %eax                                   #9.17
        movl      %r12d, 16(%r8,%r11)                           #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.14:                        # Preds ..B1.13 ..B1.56
                                # Execution count [1.70e+00]
        movl      20(%r8,%r11), %r12d                           #6.32
        cmpl      %r12d, %eax                                   #6.32
        jle       ..B1.57       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.15:                        # Preds ..B1.14
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %r12d, 16(%r8,%r11)                           #8.17
        movl      %eax, %r12d                                   #9.17
        movl      %eax, 20(%r8,%r11)                            #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.16:                        # Preds ..B1.15 ..B1.57
                                # Execution count [1.70e+00]
        movl      24(%r8,%r11), %eax                            #6.32
        cmpl      %eax, %r12d                                   #6.32
        jle       ..B1.58       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.17:                        # Preds ..B1.16
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %eax, 20(%r8,%r11)                            #8.17
        movl      %r12d, %eax                                   #9.17
        movl      %r12d, 24(%r8,%r11)                           #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.18:                        # Preds ..B1.17 ..B1.58
                                # Execution count [1.70e+00]
        movl      28(%r8,%r11), %r12d                           #6.32
        cmpl      %r12d, %eax                                   #6.32
        jle       ..B1.59       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.19:                        # Preds ..B1.18
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %r12d, 24(%r8,%r11)                           #8.17
        movl      %eax, %r12d                                   #9.17
        movl      %eax, 28(%r8,%r11)                            #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.20:                        # Preds ..B1.19 ..B1.59
                                # Execution count [1.70e+00]
        movl      32(%r8,%r11), %eax                            #6.32
        cmpl      %eax, %r12d                                   #6.32
        jle       ..B1.60       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.21:                        # Preds ..B1.20
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %eax, 28(%r8,%r11)                            #8.17
        movl      %r12d, %eax                                   #9.17
        movl      %r12d, 32(%r8,%r11)                           #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.22:                        # Preds ..B1.21 ..B1.60
                                # Execution count [1.70e+00]
        movl      36(%r8,%r11), %r12d                           #6.32
        cmpl      %r12d, %eax                                   #6.32
        jle       ..B1.61       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.23:                        # Preds ..B1.22
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %r12d, 32(%r8,%r11)                           #8.17
        movl      %eax, %r12d                                   #9.17
        movl      %eax, 36(%r8,%r11)                            #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.24:                        # Preds ..B1.23 ..B1.61
                                # Execution count [1.70e+00]
        movl      40(%r8,%r11), %eax                            #6.32
        cmpl      %eax, %r12d                                   #6.32
        jle       ..B1.62       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.25:                        # Preds ..B1.24
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %eax, 36(%r8,%r11)                            #8.17
        movl      %r12d, %eax                                   #9.17
        movl      %r12d, 40(%r8,%r11)                           #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.26:                        # Preds ..B1.25 ..B1.62
                                # Execution count [1.70e+00]
        movl      44(%r8,%r11), %r12d                           #6.32
        cmpl      %r12d, %eax                                   #6.32
        jle       ..B1.63       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.27:                        # Preds ..B1.26
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %r12d, 40(%r8,%r11)                           #8.17
        movl      %eax, %r12d                                   #9.17
        movl      %eax, 44(%r8,%r11)                            #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.28:                        # Preds ..B1.27 ..B1.63
                                # Execution count [1.70e+00]
        movl      48(%r8,%r11), %eax                            #6.32
        cmpl      %eax, %r12d                                   #6.32
        jle       ..B1.64       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.29:                        # Preds ..B1.28
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %eax, 44(%r8,%r11)                            #8.17
        movl      %r12d, %eax                                   #9.17
        movl      %r12d, 48(%r8,%r11)                           #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.30:                        # Preds ..B1.29 ..B1.64
                                # Execution count [1.70e+00]
        movl      52(%r8,%r11), %r12d                           #6.32
        cmpl      %r12d, %eax                                   #6.32
        jle       ..B1.65       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.31:                        # Preds ..B1.30
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %r12d, 48(%r8,%r11)                           #8.17
        movl      %eax, %r12d                                   #9.17
        movl      %eax, 52(%r8,%r11)                            #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.32:                        # Preds ..B1.31 ..B1.65
                                # Execution count [1.70e+00]
        movl      56(%r8,%r11), %eax                            #6.32
        cmpl      %eax, %r12d                                   #6.32
        jle       ..B1.66       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.33:                        # Preds ..B1.32
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %eax, 52(%r8,%r11)                            #8.17
        movl      %r12d, %eax                                   #9.17
        movl      %r12d, 56(%r8,%r11)                           #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.34:                        # Preds ..B1.33 ..B1.66
                                # Execution count [1.70e+00]
        movl      60(%r8,%r11), %r12d                           #6.32
        cmpl      %r12d, %eax                                   #6.32
        jle       ..B1.67       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.35:                        # Preds ..B1.34
                                # Execution count [8.50e-01]
        lfence                                                  #7.17
        movl      %r12d, 56(%r8,%r11)                           #8.17
        movl      %eax, %r12d                                   #9.17
        movl      %eax, 60(%r8,%r11)                            #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.36:                        # Preds ..B1.35 ..B1.67
                                # Execution count [1.70e+00]
        movl      64(%r8,%r11), %eax                            #6.32
        cmpl      %eax, %r12d                                   #6.32
        jle       ..B1.38       # Prob 50%                      #6.32
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi r12d
..B1.37:                        # Preds ..B1.36
                                # Execution count [8.50e-01]
        movl      %eax, 60(%r8,%r11)                            #8.17
        movl      %r12d, 64(%r8,%r11)                           #9.17
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi
..B1.38:                        # Preds ..B1.36 ..B1.37
                                # Execution count [1.70e+00]
        incq      %r9                                           #5.9
        addq      $64, %r8                                      #5.9
        cmpq      %rdx, %r9                                     #5.9
        jb        ..B1.5        # Prob 99%                      #5.9
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi
..B1.39:                        # Preds ..B1.38
                                # Execution count [4.90e+00]
        movl      %r9d, %eax                                    #5.9
        shll      $4, %eax                                      #6.13
        incl      %eax                                          #6.13
                                # LOE rbx rbp r10 r11 r12 r13 r14 r15 eax ecx esi edi
..B1.40:                        # Preds ..B1.4 ..B1.39
                                # Execution count [5.44e+00]
        movslq    %eax, %rdx                                    #5.9
        lea       -1(%r10), %rax                                #4.40
        decq      %rdx                                          #5.9
        cmpq      %rax, %rdx                                    #5.9
        jae       ..B1.46       # Prob 9%                       #5.9
                                # LOE rax rdx rbx rbp r10 r11 r12 r13 r14 r15 ecx esi edi
..B1.41:                        # Preds ..B1.44 ..B1.40
                                # Execution count [4.90e+00]
        lfence                                                  #1.47
                                # LOE rax rdx rbx rbp r10 r11 r12 r13 r14 r15 ecx esi edi
..B1.42:                        # Preds ..B1.41
                                # Execution count [7.34e+01]
        movl      (%r11,%rdx,4), %r9d                           #6.17
        movl      4(%r11,%rdx,4), %r8d                          #6.32
        cmpl      %r8d, %r9d                                    #6.32
        jle       ..B1.44       # Prob 50%                      #6.32
                                # LOE rax rdx rbx rbp r10 r11 r12 r13 r14 r15 ecx esi edi r8d r9d
..B1.43:                        # Preds ..B1.42
                                # Execution count [3.67e+01]
        movl      %r8d, (%r11,%rdx,4)                           #8.17
        movl      %r9d, 4(%r11,%rdx,4)                          #9.17
                                # LOE rax rdx rbx rbp r10 r11 r12 r13 r14 r15 ecx esi edi
..B1.44:                        # Preds ..B1.42 ..B1.43
                                # Execution count [7.34e+01]
        incq      %rdx                                          #5.9
        cmpq      %rax, %rdx                                    #5.9
        jb        ..B1.41       # Prob 93%                      #5.9
                                # LOE rax rdx rbx rbp r10 r11 r12 r13 r14 r15 ecx esi edi
..B1.46:                        # Preds ..B1.40 ..B1.3 ..B1.44
                                # Execution count [5.44e+00]
        .byte     15                                            #4.5
        .byte     31                                            #4.5
        .byte     68                                            #4.5
        .byte     0                                             #4.5
        .byte     0                                             #4.5
        incl      %edi                                          #4.5
        decl      %ecx                                          #4.5
        decq      %r10                                          #4.5
        cmpl      %esi, %edi                                    #4.5
        jb        ..B1.3        # Prob 82%                      #4.5
                                # LOE rbx rbp r10 r11 r12 r13 r14 r15 ecx esi edi
..B1.48:                        # Preds ..B1.1 ..B1.46
                                # Execution count [1.00e+00]
	.cfi_restore 12
        popq      %r12                                          #13.1
	.cfi_def_cfa_offset 8
        ret                                                     #13.1
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
                                # LOE
..B1.53:                        # Preds ..B1.6
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.8        # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.54:                        # Preds ..B1.8
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.10       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.55:                        # Preds ..B1.10
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.12       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.56:                        # Preds ..B1.12
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.14       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.57:                        # Preds ..B1.14
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.16       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.58:                        # Preds ..B1.16
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.18       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.59:                        # Preds ..B1.18
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.20       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.60:                        # Preds ..B1.20
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.22       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.61:                        # Preds ..B1.22
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.24       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.62:                        # Preds ..B1.24
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.26       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.63:                        # Preds ..B1.26
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.28       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.64:                        # Preds ..B1.28
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.30       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.65:                        # Preds ..B1.30
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.32       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
..B1.66:                        # Preds ..B1.32
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.34       # Prob 100%                     #1.47
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 eax ecx esi edi
..B1.67:                        # Preds ..B1.34
                                # Execution count [8.50e-01]
        lfence                                                  #1.47
        jmp       ..B1.36       # Prob 100%                     #1.47
        .align    16,0x90
                                # LOE rdx rbx rbp r8 r9 r10 r11 r13 r14 r15 ecx esi edi r12d
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

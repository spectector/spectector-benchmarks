# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/insertionsort/any.o0.s";
	.file "insertionsort.c"
	.text
..TXTST0:
.L_2__routine_start_insertionSort_0:
# -- Begin  insertionSort
	.text
# mark_begin;

	.globl insertionSort
# --- insertionSort()
insertionSort:
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_insertionSort.1:
..L2:
                                                          #5.1
        pushq     %rbp                                          #5.1
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #5.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #5.1
        movl      $1, -16(%rbp)                                 #7.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.7 ..B1.1
                                # Execution count [0.00e+00]
        movl      -16(%rbp), %eax                               #7.17
        movl      array_size(%rip), %edx                        #7.21
        cmpl      %edx, %eax                                    #7.21
        jge       ..B1.8        # Prob 50%                      #7.21
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      -16(%rbp), %eax                               #9.19
        movslq    %eax, %rax                                    #9.17
        imulq     $4, %rax, %rax                                #9.17
        movl      $a, %edx                                      #9.17
        addq      %rax, %rdx                                    #9.17
        movl      (%rdx), %eax                                  #9.17
        movl      %eax, -12(%rbp)                               #9.9
        movl      -16(%rbp), %eax                               #10.18
        movl      %eax, -8(%rbp)                                #10.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.6 ..B1.3
                                # Execution count [0.00e+00]
        movl      -8(%rbp), %eax                                #10.21
        testl     %eax, %eax                                    #10.25
        jle       ..B1.7        # Prob 50%                      #10.25
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #10.9
        addl      -8(%rbp), %eax                                #10.34
        movslq    %eax, %rax                                    #10.30
        imulq     $4, %rax, %rax                                #10.30
        movl      $a, %edx                                      #10.30
        addq      %rax, %rdx                                    #10.30
        movl      (%rdx), %eax                                  #10.30
        movl      -12(%rbp), %edx                               #10.39
        cmpl      %edx, %eax                                    #10.39
        jle       ..B1.7        # Prob 50%                      #10.39
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #11.13
        addl      -8(%rbp), %eax                                #11.24
        movslq    %eax, %rax                                    #11.20
        imulq     $4, %rax, %rax                                #11.20
        movl      $a, %edx                                      #11.20
        addq      %rax, %rdx                                    #11.20
        movl      -8(%rbp), %eax                                #11.15
        movslq    %eax, %rax                                    #11.13
        imulq     $4, %rax, %rax                                #11.13
        movl      $a, %ecx                                      #11.13
        addq      %rax, %rcx                                    #11.13
        movl      (%rdx), %eax                                  #11.20
        movl      %eax, (%rcx)                                  #11.13
        movl      $-1, %eax                                     #10.46
        addl      -8(%rbp), %eax                                #10.46
        movl      %eax, -8(%rbp)                                #10.46
        jmp       ..B1.4        # Prob 100%                     #10.46
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.5 ..B1.4
                                # Execution count [0.00e+00]
        movl      -8(%rbp), %eax                                #13.11
        movslq    %eax, %rax                                    #13.9
        imulq     $4, %rax, %rax                                #13.9
        movl      $a, %edx                                      #13.9
        addq      %rax, %rdx                                    #13.9
        movl      -12(%rbp), %eax                               #13.16
        movl      %eax, (%rdx)                                  #13.9
        movl      $1, %eax                                      #7.35
        addl      -16(%rbp), %eax                               #7.35
        movl      %eax, -16(%rbp)                               #7.35
        jmp       ..B1.2        # Prob 100%                     #7.35
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        leave                                                   #15.1
	.cfi_restore 6
        ret                                                     #15.1
                                # LOE
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

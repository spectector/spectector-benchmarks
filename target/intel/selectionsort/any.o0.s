# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/selectionsort/any.o0.s";
	.file "selectionsort.c"
	.text
..TXTST0:
.L_2__routine_start_SelectionSort_0:
# -- Begin  SelectionSort
	.text
# mark_begin;

	.globl SelectionSort
# --- SelectionSort(int *, int)
SelectionSort:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_SelectionSort.1:
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
        movl      $0, -32(%rbp)                                 #3.8
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.8 ..B1.1
                                # Execution count [0.00e+00]
        movl      -32(%rbp), %eax                               #3.15
        movl      $-1, %edx                                     #3.3
        addl      -8(%rbp), %edx                                #3.32
        cmpl      %edx, %eax                                    #3.32
        jge       ..B1.9        # Prob 50%                      #3.32
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      -32(%rbp), %eax                               #6.13
        movl      %eax, -28(%rbp)                               #6.7
        movl      $1, %eax                                      #7.12
        addl      -32(%rbp), %eax                               #7.18
        movl      %eax, -24(%rbp)                               #7.12
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.5 ..B1.3
                                # Execution count [0.00e+00]
        movl      -24(%rbp), %eax                               #7.21
        movl      -8(%rbp), %edx                                #7.25
        cmpl      %edx, %eax                                    #7.25
        jl        ..B1.6        # Prob 50%                      #7.25
        jmp       ..B1.8        # Prob 100%                     #7.25
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.7 ..B1.6
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #7.39
        addl      -24(%rbp), %eax                               #7.39
        movl      %eax, -24(%rbp)                               #7.39
        jmp       ..B1.4        # Prob 100%                     #7.39
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        movl      -24(%rbp), %eax                               #9.10
        movslq    %eax, %rax                                    #9.8
        imulq     $4, %rax, %rax                                #9.8
        addq      -16(%rbp), %rax                               #9.8
        movl      (%rax), %eax                                  #9.8
        movl      -28(%rbp), %edx                               #9.17
        movslq    %edx, %rdx                                    #9.15
        imulq     $4, %rdx, %rdx                                #9.15
        addq      -16(%rbp), %rdx                               #9.15
        movl      (%rdx), %edx                                  #9.15
        cmpl      %edx, %eax                                    #9.15
        jge       ..B1.5        # Prob 50%                      #9.15
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.6
                                # Execution count [0.00e+00]
        movl      -24(%rbp), %eax                               #10.12
        movl      %eax, -28(%rbp)                               #10.6
        jmp       ..B1.5        # Prob 100%                     #10.6
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        movl      -32(%rbp), %eax                               #13.16
        movslq    %eax, %rax                                    #13.14
        imulq     $4, %rax, %rax                                #13.14
        addq      -16(%rbp), %rax                               #13.14
        movl      (%rax), %eax                                  #13.14
        movl      %eax, -20(%rbp)                               #13.7
        movl      -28(%rbp), %eax                               #14.16
        movslq    %eax, %rax                                    #14.14
        imulq     $4, %rax, %rax                                #14.14
        addq      -16(%rbp), %rax                               #14.14
        movl      -32(%rbp), %edx                               #14.9
        movslq    %edx, %rdx                                    #14.7
        imulq     $4, %rdx, %rdx                                #14.7
        addq      -16(%rbp), %rdx                               #14.7
        movl      (%rax), %eax                                  #14.14
        movl      %eax, (%rdx)                                  #14.7
        movl      -28(%rbp), %eax                               #15.9
        movslq    %eax, %rax                                    #15.7
        imulq     $4, %rax, %rax                                #15.7
        addq      -16(%rbp), %rax                               #15.7
        movl      -20(%rbp), %edx                               #15.16
        movl      %edx, (%rax)                                  #15.7
        movl      $1, %eax                                      #3.37
        addl      -32(%rbp), %eax                               #3.37
        movl      %eax, -32(%rbp)                               #3.37
        jmp       ..B1.2        # Prob 100%                     #3.37
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.9:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        leave                                                   #17.1
	.cfi_restore 6
        ret                                                     #17.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	SelectionSort,@function
	.size	SelectionSort,.-SelectionSort
..LNSelectionSort.0:
	.data
# -- End  SelectionSort
	.data
	.section .note.GNU-stack, ""
# End

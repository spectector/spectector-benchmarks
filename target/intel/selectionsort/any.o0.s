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
# --- SelectionSort()
SelectionSort:
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_SelectionSort.1:
..L2:
                                                          #5.1
        pushq     %rbp                                          #5.1
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #5.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #5.1
        movl      $0, -16(%rbp)                                 #7.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.8 ..B1.1
                                # Execution count [0.00e+00]
        movl      -16(%rbp), %eax                               #7.17
        movl      $-1, %edx                                     #7.5
        addl      array_size(%rip), %edx                        #7.34
        cmpl      %edx, %eax                                    #7.34
        jge       ..B1.9        # Prob 50%                      #7.34
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      -16(%rbp), %eax                               #10.15
        movl      %eax, -12(%rbp)                               #10.9
        movl      $1, %eax                                      #11.14
        addl      -16(%rbp), %eax                               #11.20
        movl      %eax, -8(%rbp)                                #11.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.5 ..B1.3
                                # Execution count [0.00e+00]
        movl      -8(%rbp), %eax                                #11.23
        movl      array_size(%rip), %edx                        #11.27
        cmpl      %edx, %eax                                    #11.27
        jl        ..B1.6        # Prob 50%                      #11.27
        jmp       ..B1.8        # Prob 100%                     #11.27
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.7 ..B1.6
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #11.41
        addl      -8(%rbp), %eax                                #11.41
        movl      %eax, -8(%rbp)                                #11.41
        jmp       ..B1.4        # Prob 100%                     #11.41
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        movl      -8(%rbp), %eax                                #13.19
        movslq    %eax, %rax                                    #13.17
        imulq     $4, %rax, %rax                                #13.17
        movl      $a, %edx                                      #13.17
        addq      %rax, %rdx                                    #13.17
        movl      (%rdx), %eax                                  #13.17
        movl      -12(%rbp), %edx                               #13.26
        movslq    %edx, %rdx                                    #13.24
        imulq     $4, %rdx, %rdx                                #13.24
        movl      $a, %ecx                                      #13.24
        addq      %rdx, %rcx                                    #13.24
        movl      (%rcx), %edx                                  #13.24
        cmpl      %edx, %eax                                    #13.24
        jge       ..B1.5        # Prob 50%                      #13.24
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.6
                                # Execution count [0.00e+00]
        movl      -8(%rbp), %eax                                #14.23
        movl      %eax, -12(%rbp)                               #14.17
        jmp       ..B1.5        # Prob 100%                     #14.17
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        movl      -16(%rbp), %eax                               #17.18
        movslq    %eax, %rax                                    #17.16
        imulq     $4, %rax, %rax                                #17.16
        movl      $a, %edx                                      #17.16
        addq      %rax, %rdx                                    #17.16
        movl      (%rdx), %eax                                  #17.16
        movl      %eax, -4(%rbp)                                #17.9
        movl      -12(%rbp), %eax                               #18.18
        movslq    %eax, %rax                                    #18.16
        imulq     $4, %rax, %rax                                #18.16
        movl      $a, %edx                                      #18.16
        addq      %rax, %rdx                                    #18.16
        movl      -16(%rbp), %eax                               #18.11
        movslq    %eax, %rax                                    #18.9
        imulq     $4, %rax, %rax                                #18.9
        movl      $a, %ecx                                      #18.9
        addq      %rax, %rcx                                    #18.9
        movl      (%rdx), %eax                                  #18.16
        movl      %eax, (%rcx)                                  #18.9
        movl      -12(%rbp), %eax                               #19.11
        movslq    %eax, %rax                                    #19.9
        imulq     $4, %rax, %rax                                #19.9
        movl      $a, %edx                                      #19.9
        addq      %rax, %rdx                                    #19.9
        movl      -4(%rbp), %eax                                #19.18
        movl      %eax, (%rdx)                                  #19.9
        movl      $1, %eax                                      #7.39
        addl      -16(%rbp), %eax                               #7.39
        movl      %eax, -16(%rbp)                               #7.39
        jmp       ..B1.2        # Prob 100%                     #7.39
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.9:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        leave                                                   #21.1
	.cfi_restore 6
        ret                                                     #21.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	SelectionSort,@function
	.size	SelectionSort,.-SelectionSort
..LNSelectionSort.0:
	.data
# -- End  SelectionSort
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

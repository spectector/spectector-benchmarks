# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/selectionsort/lfence.o2.s";
	.file "selectionsort.c"
	.text
..TXTST0:
.L_2__routine_start_SelectionSort_0:
# -- Begin  SelectionSort
	.text
# mark_begin;
       .align    16,0x90
	.globl SelectionSort
# --- SelectionSort(int *, int)
SelectionSort:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_SelectionSort.1:
..L2:
                                                          #1.44
        movl      %esi, %r8d                                    #1.44
        movl      %r8d, %edx                                    #5.7
        xorl      %ecx, %ecx                                    #3.3
        xorl      %eax, %eax                                    #5.7
        lea       -1(%r8), %esi                                 #3.32
        testl     %esi, %esi                                    #3.32
        jle       ..B1.18       # Prob 9%                       #3.32
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx ecx esi r8d
..B1.2:                         # Preds ..B1.1
                                # Execution count [9.00e-01]
        movq      %r15, -24(%rsp)                               #[spill]
        movq      %rbx, -16(%rsp)                               #[spill]
        movq      %rbp, -8(%rsp)                                #[spill]
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	.cfi_offset 15, -32
                                # LOE rax rdi r12 r13 r14 edx ecx esi r8d
..B1.3:                         # Preds ..B1.16 ..B1.2
                                # Execution count [5.00e+00]
        incl      %ecx                                          #7.12
        movq      %rax, %rbp                                    #6.7
        cmpl      %r8d, %ecx                                    #7.25
        jge       ..B1.15       # Prob 50%                      #7.25
                                # LOE rax rbp rdi r12 r13 r14 edx ecx esi r8d
..B1.4:                         # Preds ..B1.3
                                # Execution count [5.00e+00]
        xorl      %r9d, %r9d                                    #7.7
        lea       -1(%rdx), %r10d                               #7.7
        movl      (%rdi,%rax,4), %r11d                          #9.15
        movl      $1, %r15d                                     #7.7
        lfence                                                  #9.15
        xorl      %ebx, %ebx                                    #7.7
        shrl      $1, %r10d                                     #7.7
        je        ..B1.12       # Prob 10%                      #7.7
                                # LOE rax rbx rbp rdi r9 r10 r12 r13 r14 edx ecx esi r8d r11d r15d
..B1.5:                         # Preds ..B1.4
                                # Execution count [4.50e+00]
        lfence                                                  #9.8
        lea       (%rdi,%rax,4), %r15                           #9.8
                                # LOE rax rbx rbp rdi r9 r10 r12 r13 r14 r15 edx ecx esi r8d r11d
..B1.6:                         # Preds ..B1.22 ..B1.5
                                # Execution count [1.25e+01]
        cmpl      4(%r15,%r9,8), %r11d                          #9.15
        jle       ..B1.23       # Prob 50%                      #9.15
                                # LOE rax rbx rbp rdi r9 r10 r12 r13 r14 r15 edx ecx esi r8d r11d
..B1.7:                         # Preds ..B1.6
                                # Execution count [6.25e+00]
        lfence                                                  #10.6
        lea       1(%rax,%rbx), %rbp                            #7.39
        movl      (%rdi,%rbp,4), %r11d                          #9.15
                                # LOE rax rbx rbp rdi r9 r10 r12 r13 r14 r15 edx ecx esi r8d r11d
..B1.8:                         # Preds ..B1.7 ..B1.23
                                # Execution count [1.25e+01]
        cmpl      8(%r15,%r9,8), %r11d                          #9.15
        jle       ..B1.10       # Prob 50%                      #9.15
                                # LOE rax rbx rbp rdi r9 r10 r12 r13 r14 r15 edx ecx esi r8d r11d
..B1.9:                         # Preds ..B1.8
                                # Execution count [6.25e+00]
        lea       2(%rax,%rbx), %rbp                            #7.39
        movl      (%rdi,%rbp,4), %r11d                          #9.15
        lfence                                                  #9.15
                                # LOE rax rbx rbp rdi r9 r10 r12 r13 r14 r15 edx ecx esi r8d r11d
..B1.10:                        # Preds ..B1.8 ..B1.9
                                # Execution count [1.25e+01]
        incq      %r9                                           #7.7
        addq      $2, %rbx                                      #7.7
        cmpq      %r10, %r9                                     #7.7
        jae       ..B1.11       # Prob 36%                      #7.7
                                # LOE rax rbx rbp rdi r9 r10 r12 r13 r14 r15 edx ecx esi r8d r11d
..B1.22:                        # Preds ..B1.10
                                # Execution count [8.00e+00]
        lfence                                                  #1.44
        jmp       ..B1.6        # Prob 100%                     #1.44
                                # LOE rax rbx rbp rdi r9 r10 r12 r13 r14 r15 edx ecx esi r8d r11d
..B1.11:                        # Preds ..B1.10
                                # Execution count [4.50e+00]
        lea       1(%r9,%r9), %r15d                             #9.4
                                # LOE rax rbp rdi r12 r13 r14 edx ecx esi r8d r11d r15d
..B1.12:                        # Preds ..B1.4 ..B1.11
                                # Execution count [5.00e+00]
        lea       -1(%r15), %ebx                                #7.7
        lea       -1(%rdx), %r9d                                #1.44
        cmpl      %r9d, %ebx                                    #7.7
        jae       ..B1.26       # Prob 10%                      #7.7
                                # LOE rax rbp rdi r12 r13 r14 edx ecx esi r8d r11d r15d
..B1.13:                        # Preds ..B1.12
                                # Execution count [4.50e+00]
        movslq    %r15d, %r15                                   #7.39
        lea       (%rax,%r15), %rbx                             #7.39
        movl      (%rdi,%rbx,4), %r9d                           #9.8
        lfence                                                  #9.8
        cmpl      %r11d, %r9d                                   #9.15
        jge       ..B1.26       # Prob 50%                      #9.15
                                # LOE rax rbp rdi r12 r13 r14 r15 edx ecx esi r8d r11d
..B1.14:                        # Preds ..B1.13
                                # Execution count [2.25e+00]
        lfence                                                  #10.6
        lea       (%rax,%r15), %rbp                             #6.7
        movl      (%rdi,%rbp,4), %r11d                          #14.14
        jmp       ..B1.16       # Prob 100%                     #14.14
                                # LOE rax rbp rdi r12 r13 r14 edx ecx esi r8d r11d
..B1.15:                        # Preds ..B1.3
                                # Execution count [2.50e+00]
        lfence                                                  #14.14
        movl      (%rdi,%rax,4), %r11d                          #14.14
                                # LOE rax rbp rdi r12 r13 r14 edx ecx esi r8d r11d
..B1.16:                        # Preds ..B1.14 ..B1.26 ..B1.15
                                # Execution count [5.00e+00]
        movl      (%rdi,%rax,4), %ebx                           #13.14
        decl      %edx                                          #7.12
        movl      %r11d, (%rdi,%rax,4)                          #14.7
        incq      %rax                                          #7.12
        movl      %ebx, (%rdi,%rbp,4)                           #15.7
        cmpl      %esi, %ecx                                    #3.3
        jb        ..B1.3        # Prob 82%                      #3.3
                                # LOE rax rdi r12 r13 r14 edx ecx esi r8d
..B1.17:                        # Preds ..B1.16
                                # Execution count [9.00e-01]
        movq      -24(%rsp), %r15                               #[spill]
	.cfi_restore 15
        movq      -16(%rsp), %rbx                               #[spill]
	.cfi_restore 3
        movq      -8(%rsp), %rbp                                #[spill]
	.cfi_restore 6
                                # LOE rbx rbp r12 r13 r14 r15
..B1.18:                        # Preds ..B1.1 ..B1.17
                                # Execution count [1.00e+00]
        ret                                                     #17.1
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	.cfi_offset 15, -32
                                # LOE
..B1.23:                        # Preds ..B1.6
                                # Execution count [6.25e+00]
        lfence                                                  #1.44
        jmp       ..B1.8        # Prob 100%                     #1.44
                                # LOE rax rbx rbp rdi r9 r10 r12 r13 r14 r15 edx ecx esi r8d r11d
..B1.26:                        # Preds ..B1.13 ..B1.12
                                # Execution count [5.00e-01]
        lfence                                                  #1.44
        jmp       ..B1.16       # Prob 100%                     #1.44
        .align    16,0x90
                                # LOE rax rbp rdi r12 r13 r14 edx ecx esi r8d r11d
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

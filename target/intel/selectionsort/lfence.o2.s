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
# --- SelectionSort()
SelectionSort:
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_SelectionSort.1:
..L2:
                                                          #5.1
        xorl      %r8d, %r8d                                    #7.5
        movl      array_size(%rip), %r11d                       #7.21
        xorl      %r10d, %r10d                                  #9.9
        lea       -1(%r11), %r9d                                #7.34
        testl     %r9d, %r9d                                    #7.34
        jle       ..B1.18       # Prob 10%                      #7.34
                                # LOE rbx rbp r12 r13 r14 r15 r8d r9d r10d r11d
..B1.2:                         # Preds ..B1.1
                                # Execution count [4.50e-03]
        movq      %r12, -24(%rsp)                               #[spill]
	.cfi_offset 12, -32
                                # LOE rbx rbp r13 r14 r15 r8d r9d r10d r11d
..B1.3:                         # Preds ..B1.16 ..B1.2
                                # Execution count [9.00e-01]
        movslq    %r8d, %rcx                                    #10.9
        incl      %r8d                                          #11.14
        cmpl      %r11d, %r8d                                   #11.27
        jge       ..B1.15       # Prob 50%                      #11.27
                                # LOE rcx rbx rbp r13 r14 r15 r8d r9d r10d r11d
..B1.4:                         # Preds ..B1.3
                                # Execution count [9.00e-01]
        movl      $1, %r12d                                     #11.9
        lea       -1(%r11,%r10), %esi                           #11.9
        xorl      %edx, %edx                                    #11.9
        lea       (,%rcx,4), %rdi                               #13.24
        movl      a(%rdi), %eax                                 #13.24
        lfence                                                  #13.24
        shrl      $1, %esi                                      #11.9
        je        ..B1.12       # Prob 10%                      #11.9
                                # LOE rcx rbx rbp rdi r13 r14 r15 eax edx esi r8d r9d r10d r11d r12d
..B1.5:                         # Preds ..B1.4
                                # Execution count [2.03e-03]
        lfence                                                  #5.1
        movq      %r13, -16(%rsp)                               #5.1[spill]
	.cfi_offset 13, -24
                                # LOE rcx rbx rbp rdi r14 r15 eax edx esi r8d r9d r10d r11d
..B1.6:                         # Preds ..B1.22 ..B1.5
                                # Execution count [4.05e-01]
        movslq    %edx, %r13                                    #13.17
        lea       (,%r13,8), %r12                               #13.17
        cmpl      4+a(%r12,%rcx,4), %eax                        #13.24
        jle       ..B1.23       # Prob 50%                      #13.24
                                # LOE rcx rbx rbp rdi r12 r13 r14 r15 eax edx esi r8d r9d r10d r11d
..B1.7:                         # Preds ..B1.6
                                # Execution count [2.02e-01]
        lfence                                                  #5.1
        lea       (%rcx,%r13,2), %rax                           #11.41
        lea       4(,%rax,4), %rdi                              #13.24
        movl      a(%rdi), %eax                                 #13.24
                                # LOE rcx rbx rbp rdi r12 r13 r14 r15 eax edx esi r8d r9d r10d r11d
..B1.8:                         # Preds ..B1.7 ..B1.23
                                # Execution count [4.05e-01]
        cmpl      8+a(%r12,%rcx,4), %eax                        #13.24
        jle       ..B1.10       # Prob 50%                      #13.24
                                # LOE rcx rbx rbp rdi r13 r14 r15 eax edx esi r8d r9d r10d r11d
..B1.9:                         # Preds ..B1.8
                                # Execution count [2.02e-01]
        lea       (%rcx,%r13,2), %rax                           #11.41
        lea       8(,%rax,4), %rdi                              #13.24
        movl      a(%rdi), %eax                                 #13.24
        lfence                                                  #13.24
                                # LOE rcx rbx rbp rdi r14 r15 eax edx esi r8d r9d r10d r11d
..B1.10:                        # Preds ..B1.8 ..B1.9
                                # Execution count [4.05e-01]
        incl      %edx                                          #11.9
        cmpl      %esi, %edx                                    #11.9
        jae       ..B1.11       # Prob 0%                       #11.9
                                # LOE rcx rbx rbp rdi r14 r15 eax edx esi r8d r9d r10d r11d
..B1.22:                        # Preds ..B1.10
                                # Execution count [4.03e-01]
        lfence                                                  #5.1
        jmp       ..B1.6        # Prob 100%                     #5.1
                                # LOE rcx rbx rbp rdi r14 r15 eax edx esi r8d r9d r10d r11d
..B1.11:                        # Preds ..B1.10
                                # Execution count [8.10e-01]
        movq      -16(%rsp), %r13                               #[spill]
	.cfi_restore 13
        lea       1(%rdx,%rdx), %r12d                           #13.13
                                # LOE rcx rbx rbp rdi r13 r14 r15 eax r8d r9d r10d r11d r12d
..B1.12:                        # Preds ..B1.4 ..B1.11
                                # Execution count [9.00e-01]
        lea       -1(%r12), %edx                                #11.9
        lea       -1(%r11,%r10), %esi                           #7.21
        cmpl      %esi, %edx                                    #11.9
        jae       ..B1.26       # Prob 10%                      #11.9
                                # LOE rcx rbx rbp rdi r13 r14 r15 eax r8d r9d r10d r11d r12d
..B1.13:                        # Preds ..B1.12
                                # Execution count [8.10e-01]
        movslq    %r12d, %r12                                   #13.17
        lea       (%rcx,%r12), %rdx                             #13.17
        movl      a(,%rdx,4), %esi                              #13.17
        lfence                                                  #13.17
        cmpl      %eax, %esi                                    #13.24
        jge       ..B1.26       # Prob 50%                      #13.24
                                # LOE rcx rbx rbp rdi r12 r13 r14 r15 eax r8d r9d r10d r11d
..B1.14:                        # Preds ..B1.13
                                # Execution count [4.05e-01]
        lfence                                                  #5.1
        lea       -1(%rcx,%r12), %rax                           #11.41
        lea       4(,%rax,4), %rdi                              #18.16
        movl      a(%rdi), %eax                                 #18.16
        jmp       ..B1.16       # Prob 100%                     #18.16
                                # LOE rcx rbx rbp rdi r13 r14 r15 eax r8d r9d r10d r11d
..B1.15:                        # Preds ..B1.3
                                # Execution count [4.50e-01]
        lfence                                                  #5.1
        lea       (,%rcx,4), %rdi                               #18.16
        movl      a(%rdi), %eax                                 #18.16
                                # LOE rcx rbx rbp rdi r13 r14 r15 eax r8d r9d r10d r11d
..B1.16:                        # Preds ..B1.14 ..B1.26 ..B1.15
                                # Execution count [9.00e-01]
        movl      a(,%rcx,4), %edx                              #17.16
        decl      %r10d                                         #11.14
        movl      %eax, a(,%rcx,4)                              #18.9
        movl      %edx, a(%rdi)                                 #19.9
        cmpl      %r9d, %r8d                                    #7.5
        jb        ..B1.3        # Prob 99%                      #7.5
                                # LOE rbx rbp r13 r14 r15 r8d r9d r10d r11d
..B1.17:                        # Preds ..B1.16
                                # Execution count [4.50e-03]
        movq      -24(%rsp), %r12                               #[spill]
	.cfi_restore 12
                                # LOE rbx rbp r12 r13 r14 r15
..B1.18:                        # Preds ..B1.1 ..B1.17
                                # Execution count [1.00e+00]
        ret                                                     #21.1
	.cfi_offset 12, -32
	.cfi_offset 13, -24
                                # LOE
..B1.23:                        # Preds ..B1.6
                                # Execution count [2.02e-01]
        lfence                                                  #5.1
        jmp       ..B1.8        # Prob 100%                     #5.1
	.cfi_restore 13
                                # LOE rcx rbx rbp rdi r12 r13 r14 r15 eax edx esi r8d r9d r10d r11d
..B1.26:                        # Preds ..B1.13 ..B1.12
                                # Execution count [9.00e-02]
        lfence                                                  #5.1
        jmp       ..B1.16       # Prob 100%                     #5.1
        .align    16,0x90
                                # LOE rcx rbx rbp rdi r13 r14 r15 eax r8d r9d r10d r11d
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

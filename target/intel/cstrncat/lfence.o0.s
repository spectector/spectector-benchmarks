# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/cstrncat/lfence.o0.s";
	.file "cstrncat.c"
	.text
..TXTST0:
.L_2__routine_start_cstrncat_0:
# -- Begin  cstrncat
	.text
# mark_begin;

	.globl cstrncat
# --- cstrncat(char *, const char *, int)
cstrncat:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %edx
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_cstrncat.1:
..L2:
                                                          #1.50
        pushq     %rbp                                          #1.50
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #1.50
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $48, %rsp                                     #1.50
        lfence                                                  #1.50
        movq      %rdi, -40(%rbp)                               #1.50
        movq      %rsi, -32(%rbp)                               #1.50
        movl      %edx, -24(%rbp)                               #1.50
        movq      -40(%rbp), %rax                               #2.13
        movq      %rax, -16(%rbp)                               #2.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.3 ..B1.1
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #4.11
        movsbl    (%rax), %eax                                  #4.11
        movsbq    %al, %rax                                     #4.11
        testl     %eax, %eax                                    #4.16
        je        ..B1.15       # Prob 50%                      #4.16
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        lfence                                                  #1.50
        movl      $1, %eax                                      #5.5
        addq      -16(%rbp), %rax                               #5.5
        movq      %rax, -16(%rbp)                               #5.5
        jmp       ..B1.2        # Prob 100%                     #5.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.15:                        # Preds ..B1.2
                                # Execution count [0.00e+00]
..B1.4:                         # Preds ..B1.15 ..B1.9
                                # Execution count [0.00e+00]
        movl      -24(%rbp), %eax                               #11.10
        testl     %eax, %eax                                    #11.15
        je        ..B1.10       # Prob 50%                      #11.15
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        movq      -32(%rbp), %rax                               #11.27
        movsbl    (%rax), %eax                                  #11.27
        lfence                                                  #11.27
        movb      %al, -48(%rbp)                                #11.22
        movq      -16(%rbp), %rax                               #11.22
        movsbl    -48(%rbp), %edx                               #11.22
        movb      %dl, (%rax)                                   #11.22
        movsbl    -48(%rbp), %eax                               #11.22
        movsbq    %al, %rax                                     #11.22
        testl     %eax, %eax                                    #11.36
        jne       ..B1.7        # Prob 50%                      #11.36
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movl      $0, -44(%rbp)                                 #11.36
        jmp       ..B1.8        # Prob 100%                     #11.36
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movl      $1, -44(%rbp)                                 #11.36
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.7 ..B1.6
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #11.27
        addq      -32(%rbp), %rax                               #11.27
        movq      %rax, -32(%rbp)                               #11.27
        movl      -44(%rbp), %eax                               #11.36
        testl     %eax, %eax                                    #11.36
        je        ..B1.10       # Prob 50%                      #11.36
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.9:                         # Preds ..B1.8
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #12.5
        addl      -24(%rbp), %eax                               #12.5
        movl      %eax, -24(%rbp)                               #12.5
        movl      $1, %eax                                      #13.5
        addq      -16(%rbp), %rax                               #13.5
        movq      %rax, -16(%rbp)                               #13.5
        jmp       ..B1.4        # Prob 100%                     #13.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.10:                        # Preds ..B1.8 ..B1.4
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #15.8
        movsbl    (%rax), %eax                                  #15.8
        lfence                                                  #15.8
        movsbq    %al, %rax                                     #15.8
        testl     %eax, %eax                                    #15.13
        je        ..B1.16       # Prob 50%                      #15.13
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.11:                        # Preds ..B1.10
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #16.6
        movb      $0, (%rax)                                    #16.6
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.12:                        # Preds ..B1.11 ..B1.16
                                # Execution count [0.00e+00]
        movq      -40(%rbp), %rax                               #17.10
        leave                                                   #17.10
	.cfi_restore 6
        ret                                                     #17.10
	.cfi_offset 6, -16
                                # LOE
..B1.16:                        # Preds ..B1.10
                                # Execution count [0.00e+00]
        jmp       ..B1.12       # Prob 100%                     #
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
	.cfi_endproc
# mark_end;
	.type	cstrncat,@function
	.size	cstrncat,.-cstrncat
..LNcstrncat.0:
	.data
# -- End  cstrncat
	.data
	.section .note.GNU-stack, ""
# End

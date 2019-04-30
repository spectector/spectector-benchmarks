# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/wildcard/lfence.o0.s";
	.file "wildcard.c"
	.text
..TXTST0:
.L_2__routine_start_wildcardcmp_0:
# -- Begin  wildcardcmp
	.text
# mark_begin;

	.globl wildcardcmp
# --- wildcardcmp(const char *, const char *)
wildcardcmp:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_wildcardcmp.1:
..L2:
                                                          #4.58
        pushq     %rbp                                          #4.58
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #4.58
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $48, %rsp                                     #4.58
        movq      %rdi, -48(%rbp)                               #4.58
        movq      %rsi, -40(%rbp)                               #4.58
        movq      $0, -32(%rbp)                                 #5.17
        movq      $0, -24(%rbp)                                 #6.17
        movq      -48(%rbp), %rax                               #9.8
        testq     %rax, %rax                                    #9.8
        je        ..B1.3        # Prob 50%                      #9.8
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movq      -40(%rbp), %rax                               #9.20
        testq     %rax, %rax                                    #9.20
        jne       ..B1.22       # Prob 50%                      #9.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.1 ..B1.2
                                # Execution count [0.00e+00]
        movl      $0, %eax                                      #9.35
        leave                                                   #9.35
	.cfi_restore 6
        ret                                                     #9.35
	.cfi_offset 6, -16
                                # LOE
..B1.4:                         # Preds ..B1.23 ..B1.18 ..B1.10 ..B1.16 ..B1.22
                                #      
                                # Execution count [0.00e+00]
        movl      $0, %eax                                      #12.3
        cmpl      $1, %eax                                      #12.3
        je        ..B1.19       # Prob 100%                     #12.3
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        movq      -40(%rbp), %rax                               #13.11
        movsbl    (%rax), %eax                                  #13.11
        lfence                                                  #13.11
        movsbq    %al, %rax                                     #13.11
        testl     %eax, %eax                                    #13.11
        jne       ..B1.11       # Prob 50%                      #13.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movq      -48(%rbp), %rax                               #14.13
        movsbl    (%rax), %eax                                  #14.13
        lfence                                                  #14.13
        movsbq    %al, %rax                                     #14.13
        testl     %eax, %eax                                    #14.13
        jne       ..B1.8        # Prob 50%                      #14.13
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.6
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #14.29
        leave                                                   #14.29
	.cfi_restore 6
        ret                                                     #14.29
	.cfi_offset 6, -16
                                # LOE
..B1.8:                         # Preds ..B1.6
                                # Execution count [0.00e+00]
        movq      -24(%rbp), %rax                               #15.13
        movsbl    (%rax), %eax                                  #15.13
        lfence                                                  #15.13
        movsbq    %al, %rax                                     #15.13
        testl     %eax, %eax                                    #15.13
        jne       ..B1.10       # Prob 50%                      #15.13
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.9:                         # Preds ..B1.8
                                # Execution count [0.00e+00]
        movl      $0, %eax                                      #15.23
        leave                                                   #15.23
	.cfi_restore 6
        ret                                                     #15.23
	.cfi_offset 6, -16
                                # LOE
..B1.10:                        # Preds ..B1.8
                                # Execution count [0.00e+00]
        movq      -24(%rbp), %rax                               #16.16
        movq      %rax, -40(%rbp)                               #16.7
        movl      $1, %eax                                      #16.16
        addq      -24(%rbp), %rax                               #16.16
        movq      %rax, -24(%rbp)                               #16.16
        movq      -32(%rbp), %rax                               #17.17
        movq      %rax, -48(%rbp)                               #17.7
        jmp       ..B1.4        # Prob 100%                     #17.7
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.11:                        # Preds ..B1.5
                                # Execution count [0.00e+00]
        movq      -48(%rbp), %rax                               #20.12
        movsbl    (%rax), %eax                                  #20.12
        lfence                                                  #20.12
        movsbq    %al, %rax                                     #20.12
        movq      -40(%rbp), %rdx                               #20.24
        movsbl    (%rdx), %edx                                  #20.24
        movsbq    %dl, %rdx                                     #20.24
        cmpl      %edx, %eax                                    #20.24
        je        ..B1.18       # Prob 50%                      #20.24
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.12:                        # Preds ..B1.11
                                # Execution count [0.00e+00]
        movq      -48(%rbp), %rax                               #21.21
        movsbl    (%rax), %eax                                  #21.21
        lfence                                                  #21.21
        movsbq    %al, %rax                                     #21.21
        cmpl      $42, %eax                                     #21.21
        jne       ..B1.15       # Prob 50%                      #21.21
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.13:                        # Preds ..B1.12
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #22.17
        addq      -48(%rbp), %rax                               #22.17
        movq      %rax, -16(%rbp)                               #22.17
        movq      -16(%rbp), %rax                               #22.17
        movq      %rax, -48(%rbp)                               #22.17
        movq      -16(%rbp), %rax                               #22.17
        movq      %rax, -32(%rbp)                               #22.11
        movq      -40(%rbp), %rax                               #23.15
        movq      %rax, -24(%rbp)                               #23.11
        movq      -48(%rbp), %rax                               #25.16
        movsbl    (%rax), %eax                                  #25.16
        lfence                                                  #25.16
        movsbq    %al, %rax                                     #25.16
        testl     %eax, %eax                                    #25.16
        je        ..B1.14       # Prob 50%                      #25.16
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.23:                        # Preds ..B1.13
                                # Execution count [0.00e+00]
        jmp       ..B1.4        # Prob 100%                     #
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.14:                        # Preds ..B1.13
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #26.18
        leave                                                   #26.18
	.cfi_restore 6
        ret                                                     #26.18
	.cfi_offset 6, -16
                                # LOE
..B1.15:                        # Preds ..B1.12
                                # Execution count [0.00e+00]
        movq      -32(%rbp), %rax                               #27.20
        testq     %rax, %rax                                    #27.20
        je        ..B1.17       # Prob 50%                      #27.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.16:                        # Preds ..B1.15
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #28.11
        addq      -40(%rbp), %rax                               #28.11
        movq      %rax, -40(%rbp)                               #28.11
        jmp       ..B1.4        # Prob 100%                     #28.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.17:                        # Preds ..B1.15
                                # Execution count [0.00e+00]
        movl      $0, %eax                                      #32.16
        leave                                                   #32.16
	.cfi_restore 6
        ret                                                     #32.16
	.cfi_offset 6, -16
                                # LOE
..B1.18:                        # Preds ..B1.11
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #36.5
        addq      -40(%rbp), %rax                               #36.5
        movq      %rax, -40(%rbp)                               #36.5
        movl      $1, %eax                                      #37.5
        addq      -48(%rbp), %rax                               #37.5
        movq      %rax, -48(%rbp)                               #37.5
        jmp       ..B1.4        # Prob 100%                     #37.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.19:                        # Preds ..B1.4
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #40.10
        leave                                                   #40.10
	.cfi_restore 6
        ret                                                     #40.10
	.cfi_offset 6, -16
                                # LOE
..B1.22:                        # Preds ..B1.2
                                # Execution count [0.00e+00]
        jmp       ..B1.4        # Prob 100%                     #
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
	.cfi_endproc
# mark_end;
	.type	wildcardcmp,@function
	.size	wildcardcmp,.-wildcardcmp
..LNwildcardcmp.0:
	.data
# -- End  wildcardcmp
	.data
	.section .note.GNU-stack, ""
# End

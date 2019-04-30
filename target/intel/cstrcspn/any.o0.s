# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/cstrcspn/any.o0.s";
	.file "cstrcspn.c"
	.text
..TXTST0:
.L_2__routine_start_cstrcspn_0:
# -- Begin  cstrcspn
	.text
# mark_begin;

	.globl cstrcspn
# --- cstrcspn(const char *, const char *)
cstrcspn:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_cstrcspn.1:
..L2:
                                                          #1.47
        pushq     %rbp                                          #1.47
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #1.47
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $48, %rsp                                     #1.47
        movq      %rdi, -40(%rbp)                               #1.47
        movq      %rsi, -32(%rbp)                               #1.47
        movq      -40(%rbp), %rax                               #5.14
        movq      %rax, -24(%rbp)                               #5.8
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.3 ..B1.1
                                # Execution count [0.00e+00]
        movq      -24(%rbp), %rax                               #5.19
        movsbl    (%rax), %eax                                  #5.19
        movsbq    %al, %rax                                     #5.19
        testl     %eax, %eax                                    #5.26
        jne       ..B1.4        # Prob 50%                      #5.26
        jmp       ..B1.10       # Prob 100%                     #5.26
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.8
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #5.32
        addq      -24(%rbp), %rax                               #5.32
        movq      %rax, -24(%rbp)                               #5.32
        jmp       ..B1.2        # Prob 100%                     #5.32
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movq      -32(%rbp), %rax                               #6.9
        movq      %rax, -16(%rbp)                               #6.5
        movq      -24(%rbp), %rax                               #7.10
        movsbl    (%rax), %eax                                  #7.10
        movsbq    %al, %rax                                     #7.10
        movl      %eax, -48(%rbp)                               #7.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.7 ..B1.4
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #8.13
        movsbl    (%rax), %eax                                  #8.13
        movsbq    %al, %rax                                     #8.13
        testl     %eax, %eax                                    #8.18
        je        ..B1.8        # Prob 50%                      #8.18
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #8.27
        movsbl    (%rax), %eax                                  #8.27
        movsbq    %al, %rax                                     #8.27
        movl      -48(%rbp), %edx                               #8.38
        movsbq    %dl, %rdx                                     #8.38
        cmpl      %edx, %eax                                    #8.38
        je        ..B1.8        # Prob 50%                      #8.38
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.6
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #9.7
        addq      -16(%rbp), %rax                               #9.7
        movq      %rax, -16(%rbp)                               #9.7
        jmp       ..B1.5        # Prob 100%                     #9.7
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.6 ..B1.5
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #10.10
        movsbl    (%rax), %eax                                  #10.10
        movsbq    %al, %rax                                     #10.10
        movl      -48(%rbp), %edx                               #10.15
        cmpl      %edx, %eax                                    #10.15
        jne       ..B1.3        # Prob 50%                      #10.15
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.9:                         # Preds ..B1.8
                                # Execution count [0.00e+00]
        movl      -40(%rbp), %eax                               #11.21
        negl      %eax                                          #11.21
        addl      -24(%rbp), %eax                               #11.21
        leave                                                   #11.21
	.cfi_restore 6
        ret                                                     #11.21
	.cfi_offset 6, -16
                                # LOE
..B1.10:                        # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      -40(%rbp), %eax                               #13.16
        negl      %eax                                          #13.16
        addl      -24(%rbp), %eax                               #13.16
        leave                                                   #13.16
	.cfi_restore 6
        ret                                                     #13.16
                                # LOE
	.cfi_endproc
# mark_end;
	.type	cstrcspn,@function
	.size	cstrcspn,.-cstrcspn
..LNcstrcspn.0:
	.data
# -- End  cstrcspn
	.data
	.section .note.GNU-stack, ""
# End

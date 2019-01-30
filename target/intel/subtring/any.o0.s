# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/subtring/any.o0.s";
	.file "subtring.c"
	.text
..TXTST0:
.L_2__routine_start_substring_0:
# -- Begin  substring
	.text
# mark_begin;

	.globl substring
# --- substring(char *, char *)
substring:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_substring.1:
..L2:
                                                          #1.34
        pushq     %rbp                                          #1.34
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #1.34
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $48, %rsp                                     #1.34
        movq      %rdi, -48(%rbp)                               #1.34
        movq      %rsi, -40(%rbp)                               #1.34
        movq      -48(%rbp), %rax                               #2.17
        movq      %rax, -32(%rbp)                               #2.15
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.9 ..B1.1
                                # Execution count [0.00e+00]
        movq      -32(%rbp), %rax                               #3.14
        movsbl    (%rax), %eax                                  #3.14
        movsbq    %al, %rax                                     #3.14
        testl     %eax, %eax                                    #3.20
        je        ..B1.10       # Prob 50%                      #3.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movq      -32(%rbp), %rax                               #4.20
        movq      %rax, -24(%rbp)                               #4.18
        movq      -40(%rbp), %rax                               #5.19
        movq      %rax, -16(%rbp)                               #5.17
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.6 ..B1.3
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #6.16
        movsbl    (%rax), %eax                                  #6.16
        movsbq    %al, %rax                                     #6.16
        testl     %eax, %eax                                    #6.22
        je        ..B1.7        # Prob 50%                      #6.22
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #6.31
        movsbl    (%rax), %eax                                  #6.31
        movsbq    %al, %rax                                     #6.31
        movq      -24(%rbp), %rdx                               #6.38
        movsbl    (%rdx), %edx                                  #6.38
        movsbq    %dl, %rdx                                     #6.38
        cmpl      %edx, %eax                                    #6.38
        jne       ..B1.7        # Prob 50%                      #6.38
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #7.10
        addq      -16(%rbp), %rax                               #7.10
        movq      %rax, -16(%rbp)                               #7.10
        movl      $1, %eax                                      #8.10
        addq      -24(%rbp), %rax                               #8.10
        movq      %rax, -24(%rbp)                               #8.10
        jmp       ..B1.4        # Prob 100%                     #8.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.5 ..B1.4
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #10.13
        movsbl    (%rax), %eax                                  #10.13
        movsbq    %al, %rax                                     #10.13
        testl     %eax, %eax                                    #10.19
        jne       ..B1.9        # Prob 50%                      #10.19
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.7
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #10.32
        leave                                                   #10.32
	.cfi_restore 6
        ret                                                     #10.32
	.cfi_offset 6, -16
                                # LOE
..B1.9:                         # Preds ..B1.7
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #11.8
        addq      -32(%rbp), %rax                               #11.8
        movq      %rax, -32(%rbp)                               #11.8
        jmp       ..B1.2        # Prob 100%                     #11.8
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.10:                        # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      $0, %eax                                      #13.13
        leave                                                   #13.13
	.cfi_restore 6
        ret                                                     #13.13
                                # LOE
	.cfi_endproc
# mark_end;
	.type	substring,@function
	.size	substring,.-substring
..LNsubstring.0:
	.data
# -- End  substring
	.data
	.section .note.GNU-stack, ""
# End

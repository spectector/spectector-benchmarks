# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/crscmp/lfence.o0.s";
	.file "crscmp.c"
	.text
..TXTST0:
.L_2__routine_start_cstrcmp_0:
# -- Begin  cstrcmp
	.text
# mark_begin;

	.globl cstrcmp
# --- cstrcmp(const char *, const char *)
cstrcmp:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_cstrcmp.1:
..L2:
                                                          #1.47
        pushq     %rbp                                          #1.47
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #1.47
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $32, %rsp                                     #1.47
        lfence                                                  #1.47
        movq      %rdi, -24(%rbp)                               #1.47
        movq      %rsi, -16(%rbp)                               #1.47
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.4 ..B1.1
                                # Execution count [0.00e+00]
        movq      -24(%rbp), %rax                               #6.11
        movsbl    (%rax), %eax                                  #6.11
        movsbq    %al, %rax                                     #6.11
        testl     %eax, %eax                                    #6.17
        je        ..B1.5        # Prob 50%                      #6.17
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movq      -24(%rbp), %rax                               #6.26
        movsbl    (%rax), %eax                                  #6.26
        lfence                                                  #6.26
        movsbq    %al, %rax                                     #6.26
        movq      -16(%rbp), %rdx                               #6.33
        movsbl    (%rdx), %edx                                  #6.33
        movsbq    %dl, %rdx                                     #6.33
        cmpl      %edx, %eax                                    #6.33
        jne       ..B1.5        # Prob 50%                      #6.33
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.3
                                # Execution count [0.00e+00]
        lfence                                                  #1.47
        movl      $1, %eax                                      #7.5
        addq      -24(%rbp), %rax                               #7.5
        movq      %rax, -24(%rbp)                               #7.5
        movl      $1, %eax                                      #8.5
        addq      -16(%rbp), %rax                               #8.5
        movq      %rax, -16(%rbp)                               #8.5
        jmp       ..B1.2        # Prob 100%                     #8.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.3 ..B1.2
                                # Execution count [0.00e+00]
        movq      -24(%rbp), %rax                               #12.29
        movzbl    (%rax), %eax                                  #12.29
        lfence                                                  #12.29
        movb      %al, -32(%rbp)                                #12.3
        movq      -16(%rbp), %rax                               #13.29
        movzbl    (%rax), %eax                                  #13.29
        movb      %al, -31(%rbp)                                #13.3
        movzbl    -32(%rbp), %eax                               #14.12
        movzbl    %al, %eax                                     #14.12
        movzbl    -31(%rbp), %edx                               #14.18
        movzbl    %dl, %edx                                     #14.18
        cmpl      %edx, %eax                                    #14.18
        jl        ..B1.9        # Prob 50%                      #14.18
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movzbl    -32(%rbp), %eax                               #14.31
        movzbl    %al, %eax                                     #14.31
        movzbl    -31(%rbp), %edx                               #14.37
        movzbl    %dl, %edx                                     #14.37
        cmpl      %edx, %eax                                    #14.37
        jg        ..B1.8        # Prob 50%                      #14.37
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.6
                                # Execution count [0.00e+00]
        movl      $0, -28(%rbp)                                 #14.18
        jmp       ..B1.10       # Prob 100%                     #14.18
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.6
                                # Execution count [0.00e+00]
        movl      $1, -28(%rbp)                                 #14.18
        jmp       ..B1.10       # Prob 100%                     #14.18
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.9:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movl      $-1, -28(%rbp)                                #14.18
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.10:                        # Preds ..B1.9 ..B1.8 ..B1.7
                                # Execution count [0.00e+00]
        movl      -28(%rbp), %eax                               #14.18
        leave                                                   #14.18
	.cfi_restore 6
        ret                                                     #14.18
                                # LOE
	.cfi_endproc
# mark_end;
	.type	cstrcmp,@function
	.size	cstrcmp,.-cstrcmp
..LNcstrcmp.0:
	.data
# -- End  cstrcmp
	.data
	.section .note.GNU-stack, ""
# End

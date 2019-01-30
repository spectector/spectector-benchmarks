# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/crschr/lfence.o0.s";
	.file "crschr.c"
	.text
..TXTST0:
.L_2__routine_start_cstrchr_0:
# -- Begin  cstrchr
	.text
# mark_begin;

	.globl cstrchr
# --- cstrchr(const char *, int)
cstrchr:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_cstrchr.1:
..L2:
                                                          #1.39
        pushq     %rbp                                          #1.39
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #1.39
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $32, %rsp                                     #1.39
        lfence                                                  #1.39
        movq      %rdi, -32(%rbp)                               #1.39
        movl      %esi, -24(%rbp)                               #1.39
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.4 ..B1.1
                                # Execution count [0.00e+00]
        movq      -32(%rbp), %rax                               #5.14
        movsbl    (%rax), %eax                                  #5.14
        movsbq    %al, %rax                                     #5.14
        testl     %eax, %eax                                    #5.19
        je        ..B1.5        # Prob 50%                      #5.19
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movq      -32(%rbp), %rax                               #5.28
        movsbl    (%rax), %eax                                  #5.28
        lfence                                                  #5.28
        movsbq    %al, %rax                                     #5.28
        movl      -24(%rbp), %edx                               #5.39
        movsbq    %dl, %rdx                                     #5.39
        cmpl      %edx, %eax                                    #5.39
        je        ..B1.5        # Prob 50%                      #5.39
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.3
                                # Execution count [0.00e+00]
        lfence                                                  #1.39
        movl      $1, %eax                                      #6.10
        addq      -32(%rbp), %rax                               #6.10
        movq      %rax, -32(%rbp)                               #6.10
        jmp       ..B1.2        # Prob 100%                     #6.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.3 ..B1.2
                                # Execution count [0.00e+00]
        movq      -32(%rbp), %rax                               #7.17
        movsbl    (%rax), %eax                                  #7.17
        lfence                                                  #7.17
        movsbq    %al, %rax                                     #7.17
        movl      -24(%rbp), %edx                               #7.22
        cmpl      %edx, %eax                                    #7.22
        je        ..B1.7        # Prob 50%                      #7.22
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movq      $0, -16(%rbp)                                 #7.22
        jmp       ..B1.8        # Prob 100%                     #7.22
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        movq      -32(%rbp), %rax                               #7.36
        movq      %rax, -16(%rbp)                               #7.22
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.8:                         # Preds ..B1.7 ..B1.6
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #7.22
        leave                                                   #7.22
	.cfi_restore 6
        ret                                                     #7.22
                                # LOE
	.cfi_endproc
# mark_end;
	.type	cstrchr,@function
	.size	cstrchr,.-cstrchr
..LNcstrchr.0:
	.data
# -- End  cstrchr
	.data
	.section .note.GNU-stack, ""
# End

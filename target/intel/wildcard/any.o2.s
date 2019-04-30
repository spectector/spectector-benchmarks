# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/wildcard/any.o2.s";
	.file "wildcard.c"
	.text
..TXTST0:
.L_2__routine_start_wildcardcmp_0:
# -- Begin  wildcardcmp
	.text
# mark_begin;
       .align    16,0x90
	.globl wildcardcmp
# --- wildcardcmp(const char *, const char *)
wildcardcmp:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_wildcardcmp.1:
..L2:
                                                          #4.58
        movq      %rsi, %r8                                     #4.58
        xorl      %esi, %esi                                    #5.17
        xorl      %ecx, %ecx                                    #6.17
        testq     %rdi, %rdi                                    #9.8
        je        ..B1.18       # Prob 5%                       #9.8
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [9.50e-01]
        testq     %r8, %r8                                      #9.20
        je        ..B1.18       # Prob 5%                       #9.20
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [9.02e-01]
        movb      (%r8), %dl                                    #13.11
        movb      (%rdi), %al                                   #14.13
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 al dl
..B1.4:                         # Preds ..B1.7 ..B1.12 ..B1.13 ..B1.3
                                # Execution count [3.80e+00]
        testb     %dl, %dl                                      #13.11
        jne       ..B1.9        # Prob 50%                      #13.11
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 al dl
..B1.5:                         # Preds ..B1.4
                                # Execution count [1.90e+00]
        testb     %al, %al                                      #14.13
        je        ..B1.17       # Prob 20%                      #14.13
                                # LOE rcx rbx rbp rsi r12 r13 r14 r15
..B1.6:                         # Preds ..B1.15 ..B1.5
                                # Execution count [1.57e+00]
        movb      (%rcx), %dl                                   #15.13
        testb     %dl, %dl                                      #15.13
        je        ..B1.18       # Prob 20%                      #15.13
                                # LOE rcx rbx rbp rsi r12 r13 r14 r15 dl
..B1.7:                         # Preds ..B1.6
                                # Execution count [1.25e+00]
        movb      (%rsi), %al                                   #14.13
        movq      %rcx, %r8                                     #16.7
        movq      %rsi, %rdi                                    #17.7
        incq      %rcx                                          #16.16
        jmp       ..B1.4        # Prob 100%                     #16.16
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 al dl
..B1.9:                         # Preds ..B1.4 ..B1.15
                                # Execution count [1.96e+00]
        cmpb      %dl, %al                                      #20.24
        je        ..B1.13       # Prob 50%                      #20.24
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 al dl
..B1.10:                        # Preds ..B1.9
                                # Execution count [9.80e-01]
        cmpb      $42, %al                                      #21.21
        je        ..B1.14       # Prob 16%                      #21.21
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 al dl
..B1.11:                        # Preds ..B1.10
                                # Execution count [8.23e-01]
        testq     %rsi, %rsi                                    #27.20
        je        ..B1.18       # Prob 20%                      #27.20
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 al
..B1.12:                        # Preds ..B1.11
                                # Execution count [6.59e-01]
        incq      %r8                                           #28.11
        movb      (%r8), %dl                                    #13.11
        jmp       ..B1.4        # Prob 100%                     #13.11
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 al dl
..B1.13:                        # Preds ..B1.9
                                # Execution count [9.80e-01]
        incq      %r8                                           #36.5
        incq      %rdi                                          #37.5
        movb      (%r8), %dl                                    #13.11
        movb      (%rdi), %al                                   #14.13
        jmp       ..B1.4        # Prob 100%                     #14.13
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 al dl
..B1.14:                        # Preds ..B1.10
                                # Execution count [1.57e-01]: Infreq
        incq      %rdi                                          #22.17
        movq      %r8, %rcx                                     #23.11
        movq      %rdi, %rsi                                    #22.11
        movb      (%rdi), %al                                   #25.16
        testb     %al, %al                                      #25.16
        je        ..B1.17       # Prob 20%                      #25.16
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 al dl
..B1.15:                        # Preds ..B1.14
                                # Execution count [1.25e-01]: Infreq
        testb     %dl, %dl                                      #13.11
        jne       ..B1.9        # Prob 50%                      #13.11
        jmp       ..B1.6        # Prob 100%                     #13.11
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 al dl
..B1.17:                        # Preds ..B1.14 ..B1.5
                                # Execution count [3.92e-01]: Infreq
        movl      $1, %eax                                      #14.29
        ret                                                     #14.29
                                # LOE
..B1.18:                        # Preds ..B1.2 ..B1.1 ..B1.6 ..B1.11
                                # Execution count [1.65e-01]: Infreq
        xorl      %eax, %eax                                    #32.16
        ret                                                     #32.16
        .align    16,0x90
                                # LOE
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

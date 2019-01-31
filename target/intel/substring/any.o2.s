# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/substring/any.o2.s";
	.file "substring.c"
	.text
..TXTST0:
.L_2__routine_start_substring_0:
# -- Begin  substring
	.text
# mark_begin;
       .align    16,0x90
	.globl substring
# --- substring(char *, char *)
substring:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_substring.1:
..L2:
                                                          #1.34
        cmpb      $0, (%rdi)                                    #3.20
        je        ..B1.11       # Prob 4%                       #3.20
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [9.59e-01]
        movb      (%rsi), %al                                   #6.16
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 al
..B1.3:                         # Preds ..B1.9 ..B1.2
                                # Execution count [2.79e+00]
        movq      %rdi, %rcx                                    #4.20
        lea       1(%rsi), %rdx                                 #1.34
        testb     %al, %al                                      #6.22
        je        ..B1.14       # Prob 10%                      #6.22
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 al
..B1.4:                         # Preds ..B1.3
                                # Execution count [2.51e+00]
        cmpb      (%rdi), %al                                   #6.38
        jne       ..B1.18       # Prob 20%                      #6.38
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 al
..B1.6:                         # Preds ..B1.4 ..B1.7
                                # Execution count [5.83e+00]
        movb      (%rdx), %r8b                                  #6.16
        incq      %rcx                                          #8.10
        incq      %rdx                                          #7.10
        testb     %r8b, %r8b                                    #6.22
        je        ..B1.13       # Prob 18%                      #6.22
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 al r8b
..B1.7:                         # Preds ..B1.6
                                # Execution count [4.78e+00]
        cmpb      (%rcx), %r8b                                  #6.38
        je        ..B1.6        # Prob 80%                      #6.38
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 al
..B1.9:                         # Preds ..B1.7 ..B1.14
                                # Execution count [2.23e+00]
        .byte     15                                            #11.8
        .byte     31                                            #11.8
        .byte     132                                           #11.8
        .byte     0                                             #11.8
        .byte     0                                             #11.8
        .byte     0                                             #11.8
        .byte     0                                             #11.8
        .byte     0                                             #11.8
        incq      %rdi                                          #11.8
        cmpb      $0, (%rdi)                                    #3.20
        jne       ..B1.3        # Prob 82%                      #3.20
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 al
..B1.11:                        # Preds ..B1.9 ..B1.1
                                # Execution count [4.43e-01]
        xorl      %eax, %eax                                    #13.13
        ret                                                     #13.13
                                # LOE
..B1.13:                        # Preds ..B1.14 ..B1.6
                                # Execution count [5.57e-01]: Infreq
        movl      $1, %eax                                      #10.32
        ret                                                     #10.32
                                # LOE
..B1.18:                        # Preds ..B1.4
                                # Execution count [5.02e-01]: Infreq
        testb     %al, %al                                      #6.22
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 al
..B1.14:                        # Preds ..B1.3 ..B1.18
                                # Execution count [7.80e-01]: Infreq
        je        ..B1.13       # Prob 20%                      #10.19
        jmp       ..B1.9        # Prob 100%                     #10.19
        .align    16,0x90
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 al
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

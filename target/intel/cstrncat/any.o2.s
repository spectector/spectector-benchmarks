# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/cstrncat/any.o2.s";
	.file "cstrncat.c"
	.text
..TXTST0:
.L_2__routine_start_cstrncat_0:
# -- Begin  cstrncat
	.text
# mark_begin;
       .align    16,0x90
	.globl cstrncat
# --- cstrncat(char *, const char *, int)
cstrncat:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %edx
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_cstrncat.1:
..L2:
                                                          #1.50
        movl      %edx, %ecx                                    #1.50
        movq      %rdi, %rdx                                    #2.13
        cmpb      $0, (%rdi)                                    #4.16
        je        ..B1.5        # Prob 10%                      #4.16
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B1.3:                         # Preds ..B1.1 ..B1.3
                                # Execution count [5.00e+00]
        incq      %rdx                                          #5.5
        cmpb      $0, (%rdx)                                    #4.16
        jne       ..B1.3        # Prob 82%                      #4.16
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B1.5:                         # Preds ..B1.3 ..B1.1
                                # Execution count [1.54e+00]
        testl     %ecx, %ecx                                    #11.15
        je        ..B1.9        # Prob 10%                      #11.15
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B1.7:                         # Preds ..B1.5 ..B1.8
                                # Execution count [2.62e+00]
        movb      (%rsi), %r8b                                  #11.27
        movb      %r8b, (%rdx)                                  #11.22
        testb     %r8b, %r8b                                    #11.36
        je        ..B1.11       # Prob 50%                      #11.36
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8b
..B1.8:                         # Preds ..B1.7
                                # Execution count [1.31e+00]
        incq      %rsi                                          #11.27
        incq      %rdx                                          #13.5
        decl      %ecx                                          #12.5
        jne       ..B1.7        # Prob 82%                      #11.15
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B1.9:                         # Preds ..B1.5 ..B1.8
                                # Execution count [3.77e-01]
        movb      (%rdx), %r8b                                  #15.8
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 r8b
..B1.11:                        # Preds ..B1.7 ..B1.9
                                # Execution count [1.00e+00]
        testb     %r8b, %r8b                                    #15.13
        je        ..B1.13       # Prob 50%                      #15.13
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15
..B1.12:                        # Preds ..B1.11
                                # Execution count [5.00e-01]
        movb      $0, (%rdx)                                    #16.6
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.13:                        # Preds ..B1.11 ..B1.12
                                # Execution count [1.00e+00]
        movq      %rdi, %rax                                    #17.10
        ret                                                     #17.10
        .align    16,0x90
                                # LOE
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

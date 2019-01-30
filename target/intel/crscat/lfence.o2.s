# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/crscat/lfence.o2.s";
	.file "crscat.c"
	.text
..TXTST0:
.L_2__routine_start_cstrcat_0:
# -- Begin  cstrcat
	.text
# mark_begin;
       .align    16,0x90
	.globl cstrcat
# --- cstrcat(char *, const char *)
cstrcat:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_cstrcat.1:
..L2:
                                                          #1.43
        movq      %rdi, %rdx                                    #2.13
        movb      (%rdi), %cl                                   #4.11
        lfence                                                  #4.11
        testb     %cl, %cl                                      #4.16
        je        ..B1.4        # Prob 10%                      #4.16
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.3 ..B1.1
                                # Execution count [9.00e-01]
        lfence                                                  #1.43
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [5.00e+00]
        incq      %rdx                                          #5.5
        cmpb      $0, (%rdx)                                    #4.16
        jne       ..B1.2        # Prob 82%                      #4.16
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15
..B1.4:                         # Preds ..B1.1 ..B1.3
                                # Execution count [9.00e-01]
        lfence                                                  #1.43
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15
..B1.5:                         # Preds ..B1.4
                                # Execution count [1.00e+00]
        movb      (%rsi), %cl                                   #7.19
        incq      %rsi                                          #7.19
        movb      %cl, (%rdx)                                   #7.12
        incq      %rdx                                          #7.12
        testb     %cl, %cl                                      #7.28
        je        ..B1.9        # Prob 10%                      #7.28
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15
..B1.6:                         # Preds ..B1.7 ..B1.5
                                # Execution count [9.00e-01]
        lfence                                                  #1.43
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
                                # Execution count [5.00e+00]
        movb      (%rsi), %cl                                   #7.19
        incq      %rsi                                          #7.19
        movb      %cl, (%rdx)                                   #7.12
        incq      %rdx                                          #7.12
        testb     %cl, %cl                                      #7.28
        jne       ..B1.6        # Prob 82%                      #7.28
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15
..B1.9:                         # Preds ..B1.5 ..B1.7
                                # Execution count [1.00e+00]
        movq      %rdi, %rax                                    #10.10
        ret                                                     #10.10
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	cstrcat,@function
	.size	cstrcat,.-cstrcat
..LNcstrcat.0:
	.data
# -- End  cstrcat
	.data
	.section .note.GNU-stack, ""
# End

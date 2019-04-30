# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/cstrpbrk/lfence.o2.s";
	.file "cstrpbrk.c"
	.text
..TXTST0:
.L_2__routine_start_cstrpbrk_0:
# -- Begin  cstrpbrk
	.text
# mark_begin;
       .align    16,0x90
	.globl cstrpbrk
# --- cstrpbrk(const char *, const char *)
cstrpbrk:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_cstrpbrk.1:
..L2:
                                                          #1.49
        movq      %rsi, %r8                                     #1.49
        movb      (%rdi), %dl                                   #5.19
        lea       1(%rdi), %rsi                                 #1.49
        lfence                                                  #5.19
        testb     %dl, %dl                                      #5.26
        je        ..B1.11       # Prob 4%                       #5.26
                                # LOE rbx rbp rsi rdi r8 r12 r13 r14 r15 dl
..B1.2:                         # Preds ..B1.1
                                # Execution count [9.59e-01]
        movb      (%r8), %cl                                    #8.13
        lfence                                                  #8.13
                                # LOE rbx rbp rsi rdi r8 r12 r13 r14 r15 dl cl
..B1.3:                         # Preds ..B1.9 ..B1.2
                                # Execution count [2.79e+00]
        movb      %cl, %r9b                                     #8.27
        lea       1(%r8), %r10                                  #1.49
        testb     %cl, %cl                                      #8.18
        je        ..B1.8        # Prob 10%                      #8.18
                                # LOE rbx rbp rsi rdi r8 r10 r12 r13 r14 r15 dl cl r9b
..B1.5:                         # Preds ..B1.6 ..B1.3
                                # Execution count [7.29e+00]
        cmpb      %dl, %r9b                                     #8.38
        je        ..B1.8        # Prob 20%                      #8.38
                                # LOE rbx rbp rsi rdi r8 r10 r12 r13 r14 r15 dl cl r9b
..B1.6:                         # Preds ..B1.5
                                # Execution count [5.83e+00]
        movb      (%r10), %r9b                                  #8.13
        incq      %r10                                          #9.7
        lfence                                                  #8.13
        testb     %r9b, %r9b                                    #8.18
        jne       ..B1.5        # Prob 82%                      #8.18
                                # LOE rbx rbp rsi rdi r8 r10 r12 r13 r14 r15 dl cl r9b
..B1.8:                         # Preds ..B1.3 ..B1.5 ..B1.6
                                # Execution count [2.79e+00]
        cmpb      %dl, %r9b                                     #10.15
        jne       ..B1.13       # Prob 20%                      #10.15
                                # LOE rbx rbp rsi rdi r8 r12 r13 r14 r15 cl
..B1.9:                         # Preds ..B1.8
                                # Execution count [2.23e+00]
        movb      (%rsi), %dl                                   #5.19
        incq      %rdi                                          #5.32
        incq      %rsi                                          #5.32
        lfence                                                  #5.19
        testb     %dl, %dl                                      #5.26
        jne       ..B1.3        # Prob 82%                      #5.26
                                # LOE rbx rbp rsi rdi r8 r12 r13 r14 r15 dl cl
..B1.11:                        # Preds ..B1.1 ..B1.9
                                # Execution count [4.43e-01]
        xorl      %eax, %eax                                    #13.10
        ret                                                     #13.10
                                # LOE
..B1.13:                        # Preds ..B1.8
                                # Execution count [5.57e-01]: Infreq
        movq      %rdi, %rax                                    #11.22
        ret                                                     #11.22
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	cstrpbrk,@function
	.size	cstrpbrk,.-cstrpbrk
..LNcstrpbrk.0:
	.data
# -- End  cstrpbrk
	.data
	.section .note.GNU-stack, ""
# End

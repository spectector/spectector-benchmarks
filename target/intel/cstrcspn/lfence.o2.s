# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/cstrcspn/lfence.o2.s";
	.file "cstrcspn.c"
	.text
..TXTST0:
.L_2__routine_start_cstrcspn_0:
# -- Begin  cstrcspn
	.text
# mark_begin;
       .align    16,0x90
	.globl cstrcspn
# --- cstrcspn(const char *, const char *)
cstrcspn:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_cstrcspn.1:
..L2:
                                                          #1.47
        movq      %rdi, %rcx                                    #5.8
        movb      (%rdi), %al                                   #5.19
        lfence                                                  #5.19
        testb     %al, %al                                      #5.26
        je        ..B1.11       # Prob 4%                       #5.26
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 al
..B1.2:                         # Preds ..B1.1
                                # Execution count [9.59e-01]
        movb      (%rsi), %dl                                   #8.13
        lfence                                                  #8.13
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 al dl
..B1.3:                         # Preds ..B1.9 ..B1.2
                                # Execution count [2.79e+00]
        movb      %dl, %r8b                                     #8.27
        lea       1(%rsi), %r9                                  #1.47
        testb     %dl, %dl                                      #8.18
        je        ..B1.8        # Prob 10%                      #8.18
                                # LOE rcx rbx rbp rsi rdi r9 r12 r13 r14 r15 al dl r8b
..B1.5:                         # Preds ..B1.6 ..B1.3
                                # Execution count [7.29e+00]
        cmpb      %al, %r8b                                     #8.38
        je        ..B1.8        # Prob 20%                      #8.38
                                # LOE rcx rbx rbp rsi rdi r9 r12 r13 r14 r15 al dl r8b
..B1.6:                         # Preds ..B1.5
                                # Execution count [5.83e+00]
        movb      (%r9), %r8b                                   #8.13
        incq      %r9                                           #9.7
        lfence                                                  #8.13
        testb     %r8b, %r8b                                    #8.18
        jne       ..B1.5        # Prob 82%                      #8.18
                                # LOE rcx rbx rbp rsi rdi r9 r12 r13 r14 r15 al dl r8b
..B1.8:                         # Preds ..B1.3 ..B1.5 ..B1.6
                                # Execution count [2.79e+00]
        cmpb      %al, %r8b                                     #10.15
        je        ..B1.11       # Prob 20%                      #10.15
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 dl
..B1.9:                         # Preds ..B1.8
                                # Execution count [2.23e+00]
        incq      %rcx                                          #5.32
        movb      (%rcx), %al                                   #5.19
        lfence                                                  #5.19
        testb     %al, %al                                      #5.26
        jne       ..B1.3        # Prob 82%                      #5.26
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 al dl
..B1.11:                        # Preds ..B1.8 ..B1.1 ..B1.9
                                # Execution count [4.43e-01]
        subq      %rdi, %rcx                                    #13.10
        movl      %ecx, %eax                                    #13.16
        ret                                                     #13.16
        .align    16,0x90
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

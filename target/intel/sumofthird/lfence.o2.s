# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/sumofthird/lfence.o2.s";
	.file "sumofthird.c"
	.text
..TXTST0:
.L_2__routine_start_sumOfThirdBytes_0:
# -- Begin  sumOfThirdBytes
	.text
# mark_begin;
       .align    16,0x90
	.globl sumOfThirdBytes
# --- sumOfThirdBytes(int *, int)
sumOfThirdBytes:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_sumOfThirdBytes.1:
..L2:
                                                          #3.1
        movl      %esi, %r8d                                    #3.1
        xorl      %eax, %eax                                    #6.5
        testl     %r8d, %r8d                                    #7.21
        jle       ..B1.8        # Prob 50%                      #7.21
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax r8d
..B1.2:                         # Preds ..B1.1
                                # Execution count [1.00e+00]
        movl      %r8d, %edx                                    #7.5
        movl      $1, %ecx                                      #7.5
        xorl      %esi, %esi                                    #7.5
        shrl      $1, %edx                                      #7.5
        je        ..B1.6        # Prob 9%                       #7.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax edx ecx esi r8d
..B1.3:                         # Preds ..B1.2
                                # Execution count [9.00e-01]
        lfence                                                  #3.1
        xorl      %ecx, %ecx                                    #10.9
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax edx ecx esi r8d
..B1.4:                         # Preds ..B1.11 ..B1.3
                                # Execution count [2.50e+00]
        lea       (%rsi,%rsi), %r9d                             #10.9
        incl      %esi                                          #7.5
        movslq    %r9d, %r9                                     #8.15
        movsbl    2(%rdi,%r9,4), %r10d                          #10.22
        addl      %r10d, %eax                                   #10.22
        movsbl    6(%rdi,%r9,4), %r11d                          #10.22
        addl      %r11d, %ecx                                   #10.22
        cmpl      %edx, %esi                                    #7.5
        jae       ..B1.5        # Prob 36%                      #7.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax edx ecx esi r8d
..B1.11:                        # Preds ..B1.4
                                # Execution count [1.60e+00]
        lfence                                                  #3.1
        jmp       ..B1.4        # Prob 100%                     #3.1
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax edx ecx esi r8d
..B1.5:                         # Preds ..B1.4
                                # Execution count [9.00e-01]
        addl      %ecx, %eax                                    #10.9
        lea       1(%rsi,%rsi), %ecx                            #10.9
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax ecx r8d
..B1.6:                         # Preds ..B1.2 ..B1.5
                                # Execution count [1.00e+00]
        lea       -1(%rcx), %edx                                #7.5
        cmpl      %r8d, %edx                                    #7.5
        jae       ..B1.8        # Prob 9%                       #7.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax ecx
..B1.7:                         # Preds ..B1.6
                                # Execution count [9.00e-01]
        movslq    %ecx, %rcx                                    #8.15
        movsbl    -2(%rdi,%rcx,4), %edx                         #10.22
        addl      %edx, %eax                                    #10.22
        lfence                                                  #10.22
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B1.8:                         # Preds ..B1.6 ..B1.1 ..B1.7
                                # Execution count [1.00e+00]
        ret                                                     #12.12
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	sumOfThirdBytes,@function
	.size	sumOfThirdBytes,.-sumOfThirdBytes
..LNsumOfThirdBytes.0:
	.data
# -- End  sumOfThirdBytes
	.data
	.section .note.GNU-stack, ""
# End

# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/crscmp/any.o2.s";
	.file "crscmp.c"
	.text
..TXTST0:
.L_2__routine_start_cstrcmp_0:
# -- Begin  cstrcmp
	.text
# mark_begin;
       .align    16,0x90
	.globl cstrcmp
# --- cstrcmp(const char *, const char *)
cstrcmp:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_cstrcmp.1:
..L2:
                                                          #1.47
        movb      (%rdi), %al                                   #6.11
        testb     %al, %al                                      #6.17
        je        ..B1.6        # Prob 10%                      #6.17
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 al
..B1.3:                         # Preds ..B1.1 ..B1.4
                                # Execution count [2.62e+00]
        cmpb      (%rsi), %al                                   #6.33
        jne       ..B1.6        # Prob 20%                      #6.33
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
                                # Execution count [2.09e+00]
        incq      %rdi                                          #7.5
        incq      %rsi                                          #8.5
        movb      (%rdi), %al                                   #6.11
        testb     %al, %al                                      #6.17
        jne       ..B1.3        # Prob 82%                      #6.17
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 al
..B1.6:                         # Preds ..B1.3 ..B1.4 ..B1.1
                                # Execution count [1.00e+00]
        movzbl    (%rdi), %edx                                  #12.29
        movzbl    (%rsi), %eax                                  #13.29
        cmpl      %eax, %edx                                    #14.18
        jge       ..B1.8        # Prob 50%                      #14.18
                                # LOE rbx rbp r12 r13 r14 r15 eax edx
..B1.7:                         # Preds ..B1.6
                                # Execution count [5.00e-01]
        movl      $-1, %eax                                     #14.18
        ret                                                     #14.18
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B1.8:                         # Preds ..B1.6
                                # Execution count [5.00e-01]
        subl      %edx, %eax                                    #14.18
        shrl      $31, %eax                                     #14.18
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B1.9:                         # Preds ..B1.8
                                # Execution count [1.00e+00]
        ret                                                     #14.18
        .align    16,0x90
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

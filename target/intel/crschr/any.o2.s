# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/crschr/any.o2.s";
	.file "crschr.c"
	.text
..TXTST0:
.L_2__routine_start_cstrchr_0:
# -- Begin  cstrchr
	.text
# mark_begin;
       .align    16,0x90
	.globl cstrchr
# --- cstrchr(const char *, int)
cstrchr:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_cstrchr.1:
..L2:
                                                          #1.39
        movsbl    (%rdi), %ecx                                  #5.14
        testl     %ecx, %ecx                                    #5.19
        je        ..B1.6        # Prob 10%                      #5.19
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx esi
..B1.2:                         # Preds ..B1.1
                                # Execution count [9.00e-01]
        movsbq    %sil, %rdx                                    #5.39
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx ecx esi
..B1.3:                         # Preds ..B1.4 ..B1.2
                                # Execution count [2.62e+00]
        cmpl      %edx, %ecx                                    #5.39
        je        ..B1.6        # Prob 20%                      #5.39
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx ecx esi
..B1.4:                         # Preds ..B1.3
                                # Execution count [2.09e+00]
        incq      %rdi                                          #6.10
        movsbl    (%rdi), %ecx                                  #5.14
        testl     %ecx, %ecx                                    #5.19
        jne       ..B1.3        # Prob 82%                      #5.19
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx ecx esi
..B1.6:                         # Preds ..B1.3 ..B1.4 ..B1.1
                                # Execution count [1.00e+00]
        xorl      %edx, %edx                                    #7.22
        cmpl      %esi, %ecx                                    #7.22
        cmovne    %rdx, %rdi                                    #7.22
        movq      %rdi, %rax                                    #7.22
        ret                                                     #7.22
        .align    16,0x90
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

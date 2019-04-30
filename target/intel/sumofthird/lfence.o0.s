# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/sumofthird/lfence.o0.s";
	.file "sumofthird.c"
	.text
..TXTST0:
.L_2__routine_start_sumOfThirdBytes_0:
# -- Begin  sumOfThirdBytes
	.text
# mark_begin;

	.globl sumOfThirdBytes
# --- sumOfThirdBytes(int *, int)
sumOfThirdBytes:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_sumOfThirdBytes.1:
..L2:
                                                          #3.1
        pushq     %rbp                                          #3.1
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #3.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $32, %rsp                                     #3.1
        movq      %rdi, -24(%rbp)                               #3.1
        movl      %esi, -16(%rbp)                               #3.1
        movl      $0, -32(%rbp)                                 #6.5
        movl      $0, -28(%rbp)                                 #7.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.3 ..B1.1
                                # Execution count [0.00e+00]
        movl      -28(%rbp), %eax                               #7.17
        movl      -16(%rbp), %edx                               #7.21
        cmpl      %edx, %eax                                    #7.21
        jge       ..B1.4        # Prob 50%                      #7.21
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      -28(%rbp), %eax                               #8.23
        movslq    %eax, %rax                                    #8.15
        imulq     $4, %rax, %rax                                #8.15
        addq      -24(%rbp), %rax                               #8.15
        movq      %rax, -8(%rbp)                                #8.9
        movl      $2, %eax                                      #9.9
        addq      -8(%rbp), %rax                                #9.13
        movq      %rax, -8(%rbp)                                #9.9
        movq      -8(%rbp), %rax                                #10.22
        movsbl    (%rax), %eax                                  #10.22
        lfence                                                  #10.22
        movsbq    %al, %rax                                     #10.22
        addl      -32(%rbp), %eax                               #10.22
        movl      %eax, -32(%rbp)                               #10.9
        movl      $1, %eax                                      #7.33
        addl      -28(%rbp), %eax                               #7.33
        movl      %eax, -28(%rbp)                               #7.33
        jmp       ..B1.2        # Prob 100%                     #7.33
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      -32(%rbp), %eax                               #12.12
        leave                                                   #12.12
	.cfi_restore 6
        ret                                                     #12.12
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

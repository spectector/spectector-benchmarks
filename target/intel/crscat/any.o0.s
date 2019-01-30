# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/crscat/any.o0.s";
	.file "crscat.c"
	.text
..TXTST0:
.L_2__routine_start_cstrcat_0:
# -- Begin  cstrcat
	.text
# mark_begin;

	.globl cstrcat
# --- cstrcat(char *, const char *)
cstrcat:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_cstrcat.1:
..L2:
                                                          #1.43
        pushq     %rbp                                          #1.43
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #1.43
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $32, %rsp                                     #1.43
        movq      %rdi, -24(%rbp)                               #1.43
        movq      %rsi, -16(%rbp)                               #1.43
        movq      -24(%rbp), %rax                               #2.13
        movq      %rax, -8(%rbp)                                #2.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.3 ..B1.1
                                # Execution count [0.00e+00]
        movq      -8(%rbp), %rax                                #4.11
        movsbl    (%rax), %eax                                  #4.11
        movsbq    %al, %rax                                     #4.11
        testl     %eax, %eax                                    #4.16
        je        ..B1.4        # Prob 50%                      #4.16
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      $1, %eax                                      #5.5
        addq      -8(%rbp), %rax                                #5.5
        movq      %rax, -8(%rbp)                                #5.5
        jmp       ..B1.2        # Prob 100%                     #5.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.4 ..B1.2
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #7.19
        movsbl    (%rax), %eax                                  #7.19
        movb      %al, -32(%rbp)                                #7.19
        movsbl    -32(%rbp), %eax                               #7.19
        movb      %al, -31(%rbp)                                #7.12
        movq      -8(%rbp), %rax                                #7.12
        movsbl    -31(%rbp), %edx                               #7.12
        movb      %dl, (%rax)                                   #7.12
        movsbl    -31(%rbp), %eax                               #7.12
        movsbq    %al, %rax                                     #7.12
        movl      %eax, -28(%rbp)                               #7.12
        movl      $1, %eax                                      #7.12
        addq      -8(%rbp), %rax                                #7.12
        movq      %rax, -8(%rbp)                                #7.12
        movl      $1, %eax                                      #7.19
        addq      -16(%rbp), %rax                               #7.19
        movq      %rax, -16(%rbp)                               #7.19
        movl      -28(%rbp), %eax                               #7.12
        testl     %eax, %eax                                    #7.28
        jne       ..B1.4        # Prob 50%                      #7.28
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        movq      -24(%rbp), %rax                               #10.10
        leave                                                   #10.10
	.cfi_restore 6
        ret                                                     #10.10
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

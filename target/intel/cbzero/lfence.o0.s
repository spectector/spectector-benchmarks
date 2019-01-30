# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -mconditional-branch=all-fix -S -c -o ../target/intel/cbzero/lfence.o0.s";
	.file "cbzero.c"
	.text
..TXTST0:
.L_2__routine_start_cbzero_0:
# -- Begin  cbzero
	.text
# mark_begin;

	.globl cbzero
# --- cbzero(void *, size_t)
cbzero:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_cbzero.1:
..L2:
                                                          #3.36
        pushq     %rbp                                          #3.36
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #3.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $48, %rsp                                     #3.36
        movq      %rdi, -40(%rbp)                               #3.36
        movq      %rsi, -32(%rbp)                               #3.36
        movq      -40(%rbp), %rax                               #6.11
        movq      %rax, -24(%rbp)                               #6.7
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.3 ..B1.1
                                # Execution count [0.00e+00]
        movq      -32(%rbp), %rax                               #6.14
        movq      %rax, -16(%rbp)                               #6.14
        movq      $-1, %rax                                     #6.14
        addq      -32(%rbp), %rax                               #6.14
        movq      %rax, -32(%rbp)                               #6.14
        movq      -16(%rbp), %rax                               #6.14
        testq     %rax, %rax                                    #6.14
        je        ..B1.4        # Prob 50%                      #6.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movb      $0, -48(%rbp)                                 #7.10
        movq      -24(%rbp), %rax                               #7.4
        movsbl    -48(%rbp), %edx                               #7.10
        movb      %dl, (%rax)                                   #7.4
        movl      $1, %eax                                      #7.4
        addq      -24(%rbp), %rax                               #7.4
        movq      %rax, -24(%rbp)                               #7.4
        jmp       ..B1.2        # Prob 100%                     #7.4
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        leave                                                   #8.1
	.cfi_restore 6
        ret                                                     #8.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	cbzero,@function
	.size	cbzero,.-cbzero
..LNcbzero.0:
	.data
# -- End  cbzero
	.data
	.section .note.GNU-stack, ""
# End

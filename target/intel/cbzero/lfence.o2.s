# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/cbzero/lfence.o2.s";
	.file "cbzero.c"
	.text
..TXTST0:
.L_2__routine_start_cbzero_0:
# -- Begin  cbzero
	.text
# mark_begin;
       .align    16,0x90
	.globl cbzero
# --- cbzero(void *, size_t)
cbzero:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_cbzero.1:
..L2:
                                                          #3.36
        pushq     %rsi                                          #3.36
	.cfi_def_cfa_offset 16
        movq      %rsi, %rdx                                    #3.36
        testq     %rdx, %rdx                                    #6.14
        je        ..B1.4        # Prob 50%                      #6.14
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [5.00e-03]
        cmpq      $96, %rdx                                     #6.14
        jle       ..B1.5        # Prob 0%                       #6.14
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [1.00e+00]
        xorl      %esi, %esi                                    #6.14
        call      _intel_fast_memset                            #6.14
                                # LOE rbx rbp r12 r13 r14 r15
..B1.4:                         # Preds ..B1.1 ..B1.9 ..B1.11 ..B1.3
                                # Execution count [1.00e+00]
        popq      %rcx                                          #8.1
	.cfi_def_cfa_offset 8
        ret                                                     #8.1
	.cfi_def_cfa_offset 16
                                # LOE
..B1.5:                         # Preds ..B1.2
                                # Execution count [1.00e+00]: Infreq
        cmpq      $16, %rdx                                     #6.14
        jl        ..B1.13       # Prob 10%                      #6.14
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
                                # Execution count [1.00e+00]: Infreq
        movq      %rdx, %rax                                    #6.14
        xorl      %ecx, %ecx                                    #6.14
        andq      $-16, %rax                                    #6.14
        pxor      %xmm0, %xmm0                                  #7.10
                                # LOE rax rdx rcx rbx rbp rdi r12 r13 r14 r15 xmm0
..B1.7:                         # Preds ..B1.7 ..B1.6
                                # Execution count [5.56e+00]: Infreq
        movdqu    %xmm0, (%rcx,%rdi)                            #7.4
        addq      $16, %rcx                                     #6.14
        cmpq      %rax, %rcx                                    #6.14
        jb        ..B1.7        # Prob 82%                      #6.14
                                # LOE rax rdx rcx rbx rbp rdi r12 r13 r14 r15 xmm0
..B1.9:                         # Preds ..B1.7 ..B1.13
                                # Execution count [1.11e+00]: Infreq
        cmpq      %rdx, %rax                                    #6.14
        jae       ..B1.4        # Prob 10%                      #6.14
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15
..B1.11:                        # Preds ..B1.11 ..B1.9
                                # Execution count [5.56e+00]: Infreq
        movb      $0, (%rax,%rdi)                               #7.4
        incq      %rax                                          #6.14
        cmpq      %rdx, %rax                                    #6.14
        jb        ..B1.11       # Prob 82%                      #6.14
        jmp       ..B1.4        # Prob 100%                     #6.14
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15
..B1.13:                        # Preds ..B1.5
                                # Execution count [1.00e-01]: Infreq
        xorl      %eax, %eax                                    #6.14
        jmp       ..B1.9        # Prob 100%                     #6.14
        .align    16,0x90
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15
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

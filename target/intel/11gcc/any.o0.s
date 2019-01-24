# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/11gcc/any.o0.s";
	.file "11gcc.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v11_0:
# -- Begin  victim_function_v11
	.text
# mark_begin;

	.globl victim_function_v11
# --- victim_function_v11(size_t)
victim_function_v11:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v11.1:
..L2:
                                                          #13.36
        pushq     %rbp                                          #13.36
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #13.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #13.36
        movq      %rdi, -8(%rbp)                                #13.36
        movq      -8(%rbp), %rax                                #14.7
        movl      array1_size(%rip), %edx                       #14.11
        cmpq      %rdx, %rax                                    #14.11
        jae       ..B1.4        # Prob 50%                      #14.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movl      $temp, %eax                                   #15.12
        movl      $array1, %edx                                 #15.12
        addq      -8(%rbp), %rdx                                #15.12
        movzbl    (%rdx), %edx                                  #15.12
        movzbl    %dl, %edx                                     #15.12
        imull     $512, %edx, %edx                              #15.12
        movslq    %edx, %rdx                                    #15.12
        movl      $array2, %ecx                                 #15.12
        addq      %rdx, %rcx                                    #15.12
        movl      $1, %edx                                      #15.12
        movq      %rax, %rdi                                    #15.12
        movq      %rcx, %rsi                                    #15.12
..___tag_value_victim_function_v11.6:
        call      mymemcmp                                      #15.12
..___tag_value_victim_function_v11.7:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B1.7:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        movl      %eax, -16(%rbp)                               #15.12
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.7
                                # Execution count [0.00e+00]
        movl      -16(%rbp), %eax                               #15.12
        movb      %al, temp(%rip)                               #15.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.3 ..B1.1
                                # Execution count [0.00e+00]
        leave                                                   #16.1
	.cfi_restore 6
        ret                                                     #16.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v11,@function
	.size	victim_function_v11,.-victim_function_v11
..LNvictim_function_v11.0:
	.data
# -- End  victim_function_v11
	.text
.L_2__routine_start_mymemcmp_1:
# -- Begin  mymemcmp
	.text
# mark_begin;

	.globl mymemcmp
# --- mymemcmp(const void *, const void *, size_t)
mymemcmp:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_mymemcmp.10:
..L11:
                                                         #19.60
        pushq     %rbp                                          #19.60
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #19.60
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $64, %rsp                                     #19.60
        movq      %rdi, -48(%rbp)                               #19.60
        movq      %rsi, -40(%rbp)                               #19.60
        movq      %rdx, -32(%rbp)                               #19.60
        movq      -48(%rbp), %rax                               #20.60
        movq      %rax, -24(%rbp)                               #20.36
        movq      -40(%rbp), %rax                               #21.60
        movq      %rax, -16(%rbp)                               #21.36
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.3 ..B2.1
                                # Execution count [0.00e+00]
        movq      -32(%rbp), %rax                               #23.10
        movq      %rax, -8(%rbp)                                #23.10
        movq      $-1, %rax                                     #23.10
        addq      -32(%rbp), %rax                               #23.10
        movq      %rax, -32(%rbp)                               #23.10
        movq      -8(%rbp), %rax                                #23.10
        testq     %rax, %rax                                    #23.20
        jbe       ..B2.8        # Prob 50%                      #23.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        movq      -24(%rbp), %rax                               #25.12
        movzbl    (%rax), %eax                                  #25.12
        movzbl    %al, %eax                                     #25.12
        movl      %eax, -64(%rbp)                               #25.12
        movq      -16(%rbp), %rax                               #25.21
        movzbl    (%rax), %eax                                  #25.21
        movzbl    %al, %eax                                     #25.21
        movl      %eax, -60(%rbp)                               #25.21
        movl      $1, %eax                                      #25.21
        addq      -16(%rbp), %rax                               #25.21
        movq      %rax, -16(%rbp)                               #25.21
        movl      $1, %eax                                      #25.12
        addq      -24(%rbp), %rax                               #25.12
        movq      %rax, -24(%rbp)                               #25.12
        movl      -64(%rbp), %eax                               #25.12
        movl      -60(%rbp), %edx                               #25.21
        cmpl      %edx, %eax                                    #25.21
        je        ..B2.2        # Prob 50%                      #25.21
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.4:                         # Preds ..B2.3
                                # Execution count [0.00e+00]
        movq      $-1, %rax                                     #26.20
        addq      -24(%rbp), %rax                               #26.11
        movzbl    (%rax), %eax                                  #26.11
        movzbl    %al, %eax                                     #26.11
        movq      $-1, %rdx                                     #26.20
        addq      -16(%rbp), %rdx                               #26.20
        movzbl    (%rdx), %edx                                  #26.20
        movzbl    %dl, %edx                                     #26.20
        cmpl      %edx, %eax                                    #26.20
        jl        ..B2.6        # Prob 50%                      #26.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.5:                         # Preds ..B2.4
                                # Execution count [0.00e+00]
        movl      $1, -56(%rbp)                                 #26.20
        jmp       ..B2.7        # Prob 100%                     #26.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.6:                         # Preds ..B2.4
                                # Execution count [0.00e+00]
        movl      $-1, -56(%rbp)                                #26.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.7:                         # Preds ..B2.6 ..B2.5
                                # Execution count [0.00e+00]
        movl      -56(%rbp), %eax                               #26.20
        leave                                                   #26.20
	.cfi_restore 6
        ret                                                     #26.20
	.cfi_offset 6, -16
                                # LOE
..B2.8:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        movl      $0, %eax                                      #28.10
        leave                                                   #28.10
	.cfi_restore 6
        ret                                                     #28.10
                                # LOE
	.cfi_endproc
# mark_end;
	.type	mymemcmp,@function
	.size	mymemcmp,.-mymemcmp
..LNmymemcmp.1:
	.data
# -- End  mymemcmp
	.bss
	.align 4
	.align 1
	.globl temp
temp:
	.type	temp,@object
	.size	temp,1
	.space 1	# pad
	.data
	.align 4
	.align 4
	.globl array1_size
array1_size:
	.long	16
	.type	array1_size,@object
	.size	array1_size,4
	.align 1
	.globl array1
array1:
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.type	array1,@object
	.size	array1,16
	.data
	.comm array2,131072,32
	.section .note.GNU-stack, ""
# End

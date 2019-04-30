# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/05-no-unsigned/any.o2.s";
	.file "05-no-unsigned.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v05_0:
# -- Begin  victim_function_v05
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v05
# --- victim_function_v05(long)
victim_function_v05:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v05.1:
..L2:
                                                          #21.34
        testq     %rdi, %rdi                                    #23.11
        jl        ..B1.11       # Prob 16%                      #23.11
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [8.40e-01]
        movl      array1_size(%rip), %eax                       #23.20
        cmpq      %rax, %rdi                                    #23.20
        jge       ..B1.11       # Prob 50%                      #23.20
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [4.11e-01]
        decq      %rdi                                          #24.18
        movl      %edi, %edx                                    #24.18
        testl     %edx, %edx                                    #24.26
        jl        ..B1.11       # Prob 0%                       #24.26
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx
..B1.4:                         # Preds ..B1.3
                                # Execution count [4.11e-01]
        movb      temp(%rip), %r9b                              #25.7
        lea       1(%rdx), %esi                                 #24.10
        movl      %esi, %ecx                                    #24.5
        movl      $1, %eax                                      #24.5
        xorl      %r8d, %r8d                                    #24.5
        shrl      $1, %ecx                                      #24.5
        je        ..B1.8        # Prob 2%                       #24.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax edx ecx esi r8d r9b
..B1.5:                         # Preds ..B1.4
                                # Execution count [4.11e-01]
        movslq    %esi, %rax                                    #25.22
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx ecx esi r8d r9b
..B1.6:                         # Preds ..B1.6 ..B1.5
                                # Execution count [1.14e+00]
        lea       (%rdx,%r8,2), %r10d                           #25.22
        incl      %r8d                                          #24.5
        movslq    %r10d, %r10                                   #25.22
        subq      %rax, %r10                                    #25.22
        movzbl    1+array1(%r10), %r11d                         #25.22
        shlq      $9, %r11                                      #25.34
        andb      array2(%r11), %r9b                            #25.7
        movzbl    2+array1(%r10), %r11d                         #25.22
        shlq      $9, %r11                                      #25.34
        andb      array2(%r11), %r9b                            #25.7
        cmpl      %ecx, %r8d                                    #24.5
        jb        ..B1.6        # Prob 64%                      #24.5
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx ecx esi r8d r9b
..B1.7:                         # Preds ..B1.6
                                # Execution count [4.11e-01]
        lea       1(%r8,%r8), %eax                              #24.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax esi r9b
..B1.8:                         # Preds ..B1.7 ..B1.4
                                # Execution count [4.20e-01]
        lea       -1(%rax), %edx                                #24.5
        cmpl      %esi, %edx                                    #24.5
        jae       ..B1.10       # Prob 2%                       #24.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax esi r9b
..B1.9:                         # Preds ..B1.8
                                # Execution count [4.11e-01]
        movslq    %edi, %rdx                                    #25.22
        movslq    %esi, %rsi                                    #25.22
        movslq    %eax, %rax                                    #25.22
        subq      %rsi, %rdx                                    #25.22
        movzbl    array1(%rax,%rdx), %ecx                       #25.22
        shlq      $9, %rcx                                      #25.34
        andb      array2(%rcx), %r9b                            #25.7
                                # LOE rbx rbp r12 r13 r14 r15 r9b
..B1.10:                        # Preds ..B1.9 ..B1.8
                                # Execution count [4.07e-01]
        movb      %r9b, temp(%rip)                              #25.7
                                # LOE rbx rbp r12 r13 r14 r15
..B1.11:                        # Preds ..B1.1 ..B1.3 ..B1.2 ..B1.10
                                # Execution count [1.00e+00]
        ret                                                     #27.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v05,@function
	.size	victim_function_v05,.-victim_function_v05
..LNvictim_function_v05.0:
	.data
# -- End  victim_function_v05
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

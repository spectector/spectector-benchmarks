# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/05/any.o2.s";
	.file "05.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v05_0:
# -- Begin  victim_function_v05
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v05
# --- victim_function_v05(size_t)
victim_function_v05:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v05.1:
..L2:
                                                          #10.36
        movl      array1_size(%rip), %eax                       #12.11
        cmpq      %rax, %rdi                                    #12.11
        jae       ..B1.10       # Prob 50%                      #12.11
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [4.90e-01]
        decq      %rdi                                          #13.18
        movl      %edi, %edx                                    #13.18
        testl     %edx, %edx                                    #13.26
        jl        ..B1.10       # Prob 0%                       #13.26
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx
..B1.3:                         # Preds ..B1.2
                                # Execution count [4.90e-01]
        movb      temp(%rip), %r9b                              #14.7
        lea       1(%rdx), %esi                                 #13.10
        movl      %esi, %ecx                                    #13.5
        movl      $1, %eax                                      #13.5
        xorl      %r8d, %r8d                                    #13.5
        shrl      $1, %ecx                                      #13.5
        je        ..B1.7        # Prob 2%                       #13.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax edx ecx esi r8d r9b
..B1.4:                         # Preds ..B1.3
                                # Execution count [4.90e-01]
        movslq    %esi, %rax                                    #14.22
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx ecx esi r8d r9b
..B1.5:                         # Preds ..B1.5 ..B1.4
                                # Execution count [1.36e+00]
        lea       (%rdx,%r8,2), %r10d                           #14.22
        incl      %r8d                                          #13.5
        movslq    %r10d, %r10                                   #14.22
        subq      %rax, %r10                                    #14.22
        movzbl    1+array1(%r10), %r11d                         #14.22
        shlq      $9, %r11                                      #14.34
        andb      array2(%r11), %r9b                            #14.7
        movzbl    2+array1(%r10), %r11d                         #14.22
        shlq      $9, %r11                                      #14.34
        andb      array2(%r11), %r9b                            #14.7
        cmpl      %ecx, %r8d                                    #13.5
        jb        ..B1.5        # Prob 63%                      #13.5
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx ecx esi r8d r9b
..B1.6:                         # Preds ..B1.5
                                # Execution count [4.90e-01]
        lea       1(%r8,%r8), %eax                              #13.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax esi r9b
..B1.7:                         # Preds ..B1.6 ..B1.3
                                # Execution count [5.00e-01]
        lea       -1(%rax), %edx                                #13.5
        cmpl      %esi, %edx                                    #13.5
        jae       ..B1.9        # Prob 2%                       #13.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax esi r9b
..B1.8:                         # Preds ..B1.7
                                # Execution count [4.90e-01]
        movslq    %edi, %rdx                                    #14.22
        movslq    %esi, %rsi                                    #14.22
        movslq    %eax, %rax                                    #14.22
        subq      %rsi, %rdx                                    #14.22
        movzbl    array1(%rax,%rdx), %ecx                       #14.22
        shlq      $9, %rcx                                      #14.34
        andb      array2(%rcx), %r9b                            #14.7
                                # LOE rbx rbp r12 r13 r14 r15 r9b
..B1.9:                         # Preds ..B1.8 ..B1.7
                                # Execution count [4.84e-01]
        movb      %r9b, temp(%rip)                              #14.7
                                # LOE rbx rbp r12 r13 r14 r15
..B1.10:                        # Preds ..B1.1 ..B1.2 ..B1.9
                                # Execution count [1.00e+00]
        ret                                                     #16.1
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

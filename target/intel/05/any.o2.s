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
# --- victim_function_v05(int)
victim_function_v05:
# parameter 1: %edi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v05.1:
..L2:
                                                          #10.33
        cmpl      array1_size(%rip), %edi                       #12.11
        jae       ..B1.10       # Prob 50%                      #12.11
                                # LOE rbx rbp r12 r13 r14 r15 edi
..B1.2:                         # Preds ..B1.1
                                # Execution count [4.90e-01]
        movl      %edi, %eax                                    #11.3
        decl      %eax                                          #11.3
        js        ..B1.10       # Prob 0%                       #13.26
                                # LOE rbx rbp r12 r13 r14 r15 edi
..B1.3:                         # Preds ..B1.2
                                # Execution count [4.90e-01]
        movl      %edi, %edx                                    #13.5
        movl      $1, %esi                                      #13.5
        movb      temp(%rip), %al                               #14.7
        xorl      %ecx, %ecx                                    #13.5
        shrl      $1, %edx                                      #13.5
        je        ..B1.7        # Prob 2%                       #13.5
                                # LOE rdx rcx rbx rbp r12 r13 r14 r15 esi edi al
..B1.5:                         # Preds ..B1.3 ..B1.5
                                # Execution count [1.36e+00]
        movzbl    array1(,%rcx,2), %esi                         #14.22
        shlq      $9, %rsi                                      #14.34
        movzbl    1+array1(,%rcx,2), %r8d                       #14.22
        incq      %rcx                                          #13.5
        shlq      $9, %r8                                       #14.34
        andb      array2(%rsi), %al                             #14.7
        andb      array2(%r8), %al                              #14.7
        cmpq      %rdx, %rcx                                    #13.5
        jb        ..B1.5        # Prob 63%                      #13.5
                                # LOE rdx rcx rbx rbp r12 r13 r14 r15 edi al
..B1.6:                         # Preds ..B1.5
                                # Execution count [4.90e-01]
        lea       1(%rcx,%rcx), %esi                            #13.5
                                # LOE rbx rbp r12 r13 r14 r15 esi edi al
..B1.7:                         # Preds ..B1.6 ..B1.3
                                # Execution count [5.00e-01]
        lea       -1(%rsi), %edx                                #13.5
        cmpl      %edi, %edx                                    #13.5
        jae       ..B1.9        # Prob 2%                       #13.5
                                # LOE rbx rbp r12 r13 r14 r15 esi al
..B1.8:                         # Preds ..B1.7
                                # Execution count [4.90e-01]
        movslq    %esi, %rsi                                    #14.22
        movzbl    -1+array1(%rsi), %edx                         #14.22
        shlq      $9, %rdx                                      #14.34
        andb      array2(%rdx), %al                             #14.7
                                # LOE rbx rbp r12 r13 r14 r15 al
..B1.9:                         # Preds ..B1.8 ..B1.7
                                # Execution count [4.84e-01]
        movb      %al, temp(%rip)                               #14.7
                                # LOE rbx rbp r12 r13 r14 r15
..B1.10:                        # Preds ..B1.2 ..B1.1 ..B1.9
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

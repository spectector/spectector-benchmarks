# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -mconditional-branch=all-fix -S -c -o ../target/intel/02/lfence.o2.s";
	.file "02.c"
	.text
..TXTST0:
.L_2__routine_start_leakByteLocalFunction_0:
# -- Begin  leakByteLocalFunction
	.text
# mark_begin;
       .align    16,0x90
	.globl leakByteLocalFunction
# --- leakByteLocalFunction(uint8_t)
leakByteLocalFunction:
# parameter 1: %edi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_leakByteLocalFunction.1:
..L2:
                                                          #10.39
        movzbl    %dil, %eax                                    #10.49
        shlq      $9, %rax                                      #10.62
        movb      temp(%rip), %cl                               #10.41
        movb      array2(%rax), %dl                             #10.49
        andb      %dl, %cl                                      #10.41
        lfence                                                  #10.49
        movb      %cl, temp(%rip)                               #10.41
        ret                                                     #10.68
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	leakByteLocalFunction,@function
	.size	leakByteLocalFunction,.-leakByteLocalFunction
..LNleakByteLocalFunction.0:
	.data
# -- End  leakByteLocalFunction
	.text
.L_2__routine_start_victim_function_v02_1:
# -- Begin  victim_function_v02
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v02
# --- victim_function_v02(size_t)
victim_function_v02:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v02.4:
..L5:
                                                          #11.36
        movl      array1_size(%rip), %eax                       #12.14
        cmpq      %rax, %rdi                                    #12.14
        jae       ..B2.3        # Prob 78%                      #12.14
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
                                # Execution count [2.20e-01]
        movzbl    array1(%rdi), %edi                            #13.30
        shlq      $9, %rdi                                      #13.8
        movb      temp(%rip), %al                               #13.8
        lfence                                                  #13.30
        andb      array2(%rdi), %al                             #13.8
        movb      %al, temp(%rip)                               #13.8
                                # LOE rbx rbp r12 r13 r14 r15
..B2.3:                         # Preds ..B2.1 ..B2.2
                                # Execution count [1.00e+00]
        ret                                                     #15.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v02,@function
	.size	victim_function_v02,.-victim_function_v02
..LNvictim_function_v02.1:
	.data
# -- End  victim_function_v02
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

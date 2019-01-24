# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/02/any.o0.s";
	.file "02.c"
	.text
..TXTST0:
.L_2__routine_start_leakByteLocalFunction_0:
# -- Begin  leakByteLocalFunction
	.text
# mark_begin;

	.globl leakByteLocalFunction
# --- leakByteLocalFunction(uint8_t)
leakByteLocalFunction:
# parameter 1: %edi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_leakByteLocalFunction.1:
..L2:
                                                          #10.39
        pushq     %rbp                                          #10.39
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #10.39
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #10.39
        movb      %dil, -16(%rbp)                               #10.39
        movzbl    temp(%rip), %eax                              #10.41
        movzbl    %al, %eax                                     #10.41
        movzbl    -16(%rbp), %edx                               #10.56
        movzbl    %dl, %edx                                     #10.56
        imull     $512, %edx, %edx                              #10.61
        movslq    %edx, %rdx                                    #10.49
        movl      $array2, %ecx                                 #10.49
        addq      %rdx, %rcx                                    #10.49
        movzbl    (%rcx), %edx                                  #10.49
        movzbl    %dl, %edx                                     #10.49
        andl      %edx, %eax                                    #10.41
        movb      %al, temp(%rip)                               #10.41
        leave                                                   #10.67
	.cfi_restore 6
        ret                                                     #10.67
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

	.globl victim_function_v02
# --- victim_function_v02(size_t)
victim_function_v02:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v02.8:
..L9:
                                                          #11.36
        pushq     %rbp                                          #11.36
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #11.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #11.36
        movq      %rdi, -16(%rbp)                               #11.36
        movq      -16(%rbp), %rax                               #12.10
        movl      array1_size(%rip), %edx                       #12.14
        cmpq      %rdx, %rax                                    #12.14
        jae       ..B2.3        # Prob 50%                      #12.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.1
                                # Execution count [0.00e+00]
        movl      $array1, %eax                                 #13.8
        addq      -16(%rbp), %rax                               #13.8
        movzbl    (%rax), %eax                                  #13.8
        movl      %eax, %edi                                    #13.8
..___tag_value_victim_function_v02.13:
#       leakByteLocalFunction(uint8_t)
        call      leakByteLocalFunction                         #13.8
..___tag_value_victim_function_v02.14:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.2 ..B2.1
                                # Execution count [0.00e+00]
        leave                                                   #15.1
	.cfi_restore 6
        ret                                                     #15.1
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

# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/03/any.o0.s";
	.file "03.c"
	.text
..TXTST0:
.L_2__routine_start_leakByteNoinlineFunction_0:
# -- Begin  leakByteNoinlineFunction
	.text
# mark_begin;

	.globl leakByteNoinlineFunction
# --- leakByteNoinlineFunction(uint8_t)
leakByteNoinlineFunction:
# parameter 1: %edi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_leakByteNoinlineFunction.1:
..L2:
                                                          #10.63
        pushq     %rbp                                          #10.63
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #10.63
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #10.63
        movb      %dil, -16(%rbp)                               #10.63
        movzbl    temp(%rip), %eax                              #10.65
        movzbl    %al, %eax                                     #10.65
        movzbl    -16(%rbp), %edx                               #10.80
        movzbl    %dl, %edx                                     #10.80
        imull     $512, %edx, %edx                              #10.86
        movslq    %edx, %rdx                                    #10.73
        movl      $array2, %ecx                                 #10.73
        addq      %rdx, %rcx                                    #10.73
        movzbl    (%rcx), %edx                                  #10.73
        movzbl    %dl, %edx                                     #10.73
        andl      %edx, %eax                                    #10.65
        movb      %al, temp(%rip)                               #10.65
        leave                                                   #10.92
	.cfi_restore 6
        ret                                                     #10.92
                                # LOE
	.cfi_endproc
# mark_end;
	.type	leakByteNoinlineFunction,@function
	.size	leakByteNoinlineFunction,.-leakByteNoinlineFunction
..LNleakByteNoinlineFunction.0:
	.data
# -- End  leakByteNoinlineFunction
	.text
.L_2__routine_start_victim_function_v03_1:
# -- Begin  victim_function_v03
	.text
# mark_begin;

	.globl victim_function_v03
# --- victim_function_v03(size_t)
victim_function_v03:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v03.8:
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
        movl      $array1, %eax                                 #13.11
        addq      -16(%rbp), %rax                               #13.11
        movzbl    (%rax), %eax                                  #13.11
        movl      %eax, %edi                                    #13.11
..___tag_value_victim_function_v03.13:
#       leakByteNoinlineFunction(uint8_t)
        call      leakByteNoinlineFunction                      #13.11
..___tag_value_victim_function_v03.14:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.2 ..B2.1
                                # Execution count [0.00e+00]
        leave                                                   #14.1
	.cfi_restore 6
        ret                                                     #14.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v03,@function
	.size	victim_function_v03,.-victim_function_v03
..LNvictim_function_v03.1:
	.data
# -- End  victim_function_v03
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

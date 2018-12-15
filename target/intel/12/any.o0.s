# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/12/any.o0.s";
	.file "12.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v12_0:
# -- Begin  victim_function_v12
	.text
# mark_begin;

	.globl victim_function_v12
# --- victim_function_v12(size_t, size_t)
victim_function_v12:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v12.1:
..L2:
                                                          #10.46
        pushq     %rbp                                          #10.46
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #10.46
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #10.46
        movq      %rdi, -16(%rbp)                               #10.46
        movq      %rsi, -8(%rbp)                                #10.46
        movq      -8(%rbp), %rax                                #11.15
        addq      -16(%rbp), %rax                               #11.15
        movl      array1_size(%rip), %edx                       #11.20
        cmpq      %rdx, %rax                                    #11.20
        jae       ..B1.3        # Prob 50%                      #11.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movzbl    temp(%rip), %eax                              #12.11
        movzbl    %al, %eax                                     #12.11
        movq      -8(%rbp), %rdx                                #12.37
        addq      -16(%rbp), %rdx                               #12.37
        movl      $array1, %ecx                                 #12.26
        addq      %rdx, %rcx                                    #12.26
        movzbl    (%rcx), %edx                                  #12.26
        movzbl    %dl, %edx                                     #12.26
        imull     $512, %edx, %edx                              #12.42
        movslq    %edx, %rdx                                    #12.19
        movl      $array2, %ecx                                 #12.19
        addq      %rdx, %rcx                                    #12.19
        movzbl    (%rcx), %edx                                  #12.19
        movzbl    %dl, %edx                                     #12.19
        andl      %edx, %eax                                    #12.11
        movb      %al, temp(%rip)                               #12.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2 ..B1.1
                                # Execution count [0.00e+00]
        leave                                                   #13.1
	.cfi_restore 6
        ret                                                     #13.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v12,@function
	.size	victim_function_v12,.-victim_function_v12
..LNvictim_function_v12.0:
	.data
# -- End  victim_function_v12
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

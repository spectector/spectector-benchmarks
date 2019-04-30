# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/22/any.o0.s";
	.file "22.c"
	.text
..TXTST0:
.L_2__routine_start_mem_leak_0:
# -- Begin  mem_leak
	.text
# mark_begin;

	.globl mem_leak
# --- mem_leak(size_t)
mem_leak:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_mem_leak.1:
..L2:
                                                          #9.28
        pushq     %rbp                                          #9.28
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #9.28
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #9.28
        movq      %rdi, -16(%rbp)                               #9.28
        movq      -16(%rbp), %rax                               #10.7
        movl      array1_size(%rip), %edx                       #10.11
        cmpq      %rdx, %rax                                    #10.11
        jae       ..B1.3        # Prob 50%                      #10.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movl      $array1, %eax                                 #11.12
        addq      -16(%rbp), %rax                               #11.12
        movzbl    (%rax), %eax                                  #11.12
        leave                                                   #11.12
	.cfi_restore 6
        ret                                                     #11.12
	.cfi_offset 6, -16
                                # LOE
..B1.3:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movl      $0, %eax                                      #13.10
        leave                                                   #13.10
	.cfi_restore 6
        ret                                                     #13.10
                                # LOE
	.cfi_endproc
# mark_end;
	.type	mem_leak,@function
	.size	mem_leak,.-mem_leak
..LNmem_leak.0:
	.data
# -- End  mem_leak
	.text
.L_2__routine_start_victim_function_v22_1:
# -- Begin  victim_function_v22
	.text
# mark_begin;

	.globl victim_function_v22
# --- victim_function_v22(size_t)
victim_function_v22:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v22.10:
..L11:
                                                         #16.36
        pushq     %rbp                                          #16.36
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #16.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #16.36
        movq      %rdi, -8(%rbp)                                #16.36
        movq      -8(%rbp), %rax                                #17.12
        movq      %rax, %rdi                                    #17.12
..___tag_value_victim_function_v22.15:
#       mem_leak(size_t)
        call      mem_leak                                      #17.12
..___tag_value_victim_function_v22.16:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B2.6:                         # Preds ..B2.1
                                # Execution count [0.00e+00]
        movb      %al, -16(%rbp)                                #17.12
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.6
                                # Execution count [0.00e+00]
        movzbl    -16(%rbp), %eax                               #17.3
        movzbl    %al, %eax                                     #17.3
        movq      %rax, %rdi                                    #17.3
..___tag_value_victim_function_v22.17:
#       mem_leak(size_t)
        call      mem_leak                                      #17.3
..___tag_value_victim_function_v22.18:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B2.7:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        movb      %al, -15(%rbp)                                #17.3
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.7
                                # Execution count [0.00e+00]
        leave                                                   #18.1
	.cfi_restore 6
        ret                                                     #18.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v22,@function
	.size	victim_function_v22,.-victim_function_v22
..LNvictim_function_v22.1:
	.data
# -- End  victim_function_v22
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
	.section .note.GNU-stack, ""
# End

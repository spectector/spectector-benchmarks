# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O2 -S -c -o ../target/intel/08/any.o2.s";
	.file "08.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v08_0:
# -- Begin  victim_function_v08
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v08
# --- victim_function_v08(size_t)
victim_function_v08:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v08.1:
..L2:
                                                          #10.36
        lea       1(%rdi), %rdx                                 #11.48
        movl      array1_size(%rip), %eax                       #11.29
        xorl      %ecx, %ecx                                    #11.3
        cmpq      %rax, %rdi                                    #11.3
        cmovb     %rdx, %rcx                                    #11.3
        movzbl    array1(%rcx), %esi                            #11.18
        shlq      $9, %rsi                                      #11.58
        movb      array2(%rsi), %r8b                            #11.11
        andb      %r8b, temp(%rip)                              #11.3
        ret                                                     #12.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v08,@function
	.size	victim_function_v08,.-victim_function_v08
..LNvictim_function_v08.0:
	.data
# -- End  victim_function_v08
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

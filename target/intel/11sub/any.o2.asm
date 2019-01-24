# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O2 -S -c -o ../target/intel/11sub/any.o2.asm";
	.intel_syntax noprefix
	.file "11sub.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v11_0:
# -- Begin  victim_function_v11
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v11
# --- victim_function_v11(size_t)
victim_function_v11:
# parameter 1: rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v11.1:
..L2:
                                                          #13.36
        mov       eax, DWORD PTR array1_size[rip]               #14.11
        cmp       rdi, rax                                      #14.11
        jae       ..B1.3        # Prob 78%                      #14.11
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [2.20e-01]
        movzx     eax, BYTE PTR [array1+rdi]                    #15.38
        shl       rax, 9                                        #15.50
        mov       dl, BYTE PTR [array2+rax]                     #15.28
        sub       BYTE PTR temp[rip], dl                        #15.12
                                # LOE rbx rbp r12 r13 r14 r15
..B1.3:                         # Preds ..B1.1 ..B1.2
                                # Execution count [1.00e+00]
        ret                                                     #16.1
        .align    16,0x90
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
       .align    16,0x90
	.globl mymemcmp
# --- mymemcmp(const void *, const void *, size_t)
mymemcmp:
# parameter 1: rdi
# parameter 2: rsi
# parameter 3: rdx
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_mymemcmp.4:
..L5:
                                                          #19.60
        mov       rcx, rdx                                      #19.60
        test      rcx, rcx                                      #22.7
        je        ..B2.10       # Prob 19%                      #22.7
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
                                # Execution count [8.08e-01]
        dec       rcx                                           #23.12
        je        ..B2.6        # Prob 10%                      #23.12
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.4:                         # Preds ..B2.2 ..B2.5
                                # Execution count [2.11e+00]
        movzx     eax, BYTE PTR [rdi]                           #23.22
        movzx     edx, BYTE PTR [rsi]                           #23.29
        cmp       eax, edx                                      #23.29
        jne       ..B2.7        # Prob 20%                      #23.29
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 eax edx
..B2.5:                         # Preds ..B2.4
                                # Execution count [1.69e+00]
        inc       rdi                                           #24.5
        inc       rsi                                           #25.5
        dec       rcx                                           #23.12
        jne       ..B2.4        # Prob 82%                      #23.12
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.6:                         # Preds ..B2.2 ..B2.5
                                # Execution count [3.04e-01]
        movzx     eax, BYTE PTR [rdi]                           #27.12
        movzx     edx, BYTE PTR [rsi]                           #27.16
                                # LOE rbx rbp r12 r13 r14 r15 eax edx
..B2.7:                         # Preds ..B2.4 ..B2.6
                                # Execution count [8.08e-01]
        sub       eax, edx                                      #27.12
        ret                                                     #27.16
                                # LOE
..B2.10:                        # Preds ..B2.1
                                # Execution count [1.92e-01]: Infreq
        xor       eax, eax                                      #22.21
        ret                                                     #22.21
        .align    16,0x90
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

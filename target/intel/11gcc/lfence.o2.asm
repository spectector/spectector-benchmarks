# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O2 -mconditional-branch=all-fix -S -c -o ../target/intel/11gcc/lfence.o2.asm";
	.intel_syntax noprefix
	.file "11gcc.c"
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
        jae       ..B1.5        # Prob 78%                      #14.11
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [2.20e-01]
        movzx     eax, BYTE PTR [array1+rdi]                    #15.38
        shl       rax, 9                                        #15.50
        lfence                                                  #15.38
        mov       dl, BYTE PTR [array2+rax]                     #15.12
        cmp       dl, BYTE PTR temp[rip]                        #15.12
        jne       ..B1.6        # Prob 20%                      #15.12
                                # LOE rbx rbp r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [4.90e-01]
        xor       edx, edx                                      #15.12
                                # LOE rbx rbp r12 r13 r14 r15 edx
..B1.4:                         # Preds ..B1.6 ..B1.3
                                # Execution count [2.20e-01]
        mov       BYTE PTR temp[rip], dl                        #15.5
                                # LOE rbx rbp r12 r13 r14 r15
..B1.5:                         # Preds ..B1.1 ..B1.4
                                # Execution count [1.00e+00]
        ret                                                     #16.1
                                # LOE
..B1.6:                         # Preds ..B1.2
                                # Execution count [1.23e-01]: Infreq
        mov       eax, -1                                       #15.12
        mov       edx, 1                                        #15.12
        cmova     edx, eax                                      #15.12
        jmp       ..B1.4        # Prob 100%                     #15.12
        .align    16,0x90
                                # LOE rbx rbp r12 r13 r14 r15 edx
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
        lea       rax, QWORD PTR [-1+rdx]                       #23.10
        test      rdx, rdx                                      #23.20
        je        ..B2.6        # Prob 4%                       #23.20
                                # LOE rax rbx rbp rsi rdi r12 r13 r14 r15
..B2.2:                         # Preds ..B2.4 ..B2.1
                                # Execution count [9.59e-01]
        lfence                                                  #19.60
                                # LOE rax rbx rbp rsi rdi r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2
                                # Execution count [2.79e+00]
        mov       dl, BYTE PTR [rdi]                            #25.12
        inc       rdi                                           #25.12
        mov       cl, BYTE PTR [rsi]                            #25.21
        inc       rsi                                           #25.21
        cmp       dl, cl                                        #25.21
        jne       ..B2.7        # Prob 20%                      #25.21
                                # LOE rax rbx rbp rsi rdi r12 r13 r14 r15
..B2.4:                         # Preds ..B2.3
                                # Execution count [2.23e+00]
        dec       rax                                           #23.10
        mov       rdx, rax                                      #23.3
        inc       rdx                                           #23.3
        jne       ..B2.2        # Prob 82%                      #23.20
                                # LOE rax rbx rbp rsi rdi r12 r13 r14 r15
..B2.6:                         # Preds ..B2.1 ..B2.4
                                # Execution count [4.43e-01]
        xor       eax, eax                                      #28.10
        ret                                                     #28.10
                                # LOE
..B2.7:                         # Preds ..B2.3
                                # Execution count [5.57e-01]: Infreq
        mov       edx, -1                                       #26.20
        mov       eax, 1                                        #26.20
        movzx     edi, BYTE PTR [-1+rdi]                        #26.11
        lfence                                                  #26.11
        cmp       dil, BYTE PTR [-1+rsi]                        #26.20
        cmovb     eax, edx                                      #26.20
        ret                                                     #26.20
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

# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O2 -mconditional-branch=all-fix -S -c -o ../target/intel/05/lfence.o2.asm";
	.intel_syntax noprefix
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
# parameter 1: rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v05.1:
..L2:
                                                          #10.36
        mov       eax, DWORD PTR array1_size[rip]               #12.11
        cmp       rdi, rax                                      #12.11
        jae       ..B1.10       # Prob 50%                      #12.11
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [4.90e-01]
        dec       rdi                                           #13.18
        mov       edx, edi                                      #13.18
        test      edx, edx                                      #13.26
        jl        ..B1.10       # Prob 0%                       #13.26
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx
..B1.3:                         # Preds ..B1.2
                                # Execution count [4.90e-01]
        mov       r9b, BYTE PTR temp[rip]                       #14.7
        lea       esi, DWORD PTR [1+rdx]                        #13.10
        mov       ecx, esi                                      #13.5
        mov       eax, 1                                        #13.5
        xor       r8d, r8d                                      #13.5
        shr       ecx, 1                                        #13.5
        je        ..B1.7        # Prob 2%                       #13.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax edx ecx esi r8d r9b
..B1.4:                         # Preds ..B1.3
                                # Execution count [4.90e-01]
        lfence                                                  #10.36
        movsxd    rax, esi                                      #14.22
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx ecx esi r8d r9b
..B1.5:                         # Preds ..B1.13 ..B1.4
                                # Execution count [1.36e+00]
        lea       r10d, DWORD PTR [rdx+r8*2]                    #14.22
        inc       r8d                                           #13.5
        movsxd    r10, r10d                                     #14.22
        sub       r10, rax                                      #14.22
        movzx     r11d, BYTE PTR [1+array1+r10]                 #14.22
        shl       r11, 9                                        #14.34
        and       r9b, BYTE PTR [array2+r11]                    #14.7
        movzx     r11d, BYTE PTR [2+array1+r10]                 #14.22
        shl       r11, 9                                        #14.34
        and       r9b, BYTE PTR [array2+r11]                    #14.7
        cmp       r8d, ecx                                      #13.5
        jae       ..B1.6        # Prob 36%                      #13.5
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx ecx esi r8d r9b
..B1.13:                        # Preds ..B1.5
                                # Execution count [8.70e-01]
        lfence                                                  #10.36
        jmp       ..B1.5        # Prob 100%                     #10.36
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx ecx esi r8d r9b
..B1.6:                         # Preds ..B1.5
                                # Execution count [4.90e-01]
        lea       eax, DWORD PTR [1+r8+r8]                      #13.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax esi r9b
..B1.7:                         # Preds ..B1.3 ..B1.6
                                # Execution count [5.00e-01]
        lea       edx, DWORD PTR [-1+rax]                       #13.5
        cmp       edx, esi                                      #13.5
        jae       ..B1.9        # Prob 2%                       #13.5
                                # LOE rbx rbp rdi r12 r13 r14 r15 eax esi r9b
..B1.8:                         # Preds ..B1.7
                                # Execution count [4.90e-01]
        movsxd    rdx, edi                                      #14.22
        movsxd    rsi, esi                                      #14.22
        movsxd    rax, eax                                      #14.22
        sub       rdx, rsi                                      #14.22
        movzx     ecx, BYTE PTR [array1+rax+rdx]                #14.22
        shl       rcx, 9                                        #14.34
        lfence                                                  #14.22
        and       r9b, BYTE PTR [array2+rcx]                    #14.7
                                # LOE rbx rbp r12 r13 r14 r15 r9b
..B1.9:                         # Preds ..B1.7 ..B1.8
                                # Execution count [4.84e-01]
        mov       BYTE PTR temp[rip], r9b                       #14.7
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

# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O2 -S -c -o ../target/intel/05/any.o2.asm";
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
# --- victim_function_v05(int)
victim_function_v05:
# parameter 1: edi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v05.1:
..L2:
                                                          #10.33
        cmp       edi, DWORD PTR array1_size[rip]               #12.11
        jae       ..B1.10       # Prob 50%                      #12.11
                                # LOE rbx rbp r12 r13 r14 r15 edi
..B1.2:                         # Preds ..B1.1
                                # Execution count [4.90e-01]
        mov       eax, edi                                      #11.3
        dec       eax                                           #11.3
        js        ..B1.10       # Prob 0%                       #13.26
                                # LOE rbx rbp r12 r13 r14 r15 edi
..B1.3:                         # Preds ..B1.2
                                # Execution count [4.90e-01]
        mov       edx, edi                                      #13.5
        mov       esi, 1                                        #13.5
        mov       al, BYTE PTR temp[rip]                        #14.7
        xor       ecx, ecx                                      #13.5
        shr       edx, 1                                        #13.5
        je        ..B1.7        # Prob 2%                       #13.5
                                # LOE rdx rcx rbx rbp r12 r13 r14 r15 esi edi al
..B1.5:                         # Preds ..B1.3 ..B1.5
                                # Execution count [1.36e+00]
        movzx     esi, BYTE PTR [array1+rcx*2]                  #14.22
        shl       rsi, 9                                        #14.34
        movzx     r8d, BYTE PTR [1+array1+rcx*2]                #14.22
        inc       rcx                                           #13.5
        shl       r8, 9                                         #14.34
        and       al, BYTE PTR [array2+rsi]                     #14.7
        and       al, BYTE PTR [array2+r8]                      #14.7
        cmp       rcx, rdx                                      #13.5
        jb        ..B1.5        # Prob 63%                      #13.5
                                # LOE rdx rcx rbx rbp r12 r13 r14 r15 edi al
..B1.6:                         # Preds ..B1.5
                                # Execution count [4.90e-01]
        lea       esi, DWORD PTR [1+rcx+rcx]                    #13.5
                                # LOE rbx rbp r12 r13 r14 r15 esi edi al
..B1.7:                         # Preds ..B1.6 ..B1.3
                                # Execution count [5.00e-01]
        lea       edx, DWORD PTR [-1+rsi]                       #13.5
        cmp       edx, edi                                      #13.5
        jae       ..B1.9        # Prob 2%                       #13.5
                                # LOE rbx rbp r12 r13 r14 r15 esi al
..B1.8:                         # Preds ..B1.7
                                # Execution count [4.90e-01]
        movsxd    rsi, esi                                      #14.22
        movzx     edx, BYTE PTR [-1+array1+rsi]                 #14.22
        shl       rdx, 9                                        #14.34
        and       al, BYTE PTR [array2+rdx]                     #14.7
                                # LOE rbx rbp r12 r13 r14 r15 al
..B1.9:                         # Preds ..B1.8 ..B1.7
                                # Execution count [4.84e-01]
        mov       BYTE PTR temp[rip], al                        #14.7
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

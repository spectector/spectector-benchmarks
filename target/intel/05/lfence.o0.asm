# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O0 -mconditional-branch=all-fix -S -c -o ../target/intel/05/lfence.o0.asm";
	.intel_syntax noprefix
	.file "05.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v05_0:
# -- Begin  victim_function_v05
	.text
# mark_begin;

	.globl victim_function_v05
# --- victim_function_v05(size_t)
victim_function_v05:
# parameter 1: rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v05.1:
..L2:
                                                          #10.36
        push      rbp                                           #10.36
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #10.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #10.36
        mov       QWORD PTR [-8+rbp], rdi                       #10.36
        mov       rax, QWORD PTR [-8+rbp]                       #12.7
        mov       edx, DWORD PTR array1_size[rip]               #12.11
        cmp       rax, rdx                                      #12.11
        jae       ..B1.5        # Prob 50%                      #12.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        mov       eax, -1                                       #13.10
        add       eax, DWORD PTR [-8+rbp]                       #13.18
        mov       DWORD PTR [-16+rbp], eax                      #13.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.4 ..B1.2
                                # Execution count [0.00e+00]
        mov       eax, DWORD PTR [-16+rbp]                      #13.21
        test      eax, eax                                      #13.26
        jl        ..B1.5        # Prob 50%                      #13.26
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.3
                                # Execution count [0.00e+00]
        movzx     eax, BYTE PTR temp[rip]                       #14.7
        movzx     eax, al                                       #14.7
        mov       edx, DWORD PTR [-16+rbp]                      #14.29
        movsxd    rdx, edx                                      #14.22
        mov       ecx, offset flat: array1                      #14.22
        add       rcx, rdx                                      #14.22
        movzx     edx, BYTE PTR [rcx]                           #14.22
        lfence                                                  #14.22
        movzx     edx, dl                                       #14.22
        imul      edx, edx, 512                                 #14.34
        movsxd    rdx, edx                                      #14.15
        mov       ecx, offset flat: array2                      #14.15
        add       rcx, rdx                                      #14.15
        movzx     edx, BYTE PTR [rcx]                           #14.15
        movzx     edx, dl                                       #14.15
        and       eax, edx                                      #14.7
        mov       BYTE PTR temp[rip], al                        #14.7
        mov       eax, -1                                       #13.29
        add       eax, DWORD PTR [-16+rbp]                      #13.29
        mov       DWORD PTR [-16+rbp], eax                      #13.29
        jmp       ..B1.3        # Prob 100%                     #13.29
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.3 ..B1.1
                                # Execution count [0.00e+00]
        leave                                                   #16.1
	.cfi_restore 6
        ret                                                     #16.1
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

# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O0 -mconditional-branch=all-fix -S -c -o ../target/intel/11ker/lfence.o0.asm";
	.intel_syntax noprefix
	.file "11ker.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v11_0:
# -- Begin  victim_function_v11
	.text
# mark_begin;

	.globl victim_function_v11
# --- victim_function_v11(size_t)
victim_function_v11:
# parameter 1: rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v11.1:
..L2:
                                                          #14.36
        push      rbp                                           #14.36
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #14.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #14.36
        mov       QWORD PTR [-8+rbp], rdi                       #14.36
        mov       rax, QWORD PTR [-8+rbp]                       #15.7
        mov       edx, DWORD PTR array1_size[rip]               #15.11
        cmp       rax, rdx                                      #15.11
        jae       ..B1.7        # Prob 50%                      #15.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        mov       eax, offset flat: temp                        #16.12
        mov       edx, offset flat: array1                      #16.12
        add       rdx, QWORD PTR [-8+rbp]                       #16.12
        movzx     edx, BYTE PTR [rdx]                           #16.12
        lfence                                                  #16.12
        movzx     edx, dl                                       #16.12
        imul      edx, edx, 512                                 #16.12
        movsxd    rdx, edx                                      #16.12
        mov       ecx, offset flat: array2                      #16.12
        add       rcx, rdx                                      #16.12
        mov       edx, 1                                        #16.12
        mov       rdi, rax                                      #16.12
        mov       rsi, rcx                                      #16.12
..___tag_value_victim_function_v11.6:
        call      mymemcmp                                      #16.12
..___tag_value_victim_function_v11.7:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B1.8:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        mov       DWORD PTR [-16+rbp], eax                      #16.12
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.8
                                # Execution count [0.00e+00]
        mov       eax, DWORD PTR [-16+rbp]                      #16.12
        mov       BYTE PTR temp[rip], al                        #16.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.3 ..B1.7
                                # Execution count [0.00e+00]
        leave                                                   #17.1
	.cfi_restore 6
        ret                                                     #17.1
	.cfi_offset 6, -16
                                # LOE
..B1.7:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        jmp       ..B1.4        # Prob 100%                     #
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
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

	.globl mymemcmp
# --- mymemcmp(const void *, const void *, size_t)
mymemcmp:
# parameter 1: rdi
# parameter 2: rsi
# parameter 3: rdx
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_mymemcmp.11:
..L12:
                                                         #20.1
        push      rbp                                           #20.1
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #20.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 48                                       #20.1
        mov       QWORD PTR [-40+rbp], rdi                      #20.1
        mov       QWORD PTR [-32+rbp], rsi                      #20.1
        mov       QWORD PTR [-24+rbp], rdx                      #20.1
        mov       DWORD PTR [-48+rbp], 0                        #22.10
        mov       rax, QWORD PTR [-40+rbp]                      #24.13
        mov       QWORD PTR [-16+rbp], rax                      #24.7
        mov       rax, QWORD PTR [-32+rbp]                      #24.23
        mov       QWORD PTR [-8+rbp], rax                       #24.17
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.3 ..B2.1
                                # Execution count [0.00e+00]
        mov       rax, QWORD PTR [-24+rbp]                      #24.31
        test      rax, rax                                      #24.31
        ja        ..B2.4        # Prob 50%                      #24.31
        jmp       ..B2.5        # Prob 100%                     #24.31
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.4
                                # Execution count [0.00e+00]
        mov       eax, 1                                        #24.40
        add       rax, QWORD PTR [-16+rbp]                      #24.40
        mov       QWORD PTR [-16+rbp], rax                      #24.40
        mov       eax, 1                                        #24.47
        add       rax, QWORD PTR [-8+rbp]                       #24.47
        mov       QWORD PTR [-8+rbp], rax                       #24.47
        mov       rax, -1                                       #24.52
        add       rax, QWORD PTR [-24+rbp]                      #24.52
        mov       QWORD PTR [-24+rbp], rax                      #24.52
        jmp       ..B2.2        # Prob 100%                     #24.52
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.4:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        mov       rax, QWORD PTR [-16+rbp]                      #25.15
        movzx     eax, BYTE PTR [rax]                           #25.15
        lfence                                                  #25.15
        movzx     eax, al                                       #25.15
        mov       rdx, QWORD PTR [-8+rbp]                       #25.22
        movzx     edx, BYTE PTR [rdx]                           #25.22
        movzx     edx, dl                                       #25.22
        neg       edx                                           #25.22
        add       eax, edx                                      #25.22
        mov       DWORD PTR [-44+rbp], eax                      #25.8
        mov       eax, DWORD PTR [-44+rbp]                      #25.8
        mov       DWORD PTR [-48+rbp], eax                      #25.8
        mov       eax, DWORD PTR [-44+rbp]                      #25.8
        test      eax, eax                                      #25.30
        je        ..B2.3        # Prob 50%                      #25.30
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.5:                         # Preds ..B2.4 ..B2.2
                                # Execution count [0.00e+00]
        mov       eax, DWORD PTR [-48+rbp]                      #27.9
        leave                                                   #27.9
	.cfi_restore 6
        ret                                                     #27.9
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

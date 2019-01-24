# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O0 -S -c -o ../target/intel/11gcc/any.o0.asm";
	.intel_syntax noprefix
	.file "11gcc.c"
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
                                                          #13.36
        push      rbp                                           #13.36
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #13.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 16                                       #13.36
        mov       QWORD PTR [-8+rbp], rdi                       #13.36
        mov       rax, QWORD PTR [-8+rbp]                       #14.7
        mov       edx, DWORD PTR array1_size[rip]               #14.11
        cmp       rax, rdx                                      #14.11
        jae       ..B1.4        # Prob 50%                      #14.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        mov       eax, offset flat: temp                        #15.12
        mov       edx, offset flat: array1                      #15.12
        add       rdx, QWORD PTR [-8+rbp]                       #15.12
        movzx     edx, BYTE PTR [rdx]                           #15.12
        movzx     edx, dl                                       #15.12
        imul      edx, edx, 512                                 #15.12
        movsxd    rdx, edx                                      #15.12
        mov       ecx, offset flat: array2                      #15.12
        add       rcx, rdx                                      #15.12
        mov       edx, 1                                        #15.12
        mov       rdi, rax                                      #15.12
        mov       rsi, rcx                                      #15.12
..___tag_value_victim_function_v11.6:
        call      mymemcmp                                      #15.12
..___tag_value_victim_function_v11.7:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B1.7:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
        mov       DWORD PTR [-16+rbp], eax                      #15.12
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.7
                                # Execution count [0.00e+00]
        mov       eax, DWORD PTR [-16+rbp]                      #15.12
        mov       BYTE PTR temp[rip], al                        #15.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.3 ..B1.1
                                # Execution count [0.00e+00]
        leave                                                   #16.1
	.cfi_restore 6
        ret                                                     #16.1
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

	.globl mymemcmp
# --- mymemcmp(const void *, const void *, size_t)
mymemcmp:
# parameter 1: rdi
# parameter 2: rsi
# parameter 3: rdx
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_mymemcmp.10:
..L11:
                                                         #19.60
        push      rbp                                           #19.60
	.cfi_def_cfa_offset 16
        mov       rbp, rsp                                      #19.60
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        sub       rsp, 64                                       #19.60
        mov       QWORD PTR [-48+rbp], rdi                      #19.60
        mov       QWORD PTR [-40+rbp], rsi                      #19.60
        mov       QWORD PTR [-32+rbp], rdx                      #19.60
        mov       rax, QWORD PTR [-48+rbp]                      #20.60
        mov       QWORD PTR [-24+rbp], rax                      #20.36
        mov       rax, QWORD PTR [-40+rbp]                      #21.60
        mov       QWORD PTR [-16+rbp], rax                      #21.36
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.3 ..B2.1
                                # Execution count [0.00e+00]
        mov       rax, QWORD PTR [-32+rbp]                      #23.10
        mov       QWORD PTR [-8+rbp], rax                       #23.10
        mov       rax, -1                                       #23.10
        add       rax, QWORD PTR [-32+rbp]                      #23.10
        mov       QWORD PTR [-32+rbp], rax                      #23.10
        mov       rax, QWORD PTR [-8+rbp]                       #23.10
        test      rax, rax                                      #23.20
        jbe       ..B2.8        # Prob 50%                      #23.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        mov       rax, QWORD PTR [-24+rbp]                      #25.12
        movzx     eax, BYTE PTR [rax]                           #25.12
        movzx     eax, al                                       #25.12
        mov       DWORD PTR [-64+rbp], eax                      #25.12
        mov       rax, QWORD PTR [-16+rbp]                      #25.21
        movzx     eax, BYTE PTR [rax]                           #25.21
        movzx     eax, al                                       #25.21
        mov       DWORD PTR [-60+rbp], eax                      #25.21
        mov       eax, 1                                        #25.21
        add       rax, QWORD PTR [-16+rbp]                      #25.21
        mov       QWORD PTR [-16+rbp], rax                      #25.21
        mov       eax, 1                                        #25.12
        add       rax, QWORD PTR [-24+rbp]                      #25.12
        mov       QWORD PTR [-24+rbp], rax                      #25.12
        mov       eax, DWORD PTR [-64+rbp]                      #25.12
        mov       edx, DWORD PTR [-60+rbp]                      #25.21
        cmp       eax, edx                                      #25.21
        je        ..B2.2        # Prob 50%                      #25.21
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.4:                         # Preds ..B2.3
                                # Execution count [0.00e+00]
        mov       rax, -1                                       #26.20
        add       rax, QWORD PTR [-24+rbp]                      #26.11
        movzx     eax, BYTE PTR [rax]                           #26.11
        movzx     eax, al                                       #26.11
        mov       rdx, -1                                       #26.20
        add       rdx, QWORD PTR [-16+rbp]                      #26.20
        movzx     edx, BYTE PTR [rdx]                           #26.20
        movzx     edx, dl                                       #26.20
        cmp       eax, edx                                      #26.20
        jl        ..B2.6        # Prob 50%                      #26.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.5:                         # Preds ..B2.4
                                # Execution count [0.00e+00]
        mov       DWORD PTR [-56+rbp], 1                        #26.20
        jmp       ..B2.7        # Prob 100%                     #26.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.6:                         # Preds ..B2.4
                                # Execution count [0.00e+00]
        mov       DWORD PTR [-56+rbp], -1                       #26.20
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.7:                         # Preds ..B2.6 ..B2.5
                                # Execution count [0.00e+00]
        mov       eax, DWORD PTR [-56+rbp]                      #26.20
        leave                                                   #26.20
	.cfi_restore 6
        ret                                                     #26.20
	.cfi_offset 6, -16
                                # LOE
..B2.8:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        mov       eax, 0                                        #28.10
        leave                                                   #28.10
	.cfi_restore 6
        ret                                                     #28.10
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

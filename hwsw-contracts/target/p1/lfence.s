_Z15victim_functionm:                   # @_Z15victim_functionm
        movl    array1_size(%rip), %eax
        cmpq    %rdi, %rax
        jbe     .LBB0_2
        lfence
        movzbl  array1(%rdi), %eax
        shlq    $6, %rax
        movb    array2(%rax), %al
        andb    %al, temp(%rip)
.LBB0_2:
        lfence
        retq
array1_size:
        .long   16                      # 0x10

array1:
        .ascii  "\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017\020"

array2:
        .zero   131072

temp:
        .byte   0                       # 0x0
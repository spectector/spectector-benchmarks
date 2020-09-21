_Z15victim_functionm:                   # @_Z15victim_functionm
        movb    array1(%rdi), %al
        movb    %al, x(%rip)
        testb   %al, %al
        jne     .LBB0_3
        movl    array1_size(%rip), %eax
        cmpq    %rdi, %rax
        jbe     .LBB0_3
        movb    array2(%rip), %al
        andb    %al, temp(%rip)
.LBB0_3:
        retq
array1_size:
        .long   16                      # 0x10

array1:
        .ascii  "\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017\020"

array2:
        .zero   131072

temp:
        .byte   0                       # 0x0

x:
        .byte   0                       # 0x0
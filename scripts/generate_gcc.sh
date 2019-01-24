#! /bin/bash

# Designed for clang version 7.0.0

lfence="-x86-speculative-load-hardening -x86-speculative-load-hardening-lfence"
any=""
slh="-x86-speculative-load-hardening"
s=""
asm="--x86-asm-syntax=intel"

for code in ../sources/unix/*.c; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    folder=../target/gcc/$num
    rm -rf $folder
    mkdir -p $folder

    ~/.gcc/bin/gcc -S $code -o $folder/any.o0.s
    ~/.gcc/bin/gcc -O2 -S $code -o $folder/any.o2.s
    ~/.gcc/bin/gcc -fspectre-v1=2 -S $code -o $folder/slh.o0.s
    ~/.gcc/bin/gcc -fspectre-v1=2 -O2 -S $code -o $folder/slh.o2.s
    # Add =3 for TLS tracing
done
echo "Files generated correctly"

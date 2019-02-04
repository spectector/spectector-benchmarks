#! /bin/bash
# Designed for gcc version 9.0.0

suite=test/unix

usage () {
    printf "Usage: check_security [-d suite]\n"
    exit 0
}

while getopts ":d:" option; do # parsing of the arguments
    case "${option}" in
	d)
	    suite=$OPTARG
	    ;;
	* )
	    usage
	    ;;
    esac
done

printf "gcc generating: $suite \n"
sources=../sources/$suite

lfence="-x86-speculative-load-hardening -x86-speculative-load-hardening-lfence"
any=""
slh="-x86-speculative-load-hardening"
s=""
asm="--x86-asm-syntax=intel"

for code in $sources/*.c; do
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

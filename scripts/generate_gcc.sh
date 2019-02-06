#! /bin/bash
# Designed for gcc version 9.0.0

suite=test/unix
way=asm

usage () {
    printf "Usage: check_security [-d suite] [-w way]\n"
    exit 0
}

while getopts ":d:w:" option; do # parsing of the arguments
    case "${option}" in
	d ) suite=$OPTARG ;;
	w ) way=$OPTARG ;;
	* ) usage ;;
    esac
done

printf "gcc generating: $suite \n"
sources=../sources/$suite

case $way in
    bin ) ext="o"; flag="-c" ;;
    asm ) ext="s"; flag="-S" ;;
esac

for code in $sources/*.c; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    folder=../target/gcc/$num
    mkdir -p $folder
    ~/.gcc/bin/gcc $flag $code -o $folder/any.o0.$ext
    ~/.gcc/bin/gcc -O2 $flag $code -o $folder/any.o2.$ext
    ~/.gcc/bin/gcc -fspectre-v1=2 $flag $code -o $folder/slh.o0.$ext
    ~/.gcc/bin/gcc -fspectre-v1=2 -O2 $flag $code -o $folder/slh.o2.$ext
    # Add =3 for TLS tracing
done

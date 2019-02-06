#! /bin/bash
# Designed for clang version 7.0.0

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

printf "clang generating: $suite \n"

sources=../sources/$suite

lfence="-mllvm -x86-speculative-load-hardening -mllvm -x86-speculative-load-hardening-lfence"
slh="-mllvm -x86-speculative-load-hardening"
any=""

case $way in
    bin ) ext="o"; flag="" ;;
    asm ) ext="s"; flag="-S" ;;
esac

for code in $sources/*.c; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    folder=../target/clang/$num
    mkdir -p $folder

    for mit in any lfence slh; do
	flag_mit=${!mit}
	if [ "$num" = "03" ]; then
	    clang -c -fdeclspec $flag $flag_mit $code -o $folder/$mit.o0.$ext
	    clang -c -fdeclspec -O2 $flag $flag_mit $code -o $folder/$mit.o2.$ext
	else
	    clang -c $flag $flag_mit $code -o $folder/$mit.o0.$ext
	    clang -c -O2 $flag $flag_mit $code -o $folder/$mit.o2.$ext
	fi
    done
done

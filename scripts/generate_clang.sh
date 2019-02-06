#! /bin/bash
# Designed for clang version 7.0.0

suite=test/unix

usage () {
    printf "Usage: check_security [-d suite]\n"
    exit 0
}

while getopts ":d:" option; do # parsing of the arguments
    case "${option}" in
	d) suite=$OPTARG ;;
	* ) usage ;;
    esac
done

printf "clang generating: $suite \n"

sources=../sources/$suite

lfence="-mllvm -x86-speculative-load-hardening -mllvm -x86-speculative-load-hardening-lfence"
slh="-mllvm -x86-speculative-load-hardening"
any=""

for code in $sources/*.c; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    folder=../target/clang/$num
    rm -rf $folder
    mkdir -p $folder

    for mit in any lfence slh; do
	flag_mit=${!mit}
	if [ "$num" = "03" ]; then
	    clang -c -fdeclspec -S $flag_mit $code -o $folder/$mit.o0.s
	    clang -c -fdeclspec -O2 -S $flag_mit $code -o $folder/$mit.o2.s
	else
	    clang -c -S $flag_mit $code -o $folder/$mit.o0.s
	    clang -c -O2 -S $flag_mit $code -o $folder/$mit.o2.s
	fi
    done
done

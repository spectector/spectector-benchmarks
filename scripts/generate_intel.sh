#! /bin/bash
# Designed for icc version 19.0.0.117

suite=test/unix

usage () {
    printf "Usage: check_security [-d suite] \n"
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

printf "intel generating: $suite \n"
sources=../sources/$suite

intel_folder=../target/intel
s=""
# asm="-masm=intel"

for code in $sources/*.c; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    mkdir -p ../target/intel/$num
    icc -O0 -S -c $code -o $intel_folder/$num/any.o0.s
    icc -O2 -S -c $code -o $intel_folder/$num/any.o2.s
    icc -O0 -mconditional-branch=all-fix -S -c $code -o $intel_folder/$num/lfence.o0.s
    icc -O2 -mconditional-branch=all-fix -S -c $code -o $intel_folder/$num/lfence.o2.s
done

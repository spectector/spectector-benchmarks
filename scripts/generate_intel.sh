#! /bin/bash
# Designed for icc version 19.0.0.117

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

printf "intel generating: $suite \n"
sources=../sources/$suite
intel_folder=../target/intel

case $way in
    bin ) ext="o"; flag="" ;;
    asm ) ext="s"; flag="-S" ;;
esac

for code in $sources/*.c; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    mkdir -p ../target/intel/$num
    icc -O0 $flag -c $code -o $intel_folder/$num/any.o0.$ext
    icc -O2 $flag -c $code -o $intel_folder/$num/any.o2.$ext
    icc -O0 -mconditional-branch=all-fix $flag -c $code -o $intel_folder/$num/lfence.o0.$ext
    icc -O2 -mconditional-branch=all-fix $flag -c $code -o $intel_folder/$num/lfence.o2.$ext
done

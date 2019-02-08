#! /bin/bash
# Designed for icc version 19.0.0.117

sources=../sources/test/unix/*.c
way=asm

usage () {
    printf "Usage: generate_intel [-d suite] [-w way] [-s sources]\n"
    exit 0
}

make_config () {
    pc=victim_function_v$1
    low=""
    case $1 in
	15 ) as="di=256"
	     low="256";;
	19 ) pc="main" ;;
	23 ) pc="attacker_function" ;;
	24 ) pc="another" ;;
	* ) if [ -n "$1" ] && ! [ "$1" -eq "$1" ] 2>/dev/null; then pc=0 # Check if it's a numeric argument (test suite or benchmarks suite)
	    fi ;;
    esac
    printf "entry($pc).\nc([],[$as]).\nlow([$low]).\\nign([]).\\nheap(1024)." > $folder/config
}

while getopts ":d:w:s:" option; do # parsing of the arguments
    case "${option}" in
	d ) sources=../sources/$OPTARG/*.c ;;
	w ) way=$OPTARG ;;
	s ) sources=($OPTARG) ;;
	* ) usage ;;
    esac
done

printf "intel compiling $sources \n"

intel_folder=../target/intel

case $way in
    bin ) ext="o"; flag="" ;;
    asm ) ext="s"; flag="-S" ;;
    * ) printf "way must be 'bin' or 'asm'"
	exit 1
esac

for code in $sources; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    folder=$intel_folder/$num
    mkdir -p ../target/intel/$num
    icc -O0 $flag -c $code -o $folder/any.o0.$ext
    icc -O2 $flag -c $code -o $folder/any.o2.$ext
    icc -O0 -mconditional-branch=all-fix $flag -c $code -o $folder/lfence.o0.$ext
    icc -O2 -mconditional-branch=all-fix $flag -c $code -o $folder/lfence.o2.$ext
    make_config $num
done

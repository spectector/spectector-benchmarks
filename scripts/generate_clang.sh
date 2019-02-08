#! /bin/bash
# Designed for clang version 7.0.0

sources=../sources/test/unix/*.c
way=asm

usage () {
    printf "Usage: generate_clang [-d suite] [-w way] [-s sources]\n"
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

printf "clang compiling $sources, $\n"

lfence="-mllvm -x86-speculative-load-hardening -mllvm -x86-speculative-load-hardening-lfence"
slh="-mllvm -x86-speculative-load-hardening"
any=""

case $way in
    bin ) ext="o"; flag="" ;;
    asm ) ext="s"; flag="-S" ;;
esac

for code in $sources; do
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
    make_config $num
done

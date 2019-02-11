#! /bin/bash
# Designed for gcc version 9.0.0

sources=../sources/test/unix/*.c
way=asm

usage () {
    printf "Usage: generate_gcc [-d suite] [-w way] [-s sources] [-c compiler_options]\n"
    exit 0
}

make_config () {
    pc=victim_function_v$1
    low=""
    case $1 in
	05 ) as="dx=0" ;; # TODO dx=0 because gcc example
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

while getopts ":d:w:s:c:o:" option; do # parsing of the arguments
    case "${option}" in
	d ) sources=../sources/$OPTARG/*.c ;;
	w ) way=$OPTARG ;;
	s ) sources=($OPTARG) ;;
	c ) compiler_options=$OPTARG ;;
	* ) usage ;;
    esac
done

printf "gcc compiling $sources \n"

case $way in
    bin ) ext="o"; flag="-c" ;;
    asm ) ext="s"; flag="-S" ;;
esac

for code in $sources; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    folder=../target/gcc/$num
    mkdir -p $folder
    ~/.gcc/bin/gcc $compiler_options $flag $code -o $folder/any.o0.$ext
    ~/.gcc/bin/gcc $compiler_options -O2 $flag $code -o $folder/any.o2.$ext
    ~/.gcc/bin/gcc $compiler_options -fspectre-v1=2 $flag $code -o $folder/slh.o0.$ext
    ~/.gcc/bin/gcc $compiler_options -fspectre-v1=2 -O2 $flag $code -o $folder/slh.o2.$ext
    # Add =3 for TLS tracing
    make_config $num
done

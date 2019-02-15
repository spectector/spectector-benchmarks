#! /bin/bash
# Designed for clang version 7.0.0

sources=../sources/test/unix/*.c
way=asm

usage () {
    printf "Usage: generate_clang [-d suite] [-w way] [-s sources] [-c compiler options]\n"
    exit 0
}

make_config () {
    ./make_config.sh $1 > $folder/config
}

while getopts ":d:w:s:c:" option; do # parsing of the arguments
    case "${option}" in
	d ) sources=../sources/$OPTARG/*.c ;;
	w ) way=$OPTARG ;;
	s ) if [ -f $OPTARG ]; then
		sources=($OPTARG)
	    elif [ -d $OPTARG ]; then
		sources=$OPTARG/*.c
	    fi ;;
	c ) compiler_options=$OPTARG ;;
	* ) usage ;;
    esac
done

printf "clang compiling $sources\n"

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
	    clang -c $compiler_options -fdeclspec $flag $flag_mit $code -o $folder/$mit.o0.$ext
	    clang -c $compiler_options -fdeclspec -O2 $flag $flag_mit $code -o $folder/$mit.o2.$ext
	else
	    clang -c $compiler_options $flag $flag_mit $code -o $folder/$mit.o0.$ext
	    clang -c $compiler_options -O2 $flag $flag_mit $code -o $folder/$mit.o2.$ext
	fi
    done
    make_config $num
done

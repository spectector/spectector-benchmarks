#! /bin/bash
# Designed for clang version 10.0.0

sources=../sources/*.c
way=asm

usage () {
    printf "Usage: generate_clang [-w way] [-s sources] [-c compiler options]\n"
    exit 0
}

make_config () {
    ./make_config.sh $1 > $folder/config
}

while getopts ":w:s:c:" option; do # parsing of the arguments
    case "${option}" in
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

lfence="-mllvm -x86-speculative-load-hardening -mllvm -x86-slh-lfence"
vanilla=""

case $way in
    bin ) ext="o"; flag="" ;;
    asm ) ext="s"; flag="-S" ;;
esac

for code in $sources; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    folder=../target/$num
    mkdir -p $folder

    for mit in vanilla lfence; do
	flag_mit=${!mit}
	if [ "$num" = "03" ]; then
	    clang -c $compiler_options -fdeclspec -O2 $flag $flag_mit $code -o $folder/$mit.$ext
	else
	    clang -c $compiler_options -O2 $flag $flag_mit $code -o $folder/$mit.$ext
	fi
    done
    # make_config $num
done

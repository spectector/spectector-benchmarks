#! /bin/bash
# Designed for icc version 19.0.0.117

sources=../sources/compiler-countermeasures/*.c
way=asm

usage () {
    printf "Usage: generate_intel [-d suite] [-w way] [-s sources] [-c compiler_options]\n"
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
    icc -O0 $compiler_options $flag -c $code -o $folder/any.o0.$ext
    icc -O2 $compiler_options $flag -c $code -o $folder/any.o2.$ext
    icc -O0 $compiler_options -mconditional-branch=all-fix $flag -c $code -o $folder/lfence.o0.$ext
    icc -O2 $compiler_options -mconditional-branch=all-fix $flag -c $code -o $folder/lfence.o2.$ext
    make_config $num
done

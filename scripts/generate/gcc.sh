#! /bin/bash
# Designed for gcc version 9.0.0

sources=../sources/compiler-countermeasures/*.c
way=asm

usage () {
    printf "Usage: generate_gcc [-d suite] [-w way] [-s sources] [-c compiler_options]\n"
    exit 0
}

make_config () {
    case $1 in
	05 ) as="dx=0" ;; # TODO dx=0 because gcc example
    esac
    ./make_config.sh $1 $as > $folder/config
}

while getopts ":d:w:s:c:o:" option; do # parsing of the arguments
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

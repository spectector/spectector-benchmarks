#! /bin/bash
# Designed for clang version 7.0.0

suite=test/unix

usage () {
    printf "Usage: check_security [-d suite]\n"
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

printf "Suite: $suite \n"

sources=../sources/$suite

lfence="-x86-speculative-load-hardening -x86-speculative-load-hardening-lfence"
any=""
slh="-x86-speculative-load-hardening"
s=""
# asm="--x86-asm-syntax=intel"

for code in $sources/*.c; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    folder=../target/clang/$num
    rm -rf $folder
    mkdir -p $folder

    if [ "$num" = "03" ]; then
	clang -fdeclspec -S -emit-llvm $code -o $folder/o0.ll
	clang -O2 -fdeclspec -S -emit-llvm $code -o $folder/o2.ll
    else
	clang -S -emit-llvm $code -o $folder/o0.ll
	clang -O2 -S -emit-llvm $code -o $folder/o2.ll
    fi

    for bcode in $folder/*; do
	bfile=$(basename $bcode)
	ext="${bfile%.*}"
	for mit in lfence any slh; do
	    flag_mit=${!mit}
	    # for type in s asm; do
	    # 	flag_type=${!type}
	    # 	llc $flag_mit $flag_type $bcode -o $folder/$mit.$ext.$type
	    # done
	    llc $flag_mit $bcode -o $folder/$mit.$ext.s
	done
    done
done
echo "Files generated correctly"

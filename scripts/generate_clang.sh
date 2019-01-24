#! /bin/bash

# Designed for clang version 7.0.0
llvm_folder=../target/clang
rm -rf $llvm_folder/*

lfence="-x86-speculative-load-hardening -x86-speculative-load-hardening-lfence"
any=""
slh="-x86-speculative-load-hardening"
s=""
asm="--x86-asm-syntax=intel"

for code in ../sources/unix/*.c; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    folder=../target/clang/$num
    rm -rf $folder
    mkdir -p $folder
    mkdir -p $llvm_folder/$num

    if [ "$num" = "03" ]; then
	clang -fdeclspec -S -emit-llvm $code -o $llvm_folder/$num/o0.ll
	clang -O2 -fdeclspec -S -emit-llvm $code -o $llvm_folder/$num/o2.ll
    else
	clang -S -emit-llvm $code -o $llvm_folder/$num/o0.ll
	clang -O2 -S -emit-llvm $code -o $llvm_folder/$num/o2.ll
    fi

    for bcode in $llvm_folder/$num/*; do
	bfile=$(basename $bcode)
	ext="${bfile%.*}"
	for mit in lfence any slh; do
	    flag_mit=${!mit}
	    for type in s asm; do
		flag_type=${!type}
		llc $flag_mit $flag_type $bcode -o $folder/$mit.$ext.$type
	    done
	done
    done
done
echo "Files generated correctly"

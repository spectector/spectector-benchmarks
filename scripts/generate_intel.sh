#! /bin/bash

# Designed for icc version 19.0.0.117
intel_folder=../target/intel
s=""
asm="-masm=intel"
for code in ../sources/unix/*.c; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    mkdir -p ../target/intel/$num
    for ext in s asm; do
	ass_flag=${!ext}
	icc $ass_flag -O0 -S -c $code -o $intel_folder/$num/any.o0.$ext
	icc $ass_flag -O2 -S -c $code -o $intel_folder/$num/any.o2.$ext
	icc $ass_flag -O0 -mconditional-branch=all-fix -S -c $code -o $intel_folder/$num/lfence.o0.$ext
	icc $ass_flag -O2 -mconditional-branch=all-fix -S -c $code -o $intel_folder/$num/lfence.o2.$ext
    done
done
echo "Files generated correctly"

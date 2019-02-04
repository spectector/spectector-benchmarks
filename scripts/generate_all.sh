scripts=(./generate_clang.sh ./generate_intel.sh ./generate_gcc.sh)
flags=("test/unix" "benchmarks")

for call in ${scripts[@]}; do
    for flag in ${flags[@]}; do
	$call -d $flag 2> /dev/null
    done
done

#!/bin/bash

# Physical directory where the script is located
_base=$(e=$0;while test -L "$e";do d=$(dirname "$e");e=$(readlink "$e");\
				   cd "$d";done;cd "$(dirname "$e")";pwd -P)

usage () {
    printf "Usage: check_security [<options>...]
  -t TIMEOUT
  -m COMPILER  intel, microsoft, clang, gcc
  -q OPTIMIZATIONS
  -p TARGETS
  -s IGNORE    Don't analyze the specified targets
  -d SUITE     test, benchmarks, new, all
  -o DIR       Output directory
  -f FLAG      Pass all the flags to spectector
  -r FILE      The file must contain all the files and its corresponding 
     	       function to analyze (relative to that directory)
  -i           Analyze all the functions of the files

By default it will be executed with all the compilers, all the Paul Kocher
examples and a timeout of 30 seconds

To pass a list as an option argument, all the elements
 must be quoted and separated by spaces.
"
    exit 0
}

resP () { printf $1 >> $outP; }
resA () { printf $1 >> $outA; }
grep_out () { grep "$1" $2 > /dev/null && resA $3; }

produce_output () {
    ([ $ret = 124 ] && resA "~\t")|| # timeout
	(grep_out "Could not parse" $results/err '^\t')||
	(grep_out "unsupported instruction" $results/err '|\t')||
	(grep_out "unsafe" $outf 'L\t')|| # Leak
	(grep_out "timeout..." $outf 'SMT\t')|| # SMT timeout
	(grep_out "program is safe" $outf 'S\t')|| # S
	(grep_out "checking speculative" $outf '_\t')||
	resA '?\t' # Maybe a bug
    printf "$target\t$func\n" >> $results/errors &&
	cat $results/err >> $results/errors
}

summarize_results () {
    paste $outP $outA | column -s $'\t' -t > $out
    rm $results/err
    exit 0
}

gen=(microsoft intel clang gcc)
timeout=30
IFS=' '
results=results
opts=(.o0 .o2)

# Suites # TODO - Insert on an external file
old=(01 02 03 04 05 06 07 08 09 10 11ker 12 13 14 15)
new=(16 17 18 19 20 21 22 23 24 25 26 27)
benchs=(bubblesort cbzero crscat crschr crscmp cstrcspn cstrncat cstrpbrk
	insertionsort selectionsort substring sumofthird wildcard)
test_suite=(flops-6 objinst evalloop flops-7 linpack-pc oourafft revertBits
	    ackermann exptree flops-8 lists Oscar richards_benchmark fannkuch
	    flops lowercase partialsums salsa20 almabench fasta floyd-warshall
	    lpbench perlin ary3 fbench fp-convert Perm sieve pi spectral-norm
	    mandel-2 polybench strcat Bubblesort ffbench mandel puzzle cholesky
	    fib2 matmul_f64_4x4 Puzzle chomp fldry matrix queens FloatMM
	    heapsort methcall Queens flops-1 hello misr Quicksort Towers
	    flops-2 himenobmtxpa random Treesort dry flops-3 huffbench n-body
	    RealMM dt flops-4 IntMM nestedloop recursive flops-5 nsieve-bits
	    ReedSolomon whetstone)
tests="${old[@]} ${new[@]}"
all="${tests[@]} ${benchs[@]}"
cases=${old[@]}

# Parsing of the arguments
while getopts ":m:p:t:d:o:s:f:q:r:i" option; do
    case "${option}" in
	m) gen=($OPTARG) ;;
	p) cases=($OPTARG) ;;
	t) timeout=${OPTARG} ;;
	d) suite=${OPTARG[@]}[@]
	   cases=${!suite} ;;
	q) opts=($OPTARG) ;;
	o) results=$OPTARG;;
	s) delete=($OPTARG);;
	f) flags=$OPTARG;;
	i) get_entry=true;;
	r) raw=$OPTARG
	   gen=();;
	* ) usage ;;
    esac
done

# Parsing of compilers
mits=""
lmi=""
lop=""
for compiler in ${gen[@]}; do
    case $compiler in
	clang ) mits+="LLV\t\t\t\t\t\t"
	    	lmi+="UNP\t\tFEN\t\tSLH\t\t"
	    	lop+="-O0\t-O2\t-O0\t-O2\t-O0\t-O2\t" ;;
	intel ) mits+="ICC\t\t\t\t"
	    	lmi+="UNP\t\tFEN\t\t"
	    	lop+="-O0\t-O2\t-O0\t-O2\t" ;;
	microsoft ) mits+="MIC\t\t\t\t"
	    	    lmi+="UNP\t\tFEN\t\t"
	    	    lop+="-O0\t-O2\t-O0\t-O2\t" ;;
	gcc ) mits+="GCC\t\t\t\t"
	      lmi+="UNP\t\tSLH\t\t"
	      lop+="-O0\t-O2\t-O0\t-O2\t" ;;
	* ) usage ;;
    esac
done

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM

cd "$_base"

# Change the path to run spectector
# This works if you are in spectector folder or one of it's subfolders
if [ -x ./spectector ]; then
    spectector=./spectector
elif [ -x ../bin/spectector ]; then
    spectector=../bin/spectector
elif [ -x bin/spectector ]; then
    spectector=bin/spectector
elif which spectector > /dev/null 2>&1; then
    # spectector in PATH
    spectector=spectector
else
    cat <<EOF
ERROR: `spectector` not found
EOF
    exit 1
fi

for del in ${delete[@]}; do
    cases=("${cases[@]/$del}")
done

# Check if the output is a directory
if ! [ -d $results ]; then
    printf "$results is not a directory\n"
    exit 1
fi

out=$results/summary.txt
outA=$results/summary_analysis.txt
outP=$results/summary_programs.txt
# folder with the results for each benchmark
outdir=$results/out

# Store old results
old_folder=$results/$(date "+%Y.%m.%d-%H.%M.%S")
mkdir -p $old_folder
find $results -maxdepth 1 -type f -exec mv {} $old_folder \;
mv $outdir $old_folder 2> /dev/null

if which gtimeout > /dev/null 2>&1; then
    runtimeout=gtimeout # for macOS (GNU coreutils)
else
    runtimeout=timeout
fi

# Write the output files
mkdir -p "$outdir"
printf "\n\n\n" > $outP
printf "$mits" > $outA
printf "\n$lmi" >> $outA
printf "\n$lop\n" >> $outA

if ! [ -z $raw ] && [ -f $raw ]; then
    dir=$(dirname $raw)
    type=$(basename $dir)
    while read -r line || [[ -n "$line" ]]; do
	to_analyze=($line)
	target=$dir/${to_analyze[0]}
	func=${to_analyze[1]}
	if [ -f $target ] && grep "$func:" $target > /dev/null; then
	    outf="$outdir/$type.${to_analyze[0]}.$func.out"
	    resP "$target\t$func\n"
	    printf "$target\t$func\n"
	    $runtimeout $timeout $spectector $target $flags --statistics\
			-e $func > $outf 2> $results/err
	    ret=$?
	    produce_output
	    resA "\n"
	    # else
	    #     printf "$target doesn't exist or $func doesn't exist\n"
	    #     resA '¬\t'
	fi
    done < $raw
    summarize_results
fi

for app in ${cases[@]}; do
    if [ $get_entry ]; then
	# TODO: Change source?
	entries="./scripts/get_function_names.sh target/clang/$app/any.o2.s"
    else
	entries="echo no-entry"
    fi
    $entries | while read func; do
	if [ $get_entry ]; then resP "$app-$func\n"; entry_flag="-e $func";
	else func=""; resP "$app\n"; fi
	for comp in ${gen[@]}; do
	    folder=target/$comp/$app
	    experiments=(any lfence slh)
	    extension=s
	    case "$comp" in
		"intel") experiments=(any lfence);;
		"gcc") experiments=(any slh);;
		"microsoft") experiments=(any lfence) && extension=asm;;
	    esac
	    for ex in ${experiments[@]}; do
		for opt in ${opts[@]}; do
		    target=$folder/$ex$opt.$extension
		    if ! [ -f $target ]; then
			printf "$target doesn't exist\n"
			resA '¬\t'
		    else
			f_target=$(basename $target)
			name="${f_target%.*}"
			mitigation="${name%.*}"
			type="${name##*.}"
			if [ $get_entry ]; then
			    printf "$comp-$app-$f_target-$func\n"
			    outf="$outdir/${comp}.${app}.${f_target}-$func.out"
			else
			    printf "$comp-$app-$f_target\n"
			    outf="$outdir/${comp}.${app}.${f_target}.out"
			fi # (show progress)
			$runtimeout $timeout $spectector $target $flags\
			  --statistics $entry_flag > $outf 2> $results/err
			ret=$?
			produce_output
		    fi
		done
	    done
	done
	resA "\n"
    done
done
summarize_results

# echo "Comparison with saved results: "
# diff ../results/summary.txt ../results/summary.txt-ok && echo ok

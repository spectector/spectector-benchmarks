#!/bin/bash

# Physical directory where the script is located
_base=$(e=$0;while test -L "$e";do d=$(dirname "$e");e=$(readlink "$e");\
    cd "$d";done;cd "$(dirname "$e")";pwd -P)

usage () {
    printf "Usage: check_security [-m compiler] [-p targets] [-t timeout] [-d suite] [-o output] [-s ignore] [-f flags]\n"
    printf "\tCompilers: (intel, microsoft, clang, gcc)  Example numbers: (1-24)\n"
    printf "\tSuites: (test, benchmarks, new, all)\n"
    printf "\tBy default it will be executed with all the compilers, all the\n"
    printf "\ttest example numbers and a timeout of 30 seconds\n"
    printf "\tThe output must be a directory where the summary.txt and results will be stored\n"
    printf "\tWhen declaring the cases, they must be quoted and separated by spaces,\n"
    printf "\tthe same with the compilers\n"
    exit 0
}

res () {
    printf $1 >> $out
}

gen=(microsoft intel clang gcc)
timeout=30
IFS=' '
results=results
opts=(o0 o2)

# Suites
old=(01 02 03 04 05 06 07 08 09 10 11ker 12 13 14 15)
new=(16 17 18 19 20 21 22 23 24)
benchs=(bubblesort cbzero crscat crschr crscmp cstrcspn cstrncat cstrpbrk insertionsort selectionsort substring sumofthird wildcard)
test_suite=(flops-6 objinst evalloop flops-7 linpack-pc oourafft revertBits ackermann exptree flops-8 lists Oscar richards_benchmark fannkuch flops lowercase partialsums salsa20 almabench fasta floyd-warshall lpbench perlin ary3 fbench fp-convert Perm sieve pi spectral-norm mandel-2 polybench strcat Bubblesort ffbench mandel puzzle cholesky fib2 matmul_f64_4x4 Puzzle chomp fldry matrix queens FloatMM heapsort methcall Queens flops-1 hello misr Quicksort Towers flops-2 himenobmtxpa random Treesort dry flops-3 huffbench n-body RealMM dt flops-4 IntMM nestedloop recursive flops-5 nsieve-bits ReedSolomon whetstone)
tests="${old[@]} ${new[@]}"
all="${tests[@]} ${benchs[@]}"
cases=${old[@]}

# Parsing of the arguments
while getopts ":m:p:t:d:o:s:f:q:" option; do
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
	* ) usage ;;
    esac
done

# Parsing of compilers
mits=""
lmi=""
lop=""
for compiler in ${gen[@]}; do
    case $compiler in
	clang ) mits+="\tClang\t\t\t\t\t"
	    	lmi+="\tUNP\t\tFEN\t\tSLH\t"
	    	lop+="\t-O0\t-O2\t-O0\t-O2\t-O0\t-O2" ;;
	intel ) mits+="\tICC\t\t\t"
	    	lmi+="\tUNP\t\tFEN\t"
	    	lop+="\t-O0\t-O2\t-O0\t-O2" ;;    
	microsoft ) mits+="\tVisual C++\t\t"
	    	    lmi+="\tUNP\t\tFEN\t"
	    	    lop+="\t-O0\t-O2\t-O0\t-O2" ;;
	gcc ) mits+="\tGCC\t\t\t"
	      lmi+="\tUNP\t\tSLH\t"
	      lop+="\t-O0\t-O2\t-O0\t-O2" ;;
	* ) usage ;;
    esac
done

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM

cd "$_base"

# Change the path to run spectector, this works if you are in spectector folder or one of it's subfolders
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
# folder with the results for each benchmark
outdir=$results/out
mkdir -p "$outdir"

if which gtimeout > /dev/null 2>&1; then
    runtimeout=gtimeout # for macOS (GNU coreutils)
else
    runtimeout=timeout
fi

# Write the output summary file
printf "$mits" > $out
res "\n$lmi"
res "\n$lop\n"

printf "spectector parse errors\n" > /tmp/spectector.parse.errors

for app in ${cases[@]}; do
    num=$app
    [ "$num" == "11ass" ] || [ "$num" == "11gcc" ] || [ "$num" == "11sub" ] || [ "$num" == "11ker" ] && num=11
    res "\n$app"
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
		x=$folder/$ex.$opt.$extension # TODO: Give option for onlchoose the optimizations!!!!
		if ! [ -f $x ]; then
		    printf "$x doesn't exist\n"
		    res '\t¬'
		else
		    y=$(basename $x)
		    name="${y%.*}"
		    mitigation="${name%.*}"
		    type="${name##*.}"
		    printf "$comp-$app-$y\n" # (show progress)
		    outf="$outdir/${comp}.${app}.${y}.out"
		    $runtimeout $timeout $spectector $x $flags --statistics -w 200 > $outf 2> /tmp/spectector.err
		    ret=$?
		    if [ $ret = 124 ]; then # timeout
			res "\t~"
		    else
			(grep parse /tmp/spectector.err > /dev/null && res '\t^' && printf "$x\t" >> /tmp/spectector.parse.errors && cat /tmp/spectector.err >> /tmp/spectector.parse.errors) ||
			    (grep unsafe "$outf" > /dev/null && res '\tL') || # Leak
			    (grep "timeout..." "$outf" && res '\t?') || # SMT timeout
			    (grep "program is safe" "$outf" > /dev/null > /dev/null && res '\tS') || # S
			    (grep checking "$outf" > /dev/null && res '\t?') || res '\t?' # Maybe a bug
		    fi
		fi
	    done
	done
    done
    res "\n"
done
# echo "Comparison with saved results: "
# diff ../results/summary.txt ../results/summary.txt-ok && echo ok

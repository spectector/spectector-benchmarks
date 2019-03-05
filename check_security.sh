#!/bin/bash

# Physical directory where the script is located
_base=$(e=$0;while test -L "$e";do d=$(dirname "$e");e=$(readlink "$e");\
				   cd "$d";done;cd "$(dirname "$e")";pwd -P)

function usage () {
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

function produce_output () {
    [ "$ret" -eq 124 ] && printf "{\"name\":\"%s\",\"status\":\"timeout\",\"file\":\"%s\",\"entry\":\"%s\"}" "$target" "$outjson" "$func" > "$outjson" # timeout
    [ "$ret" -eq 139 ] && printf "{\"name\":\"%s\",\"status\":\"segfault\",\"file\":\"%s\",\"entry\":\"%s\"}" "$target" "$outjson" "$func" > "$outjson" # timeout
}

function summarize_results () {
    printf "results=[" > "$jsonfile"
    for f in "$outdir"/*.json; do (cat "${f}"; printf ",";) >> "$jsonfile"; done
    printf "{\"name\":\"summary\"}]" >> "$jsonfile" # TODO: Fix
    exit 0
}

function clean_up {
    kill $LAST
    exit
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

trap clean_up SIGINT SIGTERM EXIT

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

jsonfile=$results/stats.json
# folder with the results for each benchmark
outdir=$results/out

# Store old results
old_folder=$results/$(date "+%Y.%m.%d-%H.%M.%S")
mkdir -p $old_folder
find $results -maxdepth 1 -type f -exec mv {} $old_folder \;
rm -f $results/consult.html
mv $outdir $old_folder 2> /dev/null

if which gtimeout > /dev/null 2>&1; then
    runtimeout=gtimeout # for macOS (GNU coreutils)
else
    runtimeout=timeout
fi

# Write the output files
mkdir -p "$outdir"

if ! [ -z $raw ]; then
    if [ $get_entry ]; then
	if ! [ -d $raw ]; then
	    printf "%s is not a directory\n" "$all_folder"
	    exit 1
	fi
	printf "Analyzing all the functions of the files of %s\n" "$raw"
	type=$(basename $raw)
	for target in $raw/*.s; do
	    name=$(basename $target)
	    entries="./scripts/get_function_names.sh $target"
	    $entries | while read func; do
		outf="$outdir/$type.$name.$func.out"
		outjson="$outdir/$type.$name.$func.json"
		outerr="$outdir/$type.$name.$func.err"
		printf "%s\t%s\n" "$target" "$func"
		$runtimeout $timeout $spectector $target $flags --stats "$outjson"\
	    		    -e $func > $outf 2> $outerr &
		LAST=$!
		wait $LAST
		ret=$?
		produce_output
	    done
	done
	summarize_results
	exit 1
    elif [ -f $raw ]; then
	dir=$(dirname $raw)
	type=$(basename $dir)
	while read -r line || [[ -n "$line" ]]; do
	    to_analyze=($line)
	    target=$dir/${to_analyze[0]}
	    func=${to_analyze[1]}
	    if [ -f $target ] && grep "\<$func:" $target > /dev/null; then
		outf="$outdir/$type.${to_analyze[0]}.$func.out"
		outjson="$outdir/$type.${to_analyze[0]}.$func.json"
		outerr="$outdir/$type.${to_analyze[0]}.$func.err"
		printf "%s\t%s\n" "$target" "$func"
		$runtimeout $timeout $spectector $target $flags --stats "$outjson"\
			    -e $func > $outf 2> $outerr &
		LAST=$!
		wait $LAST
		ret=$?
		produce_output
	    # else
	    # 	printf "$target doesn't exist or $func doesn't exist\n"
	    fi
	done < $raw
	summarize_results
    else
	printf "Review the parameters passed"
	exit 1
    fi
fi

for app in ${cases[@]}; do
    if [ $get_entry ]; then
	# TODO: Change source?
	entries="./scripts/get_function_names.sh target/clang/$app/any.o2.s"
    else
	entries="echo no-entry"
    fi
    $entries | while read func; do
	if [ $get_entry ]; then entry_flag="-e $func";
	fi
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
			printf "%s doesn't exist\n" "$target"
		    else
			f_target=$(basename $target)
			name="${f_target%.*}"
			mitigation="${name%.*}"
			type="${name##*.}"
			if [ $get_entry ]; then
			    printf "%s\n" "$comp-$app-$f_target-$func"
			    outf="$outdir/${comp}.${app}.${f_target}.$func.out"
			    outjson="$outdir/${comp}.${app}.${f_target}.$func.json"
			    outerr="$outdir/${comp}.${app}.${f_target}.$func.err"
			else
			    printf "%s\n" "$comp-$app-$f_target"
			    outf="$outdir/${comp}.${app}.${f_target}.out"
			    outjson="$outdir/${comp}.${app}.${f_target}.json"
			    outerr="$outdir/${comp}.${app}.${f_target}.err"
			fi # (show progress)
			$runtimeout $timeout $spectector "$target" $flags\
			  --stats $outjson $entry_flag > "$outf" 2> $outerr &
			LAST=$!
			wait $LAST
			ret=$?
			produce_output
		    fi
		done
	    done
	done
    done
done
summarize_results

# echo "Comparison with saved results: "
# diff ../results/summary.txt ../results/summary.txt-ok && echo ok

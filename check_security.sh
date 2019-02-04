#!/bin/bash

# Physical directory where the script is located
_base=$(e=$0;while test -L "$e";do d=$(dirname "$e");e=$(readlink "$e");\
    cd "$d";done;cd "$(dirname "$e")";pwd -P)

usage () {
    printf "Usage: check_security [-m compiler] [-p targets] [-t timeout] [-d suite] [-o output] [-s ignore]\n"
    printf "\tCompilers: (intel, microsoft, clang, gcc)  Example numbers: (1-24)\n"
    printf "\tSuites: (test, benchmarks, new, all)\n"
    printf "\tBy default it will be executed with all the compilers, all the\n"
    printf "\ttest example numbers and a timeout of 30 seconds\n"
    printf "\tThe output must be a directory where the summary.txt and results will be stored\n"
    printf "\tWhen declaring the cases, they must be quoted and separated by spaces,\n"
    printf "\tthe same with the compilers\n"
    exit 0
}

makeconf () {
    if [ -n "$1" ] && ! [ "$1" -eq "$1" ] 2>/dev/null; then config="c([0xf000000=1000],[pc=0, sp=0xf000000, bp=0xf00000])" # Check if it's a numeric argument (test suite or benchmarks suite)
    elif [ $1 -eq 05 ]; then config="c([0xf000000=1000],[pc=victim_function_v$1, sp=0xf000000, bp=0xf00000, dx=0])" # TODO dx=0 because gcc example
    elif [ $1 -eq 15 ]; then config="c([0xf000000=1000],[pc=victim_function_v$1, sp=0xf000000, bp=0xf00000, di=256])"
    elif [ $1 -eq 19 ]; then config="c([0xf000000=1000],[pc=main, sp=0xf000000, bp=0xf00000])"
    elif [ $1 -eq 23 ]; then config="c([0xf000000=1000],[pc=attacker_function, sp=0xf000000, bp=0xf00000])"
    elif [ $1 -eq 24 ]; then config="c([0xf000000=1000],[pc=another, sp=0xf000000, bp=0xf00000])"
    else config="c([0xf000000=1000],[pc=victim_function_v$1, sp=0xf000000, bp=0xf00000])"
    fi
}

res () {
    printf $1 >> $out
}

gen=(microsoft intel clang gcc)
timeout=30
IFS=' '
cases=(01 02 03 04 05 06 07 08 09 10 11ker 12 13 14 15 16 17 18 19 20 21 23 24)
results=results

while getopts ":m:p:t:d:o:s:" option; do # parsing of the arguments
    case "${option}" in
	m) gen=($OPTARG) ;;
	p) cases=($OPTARG) ;;
	t) timeout=${OPTARG} ;;
	d) case $OPTARG in
	       benchmarks) cases=(bubblesort  cbzero  crscat  crschr  crscmp  cstrcspn  cstrncat  cstrpbrk  insertionsort  selectionsort  substring  sumofthird  wildcard);;
	       new) cases=(16 17 18 19 20 21 22 23 24);;
	       all) cases=(01 02 03 04 05 06 07 08 09 10 11ker 12 13 14 15 16 17 18 19 20 21 22 23 24 bubblesort  cbzero  crscat  crschr  crscmp  cstrcspn  cstrncat  cstrpbrk  insertionsort  selectionsort  substring  sumofthird  wildcard);;
	       *) cases=(01 02 03 04 05 06 07 08 09 10 11ker 12 13 14 15 16 17 18 19 20 21 22 23 24) ;;
	   esac ;;
	o) results=$OPTARG;;
	s) delete=($OPTARG);;
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
	microsoft ) mits+="\tVisual C++\t\t\t"
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
res "\n$lop"

low="[256]" # The low addresses (can't change from one path to another), 256 is the direction that di points on #15
for app in ${cases[@]}; do
    num=$app
    [ "$num" == "11ass" ] || [ "$num" == "11gcc" ] || [ "$num" == "11sub" ] || [ "$num" == "11ker" ] && num=11
    makeconf $num # Set up the configurations
    res "\n\n$app"
    for case in ${gen[@]}; do
	    folder=target/$case/$app
	    experiments=(any lfence slh)
	    extension=s
	    [ "$case" == "intel" ] && experiments=(any lfence)
	    [ "$case" == "gcc" ] && experiments=(any slh)
	    [ "$case" == "microsoft" ] && experiments=(any lfence) && extension=asm
	    for ex in ${experiments[@]}; do
		for x in $folder/$ex.o0.$extension $folder/$ex.o2.$extension; do
		    if ! [ -f $x ]; then
			printf "$x doesn't exist\n"
			res '\t¬'
		    else
			y=$(basename $x)
			name="${y%.*}"
			mitigation="${name%.*}"
			type="${name##*.}"
			printf "$case-$app-$y\n" # (show progress)
			outf="$outdir/${case}.${app}.${y}.out"
			$runtimeout $timeout $spectector $x --statistics -w 200 -c "$config" --conf-file default_conf --low "$low" > $outf
			ret=$?
			if [ $ret = 124 ]; then # timeout
			    res "\t~"
			else
			    (grep unsafe "$outf" > /dev/null && res '\tL') || # Leak
				(grep "timeout..." "$outf" && res '\t?') || # SMT timeout
				(grep "program is safe" "$outf" > /dev/null > /dev/null && res '\tS') || # S
				(grep checking "$outf" > /dev/null && res '\t?') || res '\t?' # Maybe a bug
			fi
		    fi
		done
	    done
	done
    done

	# echo "Comparison with saved results: "
	# diff ../results/summary.txt ../results/summary.txt-ok && echo ok

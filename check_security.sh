#!/bin/bash

# Physical directory where the script is located
_base=$(e=$0;while test -L "$e";do d=$(dirname "$e");e=$(readlink "$e");\
    cd "$d";done;cd "$(dirname "$e")";pwd -P)

usage () {
    printf "Usage: check_security [-m compiler] [-p example_number] [-t timeout]\n"
    printf "\tCompilers: (intel, microsoft, clang, all)  Example numbers: (1-15)\n"
    printf "\tBy default it will be executed with all the compilers and all the\n"
    printf "\texample numbers and timeout of 30 seconds\n"
    exit 0
}

makeconf () {
    [ $1 -eq 15 ] && config="c([0xf000000=1000,9100=16,200=0],[pc=victim_function_v$1, sp=0xf000000, bp=0xf00000, temp=200, array1=9000, array1_size=9100, array2=10000, di=9200])" || config="c([0xf000000=1000,9100=16,200=0],[pc=victim_function_v$1, sp=0xf000000, bp=0xf00000, temp=200, array1=9000, array1_size=9100, array2=10000, array_size_mask=9100])"
}

res () {
    printf $1 >> $out
}

cases=(01 02 03 04 05 06 07 08 09 10 11ker 12 13 14 15)
gen=(microsoft intel clang)
mits="\tVisual C++\t\t\tICC\t\t\t\tClang"
lmi="\tUNP\t\tFEN\t\tUNP\t\tFEN\t\tUNP\t\tFEN\t\tSLH"
lop="\t-O0\t-O2\t-O0\t-O2\t-O0\t-O2\t-O0\t-O2\t-O0\t-O2\t-O0\t-O2\t-O0\t-O2"
timeout=30

while getopts ":m:p:t:" option; do # parsing of the arguments
    case "${option}" in
	m)
	    case $OPTARG in
		clang )
		    gen=(clang)
		    mits="\tClang\t\t\t\t\t"
		    lmi="\tUNP\t\tFEN\t\tSLH"
		    lop="\t-O0\t-O2\t-O0\t-O2\t-O0\t-O2"
		    ;;
		intel )
		    gen=(intel)
		    mits="\tICC\t\t\t"
		    lmi="\tUNP\t\tFEN"
		    lop="\t-O0\t-O2\t-O0\t-O2"
		    ;;    
		microsoft )
		    gen=(microsoft)
		    mits="\tVisual C++"
		    lmi="\tUNP\t\tFEN"
		    lop="\t-O0\t-O2\t-O0\t-O2"
		    ;;
		all )
		    ;;
		* )
		    usage
		    ;;
	    esac
	    ;;
	p)
	    cases=(${OPTARG})
	    ;;
	t)
	    timeout=${OPTARG}
	    ;;
	* )
	    usage
	    ;;
    esac
done

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

cd "$_base"

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

# Change the path to run spectector, this works if you are in spectector folder or one of it's subfolders
out=results/summary.txt
# folder with the results for each benchmark
outdir=results/out
mkdir -p "$outdir"

if which gtimeout > /dev/null 2>&1; then
    runtimeout=gtimeout # for macOS (GNU coreutils)
else
    runtimeout=timeout
fi

printf "$mits" > $out
res "\n$lmi"
res "\n$lop"

for app in ${cases[@]}; do
    num=$app
    [ "$num" == "11ass" ] || [ "$num" == "11gcc" ] || [ "$num" == "11sub" ] || [ "$num" == "11ker" ] && num=11
    res "\n\n$num"
    for case in ${gen[@]}; do
	    folder=target/$case/$app
	    experiments=(any lfence slh)
	    #optimizations=(o0 o2)
	    expe=$case
	    extension=s
	    [ "$case" == "intel" ] && experiments=(any lfence)
	    [ "$case" == "microsoft" ] && experiments=(any lfence) && extension=asm
	    for ex in ${experiments[@]}; do
		for x in $folder/$ex.o0.$extension $folder/$ex.o2.$extension; do
		    y=$(basename $x)
		    name="${y%.*}"
		    mitigation="${name%.*}"
		    type="${name##*.}"
		    
		    makeconf $num # Set up the configurations
		    low="[array1, array2, array1_size, array_size_mask, 'victim_function_v07.last_x', 9100, 9200, di, temp, 200, ImageBase]" # The low addresses (can't change from one path to another)
		    # '9100' is the address of array1_size (needed for example 07)
		    
		    printf "$expe-$app-$y\n" # (show progress)
		    outf="$outdir/${expe}.${app}.${y}.out"
		    $runtimeout $timeout $spectector $x --statistics -c "$config" --low "$low" > $outf # TODO: Time as user input
		    ret=$?
		    if [ $ret = 124 ]; then # timeout
			res "\t~"
		    else
			(grep unsafe "$outf" > /dev/null && res '\tL') ||  (grep "timeout..." "$outf" && res '\t?') || (grep "is safe" "$outf" > /dev/null > /dev/null && res '\tS') || (grep checking "$outf" > /dev/null && res '\t?') || res '\t?'
		    fi
		done
	    done
	done
    done

	# echo "Comparison with saved results: "
	# diff ../results/security.txt ../results/security.txt-ok && echo ok

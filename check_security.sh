#!/bin/bash

# Physical directory where the script is located
_base=$(e=$0;while test -L "$e";do d=$(dirname "$e");e=$(readlink "$e");\
    cd "$d";done;cd "$(dirname "$e")";pwd -P)

makeconf () {
    [ $1 -eq 15 ] && config="c([0xf000000=1000,9100=16,200=0],[pc=victim_function_v$1, sp=0xf000000, bp=0xf00000, temp=200, array1=9000, array1_size=9100, array2=10000, di=9200])" || config="c([0xf000000=1000,9100=16,200=0],[pc=victim_function_v$1, sp=0xf000000, bp=0xf00000, temp=200, array1=9000, array1_size=9100, array2=10000, array_size_mask=9100])"
}

res () {
    printf $1 >> $out
}

cases=(01 02 03 04 05 06 07 08 09 10 11gcc 11ker 11sub 12 13 14 15)
gen=(microsoft intel clang)
mits=""
lmi=""
lop=""
case "$1" in
    -h )
	echo "Usage: check_security [compiler] [example number]"
	echo "Compilers: (intel, microsoft, clang, all)  Example numbers: (1-15)"
	echo "By default it will be executed with all the compilers and all the example numbers"
	exit 0
	;;
    clang )
	gen=(clang)
	mits="$mits\tClang\t\t\t\t\t"
	lmi="$lmi\tany\t\tlfence\t\tslh"
	lop="$lop\to0\to2\to0\to2\to0\to2"
        ;;
    intel )
        gen=(intel)
	mits="$mits\tIntel\t\t\t"
	lmi="$lmi\tany\t\tlfence"
	lop="$lop\to0\to2\to0\to2"
        ;;    
    microsoft )
        gen=(microsoft)
	mits="$mits\tMicrosoft"
	lmi="$lmi\tany\t\tlfence"
	lop="$lop\to0\to2\to0\to2"
        ;;
    * )
	mits="\tMicrosoft\t\t\tIntel\t\t\t\tClang"
	lmi="\tany\t\tlfence\t\tany\t\tlfence\t\tany\t\tlfence\t\tslh"
	lop="\to0\to2\to0\to2\to0\to2\to0\to2\to0\to2\to0\to2\to0\to2"
	;;
esac

if [ $# -ge 2 ]; then cases=($2); fi

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

out=results/security.txt
#echo "Program security evaluation:" > $out

# results for each benchmark
outdir=results/out
mkdir -p "$outdir"

if which gtimeout > /dev/null 2>&1; then
    timeout=gtimeout # for macOS (GNU coreutils)
else
    timeout=timeout
fi

printf "$mits" > $out
res "\n$lmi"
res "\n$lop"

for app in ${cases[@]}; do
    res "\n\n$app"
    for case in ${gen[@]}; do
	    num=$app
	    [ "$num" == "11ass" ] || [ "$num" == "11gcc" ] || [ "$num" == "11sub" ] || [ "$num" == "11ker" ] && num=11
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
		    $timeout 30 $spectector $x -c "$config" --low "$low" > $outf
		    ret=$?
		    if [ $ret = 124 ]; then # timeout
			res "\t~"
		    else
			(grep unsafe "$outf" > /dev/null && res '\tL') ||  (grep "timeout..." "$outf" && res '\tif') || (grep "is safe" "$outf" > /dev/null > /dev/null && res '\tS') || (grep checking "$outf" > /dev/null && res '\t""') || res '\t?'
		    fi
		done
	    done
	done
    done

	# echo "Comparison with saved results: "
	# diff ../results/security.txt ../results/security.txt-ok && echo ok

	# echo "Comparison with expected results: "
	# diff ../results/security.txt ../results/security.txt-expected && echo ok

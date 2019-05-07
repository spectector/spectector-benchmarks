#! /bin/bash

function usage(){
    printf "Usage: obtain_project_files.sh -i PROJECT_FOLDER -o OUTDIR [clean]"
}

if which grealpath > /dev/null 2>&1; then
    runrealpath=grealpath # for macOS (GNU coreutils)
else
    runrealpath=realpath
fi


if [ $# -lt 2 ]; then
    usage
fi

project_folder=$($runrealpath $1)
outdir=$($runrealpath $2)

if ! [ -d $project_folder ] || ! [ -d $outdir ]; then
    usage
fi

cd $project_folder


if [[ $3 == "clean" ]]; then
    make clean
    make
    rm $outdir/*
    find . -name '*.ll' | while read filename; do
        rm $filename
    done
fi

find . -name '*.c' | while read filename; do
    filename="${filename%.*}.ll"
    make $filename
    outfile=$(echo $filename | tr '/' '.')
    outfile="${outfile:2}"
    cp $filename $outdir/$outfile
done

for x in $outdir; do
    llc $x
done

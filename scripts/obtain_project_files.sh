#! /bin/bash

function usage(){
    printf "Usage: obtain_project_files.sh -i PROJECT_FOLDER -o OUTDIR [clean]"
}

if [ $# -lt 2 ]; then
    usage
fi

project_folder=$(realpath $1)
outdir=$(realpath $2)

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
else
    find . -name '*.c' | while read filename; do
        for filename in "${filename%.*}.ll"; do
            make $filename
            outfile=$(echo $filename | tr '/' '.')
            outfile="${outfile:2}"
            cp $filename $outdir/$outfile
        done
    done
fi

for x in $outdir; do
    llc $x
done

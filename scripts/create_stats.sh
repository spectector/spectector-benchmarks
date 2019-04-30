if [ $# -lt 1 ]; then
    printf "Please pass as an argument the folder with the results\n"
    exit 1
fi

if ! cd "$1" 2> /dev/null; then
    printf "The folder %s doesn't exist\n" "$1" && exit 1
fi

printf "results=[" > stats.json
cat out/*.json >> stats.json
printf "{\"name\":\"summary\"}]" >> stats.json
printf "stats.json created\n"

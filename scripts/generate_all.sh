scripts=(./generate_clang.sh ./generate_intel.sh ./generate_gcc.sh)

usage () {
    printf "Usage: generate_all [-s sources]\n"
    exit 0
}

while getopts ":s:" option; do # parsing of the arguments
    case "${option}" in
	s ) sources=($OPTARG)
	    sf="-s $sources"
	    ;;
	* ) usage ;;
    esac
done

for call in ${scripts[@]}; do
    $call $sf -w bin 2> /dev/null
    $call $sf -w asm 2> /dev/null
done

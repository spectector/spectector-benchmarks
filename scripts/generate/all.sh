scripts=(./generate/clang.sh ./generate/intel.sh ./generate/gcc.sh)

usage () {
    printf "Usage: generate_all [-s sources]\n"
    exit 0
}

while getopts ":f:" option; do # parsing of the arguments
    case "${option}" in
	f ) flag=$OPTARG
	    ;;
	* ) usage ;;
    esac
done

for call in ${scripts[@]}; do
    $call $flag -w bin 2> /dev/null
    $call $flag -w asm 2> /dev/null
done

pc=victim_function_v$1
low=""
as=$2
case $1 in
    15 ) as="di=256"
	 low="256";;
    19 ) pc="main" ;;
    23 ) pc="attacker_function" ;;
    24 ) pc="another" ;;
    * ) if [ -n "$1" ] && ! [ "$1" -eq "$1" ] 2>/dev/null; then pc=0 # Check if it's a numeric argument (test suite or benchmarks suite)
	fi ;;
esac
printf "entry($pc).\nc([],[$as]).\nlow([$low]).\\nign([]).\\nheap(1024)."

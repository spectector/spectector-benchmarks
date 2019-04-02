file=$2

function solve () {
    func=$1
    if [[ "${functions_solved[@]}" =~ "$func" ]]; then
	return
    fi
    outf=$(sed -n "/.*\.type\t$func,@function.*/,/.*\.size\t$func.*/p" $file | sed "/\..*/d") # Get lines and remove directives
    lines=$(wc -l <<< "$outf")
    dependencies=$(grep "call" <<< "$outf" | sed "s/.*call.*\t\(.*\)/\1/ /.*%.*/d")
    let "total_lines += $lines"
    functions_solved+="$func"
    for x in $dependencies; do
	solve $x $file
    done
}

json="stats_assembly={"

for f in $(./scripts/get_function_names.sh $file); do
    functions_solved=()
    total_lines=0
    solve $f
    echo $f $total_lines
    json+="{\"id\"=\"$f\", \"dependencies\"=\"${functions_solved[@]}\", \"loc\"=$total_lines},"
done
json+="{}}"
echo $json > loc.json

# #! /bin/bash
# file=$2

# function get_loc {
#     echo "$(expr "$assignments" : ".*,$1:\([^,]*\),.*")"
# }

# function solve () {
#     func=$1
#     prev=$(get_loc $func)
#     if [[ ! $prev == "" ]]; then
# 	let "total_lines += $prev"
# 	return $prev
#     elif [[ "${functions_solved[@]}" =~ "$func" ]]; then
# 	return 0
#     fi
#     outf=$(sed -n "/.*\.type\t$func,@function.*/,/.*\.size\t$func.*/p" $file | sed "/\..*/d") # Get lines and remove directives
#     lines=$(wc -l <<< "$outf")
#     dependencies=$(grep "call" <<< "$outf" | sed "s/.*call.*\t\(.*\)/\1/"  | sed "/.*%.*/d")
#     let "total_lines += $lines"
#     functions_solved+="$func"
#     for x in $dependencies; do
# 	j=$(solve $x $file)
# 	let "lines += $j"
#     done
#     assignments+="$f:$lines,"
#     return $lines
# }

# printf "stats_assembly={" > loc.json

# assignments=","
# for f in $(./scripts/get_function_names.sh $file); do
#     functions_solved=()
#     total_lines=0
#     solve $f
#     echo $f $total_lines
#     printf "{\"id\"=\"$f\", \"dependencies\"=\"${functions_solved[@]}\", \"loc\"=$total_lines}," >> loc.json
# done
# printf "{}}" >> loc.json


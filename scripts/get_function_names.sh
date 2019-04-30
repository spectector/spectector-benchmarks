# TODO: Get the function names by ".type functionName, @function": DONE?
sed -n -e 's/\([[:blank:]]\|\)\.type\([[:blank:]]\|\)\(.*\),\([[:blank:]]\|\)@function/\3/p' $1
#sed -n -e '/\.cfi_startproc/{x;p;d;}; s/:.*//' -e x $1

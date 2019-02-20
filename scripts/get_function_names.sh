# TODO: Get the function names by ".type functionName, @function"
sed -n -e '/\.cfi_startproc/{x;p;d;}; s/:.*//' -e x $1

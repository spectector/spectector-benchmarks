#! /bin/bash
csmith --max-funcs 1 --max-block-size 3 --quiet --concise --no-hash-value-printf --no-builtins --disable-builtin-kinds k1 --disable-builtin-kinds k2 --no-checksum --nomain --no-math64 --no-paranoid --no-pointers --no-structs --no-unions -o /tmp/csmith.c
# csmith --max-funcs 1 --max-block-size 3 --quiet --concise --no-hash-value-printf --no-checksum --nomain -o /tmp/csmith.c
printf "int main(){func_1(); return 0;}" >> /tmp/csmith.c # To don't optimize the function
./generate_clang.sh -c "-I${CSMITH_HOME}/runtime" -s /tmp/csmith.c
./generate_gcc.sh -c "-I${CSMITH_HOME}/runtime" -s /tmp/csmith.c
./generate_intel.sh -c "-I${CSMITH_HOME}/runtime" -s /tmp/csmith.c
../check_security.sh -p csmith -m "intel clang gcc"

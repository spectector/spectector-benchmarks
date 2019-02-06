#! /bin/bash
# Disassembly of binaries to at&t format
if ! [ -w $(dirname "$1") ]; then
    printf "Cannot write on the directory of the file\n"
    exit 1
fi

objdump -d --disassembler-options=att --no-show-raw-insn $1 | tail -n+7 | sed "s/.*<\(.*\)>:/\1:/; s/\t/\n\t/; s/<.*//;" | sed "0~2 s/[ ]\+//" > $1.s

echo ".data" >> $1.s
objdump -D -j .data $1 | sed 's/.*<\(.*\)>:/.type\t\1/; s/.*:\t\(.*\)\t.*/\1/; s/\([0-f][0-f]\) /.byte \1\n/g; s/\.\.\.//' | tail -n+8 >> $1.s

echo ".bss" >> $1.s
objdump -D -j .bss $1 | sed 's/.*<\(.*\)>:/.type\t\1/; s/.*:\t\(.*\)\t.*/\1/; s/\([0-f][0-f]\) /.byte \1\n/g; s/\.\.\.//' | tail -n+8 >> $1.s

objdump -r --disassembler-options=att $1 | tail -n+6 | sed -n '/^$/q;p' | sed 's/.* .* / /; s/-.*//' > /tmp/table
while read LINE; do
    sed "0,/0x0(%rip)/{s/0x0(%rip)/$LINE(%rip)/}" $1.s > /tmp/out.s
    cp /tmp/out.s $1.s
done < /tmp/table

for x in ../target/*/*/*.o; do
    ./disassembly.sh $x
done

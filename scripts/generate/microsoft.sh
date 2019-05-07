#! /bin/bash

# Compiled with VS 2017 Developer Command Prompt v15.8.9
# Visual C/C++ compiler 19.15.26732.1
# cl /c [/Qspectre] /O2|Od *.c /Fo*.obj
# cl /c /FA [/Qspectre] /O2|Od *.c /Fa*.asm


userIn=$(cmd.exe /c "echo %USERNAME%")
user=${userIn::-1}
tmpdir="/mnt/c/Users/$user/Appdata/Local/Temp/"

copy(){
    cp $1 $tmpdir/spect.c
}

get(){
    cp $tmpdir/spect.asm $1
}

function msvc() { # src opts dst
    copy "$1"
    cmd.exe /c "cd C:\Users\%USERNAME% & C:\PROGRA~2\MICROS~1\2017\Community\VC\Tools\MSVC\14.15.26726\bin\Hostx64\x64\cl.exe C:\Users\%USERNAME%\Appdata\Local\Temp\spect.c ""$2"" /FaC:\Users\%USERNAME%\Appdata\Local\Temp\spect.asm"
    get "$3"
}

for code in ../sources/compiler-countermeasures/*.c; do
    filename=$(basename -- "$code")
    num="${filename%.*}"
    mkdir -p ../target/microsoft/$num
    msvc $code "/c /FA /Od" ../target/microsoft/$num/any.o0.asm
    msvc $code "/c /FA /O2" ../target/microsoft/$num/any.o2.asm
    msvc $code "/c /FA /Od /Qspectre" ../target/microsoft/$num/lfence.o0.asm
    msvc $code "/c /FA /O2 /Qspectre" ../target/microsoft/$num/lfence.o2.asm
done
echo "Files generated correctly"

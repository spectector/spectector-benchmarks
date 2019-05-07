@echo off

set comp=19

for %%x in (01 02 03 04 05 06 07 08 09 10 11ker 12 13 14 15)  do (
    cl.exe ../sources/compiler-countermeasures/%%x.c /c /FA /Od /Fa../target/microsoft-%comp%/%%x/any.o0.asm
    cl.exe ../sources/compiler-countermeasures/%%x.c /c /FA /O2 /Fa../target/microsoft-%comp%/%%x/any.o2.asm
    cl.exe ../sources/compiler-countermeasures/%%x.c /c /FA /Od /Qspectre /Fa../target/microsoft-%comp%/%%x/lfence.o0.asm
    cl.exe ../sources/compiler-countermeasures/%%x.c /c /FA /O2 /Qspectre /Fa../target/microsoft-%comp%/%%x/lfence.o2.asm
    )






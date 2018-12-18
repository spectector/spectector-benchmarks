# Reproducing the results from the paper "Spectector: Principled Detection of Speculative Information Flows"

This repository contains the benchmarks from the paper "Spectector: Principled
Detection of Speculative Information Flows" (available [here](TODO)). Here we
describe how to reproduce the experimental results from the Spectector's paper.

## <a name="benchmarks"></a> Benchmarks

The benchmarks used in the paper are the fifteen variants of the SPECTRE v1
proof-of-concept developed by Paul Kocher (available [here](https://www.paulkocher.com/doc/MicrosoftCompilerSpectreMitigation.html)).

The folder `sources` contains the source files in the C language taken from
[here](https://www.paulkocher.com/doc/MicrosoftCompilerSpectreMitigation.html).
To account for minor syntactic differences between the C dialects supported by
the targets compilers, we adapted the Paul Kocher's examples for each compiler.
The folders `sources/clang`, `sources/intel`, and `sources/microsoft` contain
respectively the programs used with the Clang compiler, the Intel icc compiler,
and the Microsoft Visual C++ compiler.

The folder `target` contains the assembly programs that have been obtained by
compiling the fifteen variants of the SPECTRE v1 proof-of-concept developed by
Paul Kocher (available
[here](https://www.paulkocher.com/doc/MicrosoftCompilerSpectreMitigation.html))
using the Clang, Intel icc, and Microsoft Visual C++ compilers with different
levels of optimization and protection against SPECTRE attacks. Specifically, the
folders `target/clang`, `target/intel`, and `target/microsoft` contain
respectively the assembly programs obtained using the Clang, Intel icc, and
Microsoft Visual C++ compilers. We refer the interested reader to Section VII.A
of the [paper](TODO) for a detailed description of how the assembly programs
have been obtained.

### Compile the files with the Clang compiler

We obtained the source programs in the `target/clang` folder by compiling the
files in `sources/clang` with the Clang compiler v7.0.0. 

We refer the reader to
the script `generate_clang.sh` in the folder `scripts` for more
information. Note that running the script requires a working version of the
`clang` and `llc` binaries in your `PATH`.

### Compile the files with the Intel icc compiler

We obtained the source programs in the `target/intel` folder by
compiling the files in `sources/intel` with the Intel icc compiler
v19.0.0.117.

We refer the reader to the script `generate_intel.sh` in the folder `scripts`
for more information. Note that running the script requires a working version of
the Intel icc compiler installed at `/opt/intel/bin/icc`.

### Compile the files with the Microsoft Visual C++ compiler

We obtained the source programs in the `target/microsoft` folder by
compiling the files in `sources/microsoft` with the Microsoft Visual
C++ compiler v19.15.26732.1.

We refer the reader to the script `generate_microsoft.sh` in the folder
`scripts` for more information. We tested the script with Windows 10 Pro using
the Windows Linux Subsystem with kernel 4.4.0



## Generate the results from Figure 9

Once Spectector is correctly installed, one may reproduce the results from
Figure 9 by running the script `check_security.sh`, which can be found in the
`scripts` folder.
The script runs Spectector on all the assembly programs (in the folder `target`)
described in the paper.
The results of each execution will be stored in the folder `results/out`.
Additionally, the script produces a textual representation of Figure 9 in the
file `results/summary.txt`, where L indicates that Spectector identified a
speculative leak while S denotes that Spectector proved the corresponding program's
security.
Note that both `results/out` and `results/summary.txt` will be overwritten every
time the script `check_security.sh` is ran.

The results on the file `results/summary.txt` are labeled by the next pattern:
`L` if there's a leak
`N` if the program is secure
`?` if Spectector can't solve the program
`*` if there's a timeout in the SMT solver, so a seurity condition cannot be given
`~` if there's a timeout in Spectector, this can be solved by increasing the 
	timeout (it's a script argument)

## Obtaining timing measurements

The script `timing.sh` in `scripts` can be used for measuring the time
taken by Spectector for analyzing all the programs in the folder `targer`.
The script takes as argument the number of times each file should be analyzed
(the default value is 3). All the timing measurements are stored in the folder
`results/timing`.

The Python script `statistics_time.py` in the folder `script` processes
the timing measurements in the folder `results/timing` produced by `timing.sh`,
and it generates a CSV file containing the average, maximum and minimum times needed
to analyze each input file.

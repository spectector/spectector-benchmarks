# Reproducing the results from the paper "Spectector: Principled Detection of Speculative Information Flows"

This repository contains the benchmarks from the paper "Spectector:
Principled Detection of Speculative Information Flows" (available
[here](https://spectector.github.io/papers/spectector.pdf)). Here we
describe how to reproduce the experimental results from the
Spectector's paper.

## <a name="benchmarks"></a> Benchmarks

The benchmarks used in the paper are the fifteen variants of the
SPECTRE v1 proof-of-concept developed by Paul Kocher (available
[here](https://www.paulkocher.com/doc/MicrosoftCompilerSpectreMitigation.html)).

The folder `sources` contains the source files in the C language taken
from
[here](https://www.paulkocher.com/doc/MicrosoftCompilerSpectreMitigation.html).
To account for minor syntactic differences between the C dialects
supported by the targets compilers, we adapted the Paul Kocher's
examples for each compiler.  The folder
`sources/compiler-countermeasures` contains the subfolders `microsoft`
and `unix` that contain respectively the programs used with the Clang
compiler, the Intel icc compiler, and the Microsoft Visual C++
compiler.

The folder `target` contains the assembly programs that have been
obtained by compiling the fifteen variants of the SPECTRE v1
proof-of-concept developed by Paul Kocher (available
[here](https://www.paulkocher.com/doc/MicrosoftCompilerSpectreMitigation.html))
using the Clang, Intel icc, and Microsoft Visual C++ compilers with
different levels of optimization and protection against SPECTRE
attacks. Specifically, the folders `target/clang`, `target/intel`, and
`target/microsoft` contain respectively the assembly programs obtained
using the Clang, Intel icc, and Microsoft Visual C++ compilers.  The
folder `target/microsoft` contains two folders `cl 19.15` and `cl
19.29` containing respectively the assembly programs generated using
the Microsoft Visual C++ compiler versions v19.15.26732.1 and
v19.20.27317.96. We refer the interested reader to Section VII.A of the
[paper](https://spectector.github.io/papers/spectector.pdf) for a
detailed description of how the assembly programs have been obtained.

### Compile the files with the Clang compiler

We obtained the source programs in the `target/clang` folder by
compiling the files in `sources/clang` with the Clang compiler v7.0.0.

We refer the reader to the script `clang.sh` in the folder
`scripts/generate` for more information. Note that running the script
requires a working version of the `clang` and `llc` binaries in your
`PATH`.

### Compile the files with the Intel icc compiler

We obtained the source programs in the `target/intel` folder by
compiling the files in `sources/intel` with the Intel icc compiler
v19.0.0.117.

We refer the reader to the script `intel.sh` in the folder
`scripts/generate` for more information. Note that running the script
requires a working version of the Intel icc compiler installed at
`/opt/intel/bin/icc`.

### Compile the files with the Microsoft Visual C++ compiler

We obtained the source programs in the `target/microsoft` folder by
compiling the files in `sources/microsoft` with the Microsoft Visual
C++ compiler v19.15.26732.1 and VS 19.20.27508.

We refer the reader to the script `microsoft.bat` in the folder
`scripts/generate` for more information. We tested the script with
Windows 10 Pro using the Windows Linux Subsystem with kernel 4.4.0

## Generate the results from Figure 7

Once Spectector is correctly installed, one may reproduce the results
from Figure 7 by running the script `check_security.sh`.  The script
runs Spectector on all the assembly programs (in the folder `target`)
described in the paper.  The results of each execution will be stored
by default in the folder `results`. Inside it we will find the folder
`out` with the individual results.  Additionally, the script produces
the file `stats.json` with all the stats necessary to visualize the
information.

 **For Mac users:** the script `check_security.sh` uses the `gtimeout`
 command, which can be obtained, for instance, by executing `brew
 install coreutils`.

## Analyzing xen hypervisor

### Retrieving the Xen Project Hypervisor source code

The `sources/xen` folder is the mirror to
https://xenbits.xen.org/git-http/xen.git on the 4.10.0-shim-comet-3
commit. Run the `configure` file located on the root folder. If you
want to do it manually, just clone that repository and run `git
checkout 4.10.0-shim-comet-3`. Modify the Makefile located on `xen`
folder of the repository by:
- Adding `clang=y`
- Changing the line `+%.o %.i %.s: %.c FORCE` (l. 253) by `+%.o %.i
%.s %.ll: %.c FORCE`

### Obtaining no linked files

Then, obtain all the LLVM bytecode files and all the no linked
assembly files by running the `obtain_project_files.sh` script
(located on `scripts`) passing as arguments the project folder and the
output folder (i.e. `sources/xen/xen` and `target/xen_no_linked`), it will
store all the generated LLVM bytecode files on the folder specified.

### Obtaining linked files

Then, run the `solve_dependecies.pl` script (located on `locality`)
over the folder where the LLVM bytecode files are, that will create
the assembly files without the missing dependencies on the project.

Also, it can be ontained a single assembly file by running
`solve_dependecies.pl` with the `-l` flag.

**For running `solve_dependecies.pl` the next programs must be
installed: `sed`, `llvm-nm`, `llvm-as` and `llc`**

### Analyzing generated files

For analizing the generated files you must run `check_security.sh`
with the next parameters:

`time ./check_security.sh -i $folder_no_linked_files -r
$folder_linked_files -o $output_directory -j $tmp_jobs_file -z
$number_of_parallel instances -f "--parse-uns --noinit --track-all-pc
--bound-paths 25 --use-dump --no-show-def --nextpath-timeout 1000
--noninter-timeout 60000 --timeout 300000" -t 600`

## Naming scheme of the results

`check_security.sh` have the `-o` option for writing the results on
the selected folder.  After the run the folder selected will contain
the folder `out` and the file `stats.json`.  Also, for not overwriting
the previous results, a folder with the actual time will be created to
allocate them.

## Visualizing the results

After the `check_security.sh` script is ran. The contents shown by
default are the ones of the file `stats.json` and the folder `out`
located on the folder `results`, but it can be customized to show the
ones you want.

### Table with the results

For visualizing the information in a table, open the `report.html`
file on a navigator. It'll show a legend with the color correspondence
to the status of the results and a table per compiler where each
experiment is a cell of the table.

It's also produced a more detailed view for each run by clicking on
the cell you want.

### Graphs of the results

For showing graphs like the ones from figure 8, the files on the
`dataAnalysis/analysis.py` folder must be used. When it's ran, it will
generate pdf files with the graphs. An example of how this must be ran
is the next: `./analysis.py --unsupported-as-skip results_skip/out
--unsupported-as-skip-paths results_skip/out --mode skip --analysis
paper`

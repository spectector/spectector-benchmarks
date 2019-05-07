# <a name="benchmarks"></a> Reproducing the results from the paper "Spectector: Principled Detection of Speculative Information Flows"

This repository contains the benchmarks from the paper "Spectector:
Principled Detection of Speculative Information Flows" (available
[here](https://spectector.github.io/papers/spectector.pdf)). Here we
describe how to reproduce the experimental results from the
Spectector's paper.

## Case Study: Compiler countermeasures (Section VIII)

The benchmarks used in the first case study of the paper (Section
VIII) are the fifteen variants of the SPECTRE v1 proof-of-concept
developed by Paul Kocher (available
[here](https://www.paulkocher.com/doc/MicrosoftCompilerSpectreMitigation.html)).

The folder `sources/compiler-countermeasures` contains the source
files in the C language taken from
[here](https://www.paulkocher.com/doc/MicrosoftCompilerSpectreMitigation.html).
To account for minor syntactic differences between the C dialects
supported by the targets compilers, we adapted the Paul Kocher's
examples for each compiler.

The folder `target` contains the assembly programs that have been
obtained by compiling the fifteen variants of the SPECTRE v1
proof-of-concept developed by Paul Kocher (available
[here](https://www.paulkocher.com/doc/MicrosoftCompilerSpectreMitigation.html))
using the Clang, Intel icc, and Microsoft Visual C++ compilers with
different levels of optimization and protection against SPECTRE
attacks. Specifically, the folders `target/clang`, `target/intel`, and
`target/microsoft` contain respectively the assembly programs obtained
using the Clang, Intel icc, and Microsoft Visual C++ compilers.  The
folder `target/microsoft` contains the folders `cl 19.15` and `cl
19.29` containing respectively the assembly programs generated using
the Microsoft Visual C++ compiler versions v19.15.26732.1 and
v19.20.27317.96. We refer the interested reader to Section VIII.A of
the [paper](https://spectector.github.io/papers/spectector.pdf) for a
detailed description of how the assembly programs have been obtained.

### Compile the files with the Clang compiler

We obtained the source programs in the `target/clang` folder by
compiling the files in `sources/compiler-countermeasures` with the
Clang compiler v7.0.0.

We refer the reader to the script `clang.sh` in the folder
`scripts/generate` for more information. Note that running the script
requires a working version of the `clang` and `llc` binaries in your
`PATH`.

### Compile the files with the Intel icc compiler

We obtained the source programs in the `target/intel` folder by
compiling the files in `sources/compiler-countermeasures` with the
Intel icc compiler v19.0.0.117.

We refer the reader to the script `intel.sh` in the folder
`scripts/generate` for more information. Note that running the script
requires a working version of the Intel icc compiler installed at
`/opt/intel/bin/icc`.

### Compile the files with the Microsoft Visual C++ compiler

We obtained the source programs in the `target/microsoft/cl 19.15`
(respectively `target/microsoft/cl 19.20`) folder by compiling the
files in `sources/compiler-countermeasures` with the Microsoft Visual
C++ compiler v19.15.26732.1 (respectively v19.20.27317.96).

We refer the reader to the script `microsoft.bat` in the folder
`scripts/generate` for more information. We tested the script with
Windows 10 Pro using the Windows Linux Subsystem with kernel 4.4.0

### Generate the results from Figure 7

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

## Case study: Xen Project Hypervisor (Section IX)

The benchmark used in the second case study of the paper (Section XI)
is the Xen Project Hypervisor, whose code is available
[here](https://xenbits.xen.org/git-http/xen.git).

### Retrieving the Xen Project Hypervisor source code

The `sources/xen` folder mirrors the official Xen Project repository
https://xenbits.xen.org/git-http/xen.git at the commit
`4.10.0-shim-comet-3`.

Run the command `git submodule update --init` in the repository's main
folder to obtain hypervisor.



### Generating the assembly files

One can  generate the assembly files used in our experiments following the steps
outlined below.

#### 1. Preparation

Before compiling the hypervisor, it is necessary to: 
1. Execute the `configure` file located in the `sources/xen` folder to get the
`Makefile` correctly
2. Modify the `Makefile` located in the `sources/xen/xen` folder as follows:
    * Add `clang=y` in the first line
    * Replace the line `+%.o %.i %.s: %.c FORCE` (line 253) with `+%.o
    %.i %.s %.ll: %.c FORCE`

[MARCO: I guess we need to run `make` at some point?]

#### 2. Generating LLVM intermediate bytecode
Next, we generate the LLVM bytecode and assembly files corresponding
to each of the source files in the hypervisor.

To do so, execute the
`obtain_project_files.sh` script (located in the folder
`scripts`) while passing as arguments the folder of
the Xen hypervisor (i.e., `sources/xen/xen`) and the target folder
(i.e., `target/xen_no_linked`).

Concretely, from the repository's main folder run the following command:

```
    scripts/obtain_project_files.sh -i sources/xen/xen -o target/xen_no_linked
```

The script compiles each source file in the hypervisor and it
generates the corresponding LLVM bytecode and assembly files.

 **For Mac users:** the script `obtain_project_files.sh` uses the `grealpath`
 command, which can be obtained, for instance, by executing `brew
 install coreutils`.

 [MARCO: Fix this!]

#### 3. Linking all the files together

Next, we solve the dependencies between files and we link all of them together. by running the `solve_dependecies.pl` script located in  the `scripts` folder.

[Marco: Move `solve_dependecies.pl` to `scripts`]

To do so, perform the following steps:
1. Execute the `solve_dependecies.pl` script located in  the `scripts` folder on the folder `target/xen_no_linked` containing the `.ll` files. Concretely, run the following command from the repository's main folder:

``` 
scripts/solve_dependencies.pl -i target/xen_no_linked -o target/xen -l global.ll
```
2. Run `llc` to generate the assembly file:
```
llc target/xen/global.ll
```

**Note:** Executing the `solve_dependecies.pl` script requires the following programs to be installed in the system: `sed`, `llvm-nm`, `llvm-as` and `llc`.

#### 4. Preparing the experiments

To run `check_security.sh`, previously you've to get the assembly
files corresponding to the files that aren't linked yet by running
`for file in $folder_no_linked_files; do; llc $file; done`

[Marco: Isn't this step already part of `obtain_project_files.sh`?]

### Analyzing generated files

For analizing the generated files you must run `check_security.sh`
with the next parameters:

`time ./check_security.sh -i $folder_no_linked_files -r
$linked_files -o $output_directory -g $global_assembly -j
$tmp_jobs_file -z $number_of_parallel instances -f "--parse-uns
--noinit --track-all-pc --bound-paths 25 --use-dump --no-show-def
--nextpath-timeout 1000 --noninter-timeout 60000 --timeout 300000" -t
600`

**The linked files can be either the folder that contains the linked
assembly files or an assembly file that contains all the functions
linked**

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

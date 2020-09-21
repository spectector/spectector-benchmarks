# <a name="benchmarks"></a> README

This repository contains the benchmarks from the papers "Spectector:
Principled Detection of Speculative Information Flows" (available
[here](https://spectector.github.io/papers/spectector.pdf)) and 
"Hardware/software contracts for secure speculation" (available
[here](https://spectector.github.io/papers/hwsw-contracts.pdf)). 

Here we describe how to reproduce the experimental results from the
Spectector's paper. For the hardware/software contracts paper, see the `hwsw-contracts` folder.

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
by default in the folder `results`.  Inside it we will find the folder
`out` with the individual results.  Additionally, the script produces
the file `stats.json` with all the stats necessary to visualize the
information.

 **For Mac users:** the script `check_security.sh` uses the `gtimeout`
 command, which can be obtained, for instance, by executing `brew
 install coreutils`.

## Case study: Xen Project Hypervisor (Section IX)

The benchmark used in the second case study of the paper (Section IX) is the Xen
Project Hypervisor, whose code is available
[here](https://xenbits.xen.org/git-http/xen.git).

### Retrieving the Xen Project Hypervisor source code

The `sources/xen` folder mirrors the official Xen Project repository
https://xenbits.xen.org/git-http/xen.git at the commit
`4.10.0-shim-comet-3`.

Run the command `git submodule update --init` in the repository's main
folder to obtain hypervisor.

### Generating the assembly files

One can generate the assembly files used in our experiments following
the steps outlined below.

#### 1. Preparation

Before compiling the hypervisor, it is necessary to:
1. Execute the `configure` file located in the `sources/xen` folder to
   get the `Makefile` correctly
2. Modify the `Makefile` file located in the `sources/xen/xen` folder as
   follows:
    * Add `clang=y` in the first line
    * Replace the line `+%.o %.i %.s: %.c FORCE` (line 253) with `+%.o
      %.i %.s %.ll: %.c FORCE`
3. Modify the `Rules.mk` file located in the `sources/xen/xen` folder as follows:
    * Add `clang=y` in the first line
    * Replace the line `CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith` with `CFLAGS += -Wredundant-decls -Wno-pointer-arith`
    * Replace the line `CFLAGS += -pipe -g -D__XEN__ -include $(BASEDIR)/include/xen/config.h` with `CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h`
    * Add the following text after line 206:
        ```
        %.ll: %.c Makefile
            $(CC) $(CFLAGS) -flto -fshort-wchar -S -emit-llvm $< -o $@
        ```

#### 2. Compiling the files in isolation
Next, we generate the LLVM bytecode and assembly files corresponding
to each of the source files in the hypervisor.

To do so, execute the `obtain_project_files.sh` script (located in the folder
`scripts`) while passing as arguments the folder of the Xen hypervisor (i.e.,
`sources/xen/xen`) and the target folder (i.e., `target/xen_no_linked`). For the
next steps, we also need to generate the object files. Therefore, we pass
`clean` as the last argument to the script.

Concretely, from the repository's main folder run the following
command:

```
    scripts/obtain_project_files.sh sources/xen/xen target/xen_no_linked clean
```

The script compiles each source file in the hypervisor and it
generates the corresponding LLVM bytecode and assembly files.

**Note:** If the folder `target/xen_no_linked` does not exist, you
should create it before executing `scripts/obtain_project_files.sh`.

 **For Mac users:** the script `obtain_project_files.sh` uses the
 `grealpath` command, which can be obtained, for instance, by
 executing `brew install coreutils`.

#### 3. Linking all the files together

Next, we solve the dependencies between files and we link all of them
together by running the `solve_dependecies.pl` script located in the
`scripts` folder.

To do so, perform the following steps:
1. Execute the `solve_dependecies.pl` script located in the `scripts`
   folder on the folder `target/xen_no_linked` containing the `.ll`
   files. Concretely, run the following command from the repository's
   main folder:

```
scripts/solve_dependencies.pl -i target/xen_no_linked -o target/xen -l global.ll
```
2. Run `llc` to generate the assembly file:
```
llc target/xen/global.ll
```

**Note:** Executing the `solve_dependecies.pl` script requires the
following programs to be installed in the system: `sed`, `llvm-nm`,
`llvm-as` and `llc` (in addition to the Ciao environment).

### Running the experiments

To run the experiments, run the `check_security.sh` script from the
repository's main folder as follows:

```
nohup bash -c 'time ./check_security.sh -i target/xen_no_linked -r target/xen -o $result_folder -z $number_of_parallel_instances -j $tmp_jobs_file -f "--parse-uns --skip-uns --noinit --track-all-pc --bound-paths 25 --use-dump --no-show-def --continue-on-leak --nextpath-timeout 60000 --noninter-timeout 60000 --timeout 12000000 --steps 10000" -t 14400' &
```

In the above command, `-z $number_of_parallel_instances` defines the
number of parallel instances of Spectector that should be executed in
parallel, `-i target/xen_no_linked` defines the folder where ther are
the no linked assembly files and which files and functions should be
analyzed, in the same way, `-r target/xen` defines the linked files
(it can be either a folder or a file) and `-j $tmp_jobs_file`
indicates a temporary file where the script stores the list of all
parallel jobs to be executed. Finally, `-o $result_folder` can be used
to specify the folder where the analysis' results are stored.

**Note:** The above command fails whenever the `$result_folder` folder
does not exists.  Hence, create the folder `$result_folder` folder
before launching the experiments.

After the execution, the analysis' results can be found in the
`$result_folder` folder.  This folder will contain the folder `out`
(with the detailed logs for each analyzed function) and the file
`stats.json` summarizing the results.  To avoid overwriting prior
results, the original content of `$result_folder` is moved in
`$result_folder\$current_time` where `$current_time` is the timestamp
of when the script is executed.

### Visualizing the results

The file `report.html` (located in the root folder of the repository)
implements a simple tool for navigating the outcome of the
experiments. To visualize the results, simply open the file
`report.html` using your favorite browser.

The contents shown by default are the ones from the file
`results/stats.json` and the folder `results/out`.
To show the report associated with files stored in a  folder `$result_folder`, access the page 
`report.html?$result_folder/stats.json`.

**Note:** To use `report.html`, Javascript must be enabled in your
browser.

### Generate the plots from Figure 8

The script `dataAnalysis/analysis.py` can be used to generate the plots from Figure 8.

From the repository's main folder, the script can be invoked as follows (where `$results_folder$` is the absolute path to the folder containing the results):
```
dataAnalysis/analysis.py --unsupported-as-skip $result_folder/out --unsupported-as-skip-paths  $result_folder/out --mode skip --analysis paper
```

Some of the metrics discussed in the paper (e.g., speedups and slowdowns) can be derived from `dataAnalysis/analysis.py` textual output.




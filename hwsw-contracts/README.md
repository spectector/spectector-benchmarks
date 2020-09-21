# <a name="benchmarks"></a> README

This folder contains the benchmarks from the paper "Hardware/Software
Contracts for Secure Speculation" (available
[here](https://spectector.github.io/papers/hwsw-contracts.pdf)). 

## Source programs

The benchmarks used in the paper are the four programs shown in Figure 1 and
Figure 5. The folder `sources` contains the source files in the C language
corresponding to the four programs.

## Target programs

The folder `target` contains the assembly programs that have been obtained by
compiling the four source programs using the using the Clang v10.0.0 compiler
with and without the automated insertion of `lfence`s after each branch
instruction.

We refer the reader to the script `clang.sh` in the folder `scripts/generate`
for more information on the specific compiler flags. Note that running the
script requires a working version of the `clang` binary in your `PATH`.

## Checking speculative non-interference using Spectector

We now describe how one can check speculative non-interference with respect to
the secure speculation contracts discussed in the paper.

* For the seq-ct contract, one does not need to check anything since speculative
  non-interference trivially holds with respect to the seq-ct contract. 

* For the spec-ct contract, one can check speculative non-interference by
  running the command `spectector <target>` where `<target>` is the program to
  be analyzed.

* For the seq-spec-ct-pc contract, one can check speculative non-interference by
  running the command `spectector --only-control <target>` where `<target>` is
  the program to be analyzed.

## Checking weak speculative non-interference using Spectector

We now describe how one can check weak speculative non-interference with respect
to the secure speculation contracts discussed in the paper.

* For the seq-ct contract, one does not need to check anything since weak
  speculative non-interference trivially holds with respect to the seq-ct
  contract.

* For the spec-ct contract, one can check speculative non-interference by
  running the command `spectector --weak <target>` where `<target>` is the
  program to be analyzed.

* For the seq-arch contract, one does not need to check anything since weak
  speculative non-interference trivially holds with respect to the seq-arch
  contract.

* For the seq-spec-ct-pc contract, one can check speculative non-interference by
  running the command `spectector --weak --only-control <target>` where
  `<target>` is the program to be analyzed.





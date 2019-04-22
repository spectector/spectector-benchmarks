#!/usr/bin/env ciao-shell
% -*- mode: ciao; -*-

:- use_package(fsyntax).
:- use_package(datafacts).
:- use_module(library(pathnames)).
:- use_module(library(write)).
:- use_module(library(streams)).
:- use_module(library(lists)).
:- use_module(library(system)).
:- use_module(library(process)).
:- use_module(library(process/process_channel)).
:- use_module(library(stream_utils)).
:- use_module(library(aggregates), [findall/3]).

% 3 steps:
%   Get the labels defined by each file
%   Set the dependency tree between files
%   Link the files (without dependencies)
:- export(labels_dic/2).
:- data labels_dic/2. % Key=Label, Values=File
:- export(files_deps/2).
:- data files_deps/2. % Key=File, Values=Files depends on

:- data show_error/0.

% main(Args) :- % TODO: Parse args (Input & Output)
% 	parse_args(Args,Opts),
% 	( member(indir(Indir), Opts), member(outdir(Outdir), Opts) -> true
% 	; show_help
% 	),
% 	directory_files(Indir, Files), fill_dependency(Indir, Files),
% 	link(Indir, Files, Outdir), write_string("Files linked\n").

:- export(fill_dependency/2).
fill_dependency(Indir, Files) :-
	retractall_fact(labels_dic(_,_)),
	retractall_fact(files_deps(_,_)),
	fill(Indir, Files), write_string("Tree of labels correspondance created\n"),
	dependency(Indir, Files), write_string("Dependency tree created\n").


parse_args(['-i',Indir|Args]) := [indir(Indir)|~parse_args(Args)] :-  !. % TODO: test folder existence
parse_args(['-o',OutDir|Args]) := [outdir(OutDir)|~parse_args(Args)] :-  !.
parse_args(['--show-error'|Args]) := ~parse_args(Args) :-  !, set_fact(show_error).
parse_args([A|Args]) := ~parse_args(Args) :- !, write(['Ignored argument: ', A]).
parse_args([],[]) :- !.

show_help :- write_string("Unrecognized argumets\nUsage:\n\tsolve_dependencies -i INPUT_DIR -o OUT_DIR\n"), halt(1).

fill(_Dir, []).
fill(Dir, [File|LS]) :-
	path_concat(Dir, File, FullName),
	path_splitext(FullName, Basename, '.ll'), !,
	process_call(path('llvm-as'), [FullName], []),  % Create a bytecode file to analyze % TODO: Get binaries paths
	path_splitext(BCFile, Basename, '.bc'),
	process_call(path('llvm-nm'), ['--defined-only', BCFile], [stdout(pipe(P))]),
	process_call(path('sed'), ['/.* T\\|D /!d; s/.* .* //'], [stdin(pipe(P)), stdout(atmlist(Labels))]),
	%process_call(path('sed'), ['s/.* .* //'], [stdin(pipe(P)), stdout(atmlist(Labels))]),
	fill_dic(Labels, File),
	fill(Dir, LS).
fill(Dir, [_File|LS]) :- fill(Dir, LS). % Files that don't match *.ll

fill_dic([], _).
fill_dic([H|Ls], F) :-
	( labels_dic(H, F2), F \= F2 ->
	  ( show_error ->
	      error_output(['[', F, '] \'', F2, '\' already contains the label \'', H, '\''])
	  ; true
	  )
	; assertz_fact(labels_dic(H, F))
	),
	fill_dic(Ls, F).

dependency(_Dir, []).
dependency(Dir, [File|Ls]) :-
	path_concat(Dir, File, FullName),
	path_splitext(FullName, Basename, '.ll'), !,
	path_splitext(BCFile, Basename, '.bc'),
	process_call(path('llvm-nm'), ['-u', BCFile], [stdout(pipe(P))]),
	process_call(path('sed'), ['s/.* .* //'], [stdin(pipe(P)), stdout(atmlist(Labels))]),
	retractall_fact(files_deps(File, _)),
	retractall_fact(file_deps(File, _)),
	dependency_files(File, Labels),
	dependency(Dir, Ls).
dependency(Dir, [_F|Ls]) :- dependency(Dir, Ls).

dependency_files(_File, []).
dependency_files(File, [H|Ls]) :-
	( labels_dic(H, F2) ->
	  ( files_deps(File, F2) -> true
	  ; assertz_fact(files_deps(File, F2))
	  )
	; ( show_error ->
	    error_output(['[', File, '] label not found: \'', H, '\''])
	  ; true
	  )
	),
	dependency_files(File, Ls).

link(_Directory, [], _Output_Dir).
link(SourceDir, [File|Ls], Outdir) :-
	path_splitext(File, _Basename, '.ll'), !,
	collect_and_solve(Outdir, SourceDir, File),
	link(SourceDir, Ls, Outdir).
link(SourceDir, [_H|Ls], Output_Dir) :- link(SourceDir, Ls, Output_Dir).


:- data files_to_link/1.
collect_and_solve(OutDir, SourceDir, File) :-
	retractall_fact(files_to_link(_)), %For avoiding circular dependencies
	collect(SourceDir, ~findall(X,files_deps(File,X))),
	% File is added at the begining because is the file we want the results
	( process_call(path('llvm-link'), [~path_concat(SourceDir, File)|~append(~findall(Y, files_to_link(Y)), ['--only-needed', '-o', ~path_concat(OutDir, File)])], [status(_)]) ->
	  true
	; true % If link fails % For possible errors
	).

collect(_SourceDir, []).
collect(SourceDir, [ToLink|Ls]) :-
	path_concat(SourceDir, ToLink, CompleteFile),
	( files_to_link(CompleteFile) -> true
	; assertz_face(files_to_link(CompleteFile)),
	  collect(SourceDir, ~findall(X,files_deps(ToLink,X))) % All the inner dpendencies
	),
	collect(SourceDir, Ls).

error_output([]) :- nl(user_error).
error_output([X|XS]) :- write(user_error, X), error_output(XS).
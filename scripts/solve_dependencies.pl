#!/usr/bin/env ciao-shell
% -*- mode: ciao; -*-

:- use_package(fsyntax).
:- use_package(datafacts).
:- use_module(library(pathnames)).
:- use_module(library(write)).
:- use_module(library(streams)).
:- use_module(library(lists)).
:- use_module(library(dict)).
:- use_module(library(system)).
:- use_module(library(process)).
:- use_module(library(process/process_channel)).
:- use_module(library(stream_utils)).

% 3 steps:
%   Get the labels defined by each file
%   Set the dependency tree between files
%   Link the files (without dependencies)
:- data labels_dic/1.
:- data show_error/0.

main(Args) :- % TODO: Parse args (Input & Output)
	parse_args(Args,Opts),
	( member(indir(Indir), Opts), member(outdir(Outdir), Opts) -> true
	; show_help
	),
	dictionary(D_Labels), % Key=Label, Values=File
	directory_files(Indir, Files), fill(D_Labels, Indir, Files),
	write_string("Tree of labels correspondance created\n"),
	set_fact(labels_dic(D_Labels)),
	dictionary(D_Files0),
	dependency(D_Files0, Indir, Files, D_Files), write_string("Dependency tree created\n"),
	link(D_Files, Indir, Files, Outdir), write_string("Files linked\n").

parse_args(['-i',Indir|Args]) := [indir(Indir)|~parse_args(Args)] :-  !. % TODO: test folder existence
parse_args(['-o',OutDir|Args]) := [outdir(OutDir)|~parse_args(Args)] :-  !.
parse_args(['--show-error'|Args]) := ~parse_args(Args) :-  !, set_fact(show_error).
parse_args([A|Args]) := ~parse_args(Args) :- !, write(['Ignored argument: ', A]).
parse_args([],[]) :- !.

show_help :- write_string("Unrecognized argumets\nUsage:\n\tsolve_dependencies -i INPUT_DIR -o OUT_DIR\n"), halt(1).

fill(_D, _Dir, []).
fill(D, Dir, [File|LS]) :-
	path_concat(Dir, File, FullName),
	path_splitext(FullName, Basename, '.ll'), !,
	process_call(path('llvm-as'), [FullName], []),  % Create a bytecode file to analyze % TODO: Get binaries paths
	path_splitext(BCFile, Basename, '.bc'),
	process_call(path('llvm-nm'), ['--defined-only', BCFile], [stdout(pipe(P))]),
	process_call(path('sed'), ['/.* T\\|D /!d; s/.* .* //'], [stdin(pipe(P)), stdout(atmlist(Labels))]),
	%process_call(path('sed'), ['s/.* .* //'], [stdin(pipe(P)), stdout(atmlist(Labels))]),
	fill_dic(D, Labels, File),
	fill(D, Dir, LS).
fill(D, Dir, [_File|LS]) :- fill(D, Dir, LS).

fill_dic(_D, [], _).
fill_dic(D, [H|Ls], F) :-
	( dic_get(D, H, F2) ->
	  ( show_error ->
	      error_output(['[', F, '] \'', F2, '\' already contains the label \'', H, '\''])
	  ; true
	  )
	; dic_lookup(D, H, F)
	),
	fill_dic(D, Ls, F).

dependency(D, _Dir, []) := D.
dependency(D_Files0, Dir, [File|Ls]) := ~dependency(D_Files1, Dir, Ls) :-
	path_concat(Dir, File, FullName),
	path_splitext(FullName, Basename, '.ll'), !,
	path_splitext(BCFile, Basename, '.bc'),
	process_call(path('llvm-nm'), ['-u', BCFile], [stdout(pipe(P))]),
	process_call(path('sed'), ['s/.* .* //'], [stdin(pipe(P)), stdout(atmlist(Labels))]),
	dic_lookup(D_Files0, File, []),
	dependency_files(D_Files0, File, Labels, D_Files1).
dependency(D_Files0, Dir, [_F|Ls]) := ~dependency(D_Files0, Dir, Ls).

dependency_files(D_Files, _File, []) := D_Files.
dependency_files(D_Files0, File, [H|Ls]) := ~dependency_files(D_Files1, File, Ls) :-
	( dic_get(~labels_dic, H, F2) ->
	  dic_get(D_Files0, File, Deps),
	  ( member(F2, Deps) -> D_Files1 = D_Files0
	  ; dic_replace(D_Files0, File, [F2|Deps], D_Files1)
	  )
	; D_Files1 = D_Files0,
	  ( show_error ->
	    error_output(['[', File, '] label not found: \'', H, '\''])
	  ; true
	  )
	).

link(_D_Files, _Directory, [], _Output_Dir).
link(D_Files, SourceDir, [File|Ls], Outdir) :-
	path_splitext(File, _Basename, '.ll'), !,
	collect_and_solve(D_Files, Outdir, SourceDir, File),
	link(D_Files, SourceDir, Ls, Outdir).
link(D_Files, SourceDir, [_H|Ls], Output_Dir) :- link(D_Files, SourceDir, Ls, Output_Dir).


:- data files_to_link/1.
collect_and_solve(D_Files, OutDir, SourceDir, File) :-
	set_fact(files_to_link([])), %For avoiding circular dependencies
	collect(D_Files, SourceDir, ~dic_get(D_Files, File)),
	% File is added at the begining because is the file we want the results
	( process_call(path('llvm-link'), [~path_concat(SourceDir, File)|~append(~files_to_link, ['--only-needed', '-o', ~path_concat(OutDir, File)])], [status(_)]) ->
	  true
	; true % If link fails % For possible errors
	).

collect(_D_Files, _SourceDir, []).
collect(D_Files, SourceDir, [ToLink|Ls]) :-
	path_concat(SourceDir, ToLink, CompleteFile),
	( member(CompleteFile, ~files_to_link) -> true
	; set_fact(files_to_link([CompleteFile|~files_to_link])),
	  collect(D_Files, SourceDir, ~dic_get(D_Files, ToLink)) % All the inner dpendencies
	),
	collect(D_Files, SourceDir, Ls).

error_output([]) :- nl(user_error).
error_output([X|XS]) :- write(user_error, X), error_output(XS).
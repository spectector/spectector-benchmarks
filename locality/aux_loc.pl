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
:- use_module(library(pillow/json)).
:- use_module(library(aggregates), [findall/3]).
:- use_module(library(numlists), [sum_list/3]).

:- use_module(solve_dependencies).

% 3 steps:
%   Get dependencies of files
%   Get loc of all labels
%   Follow dependency tree to sum the loc

:- data out/1.
:- data loc/2. % Key=Label, Value=loc
:- data functions_dependencies/2. % Key=Label, Value=loc

main(Args) :- % TODO: Parse args (Input & Output)
	parse_args(Args,Opts),
	( member(indir(Indir), Opts) -> true
	; show_help
	),
	directory_files(Indir, Files),
	fill_dependency(Indir, Files),
	fill_lines_of_code(Indir, Files),
	write_string("LOC obtained"), nl,
	fill_funcs_deps(Indir, Files),
	write_string("Dependencies between functions done"), nl,
	merge_loc,
	write_string("LOC merged"), nl,
	findall(Label=LabelLOC, (loc_dep(Label,LabelLOC)% , labels_dic(Label, F), atom_concat(~atom_concat(F, '_')), Label, Name
			       ), ListLOC),
	json_to_string(json(ListLOC), ToWrite),
	( out(File) -> open(File, write, Stream)
	; Stream = user
	),
	write_string(Stream, ToWrite).

parse_args(['-i',Indir|Args]) := [indir(Indir)|~parse_args(Args)] :-  !.
parse_args(['-o',OutJSON|Args]) := ~parse_args(Args) :-  !, set_fact(out(OutJSON)).
parse_args([_|Args]) := ~parse_args(Args) :- !.
parse_args([],[]) :- !.
%parse_args(Args,_) :- write(Args), show_help.

show_help :- write_string("Unrecognized argumets\nUsage:\n\tsolve_dependencies -i INPUT_DIR [-o JSON_FILE]\n"), halt(1).

fill_lines_of_code(_Indir, []).
fill_lines_of_code(Dir, [File|Ls]) :-
	path_concat(Dir, File, FullName),
	path_splitext(FullName, Basename, '.ll'), !,
	path_splitext(AssFile, Basename, '.s'),
	process_call(path(llc), [FullName], []), % Compiling the llvm bc file
	findall(X, labels_dic(X, File), Labels),
	get_func_loc(Labels, AssFile),
	fill_lines_of_code(Dir, Ls).
fill_lines_of_code(Indir, [_File|Ls]) :- fill_lines_of_code(Indir, Ls).

get_func_loc([], _AssFile).
get_func_loc([Function|Ls], AssFile) :- !,
	write(Function), write(' '), write(AssFile),
	atom_concat(~atom_concat('/\\t\\.type\\t',Function),',@.*/,/.*\\.size/p', Pattern),
	%atom_concat(Pattern0,~atom_concat(Function,'.*/p'),Pattern),
	process_pipe([
	  process_call(path(sed), ['-n', Pattern, AssFile]), % TODO: get also dependent functions (calls)
	  process_call(path(cloc), ['-', '--force-lang=Assembly', '--json', '--hide-rate'])
	], [stdout(string(StringJSON))]),
	( StringJSON = [] -> true
	; string_to_json(StringJSON, AtomJSON),
	  json_get(AtomJSON, 'Assembly', JSONloc),
	  json_get(JSONloc, code, Floc),
	  write(' '), write(Floc), nl,
	  assertz_fact(loc(Function, Floc))
	),
 	get_func_loc(Ls, AssFile).

fill_funcs_deps(Dir, [File|Ls]) :-
	path_concat(Dir, File, AssFile),
	path_splitext(AssFile, _Basename, '.s'), !,
	findall(X, labels_dic(X,File), Functions),
	deps_of_func(AssFile, Functions),
	fill_funcs_deps(Dir, Ls).
fill_funcs_deps(Dir, [_File|Ls]) :- fill_funcs_deps(Dir, Ls).
fill_funcs_deps(_Dir, []).

deps_of_func(File, [Func|Ls]) :-
	atom_concat('/\\t\\.type\\t', Func, ',@.*/,/\\.size\\t/p', Pattern),
	process_pipe([
	  process_call(path(sed), ['-n', Pattern, File]),
	  process_call(path(grep), ['call'], status(_)), % In the case there aren't calls
	  process_call(path(sort), ['-u']),
	  process_call(path(sed), ['s/.*call.*\\t\\(.*\\)/\\1/g'])
	], [stdout(atmlist(Labels))]),
	assertz_fact(function_dependencies(Func, Labels)),
	deps_of_func(File, Ls).
deps_of_func(_File, []).

:- data loc_dep/2.
merge_loc :- merge_loc1(~findall(F, loc(F, _))).

merge_loc1([Func|Ls]) :- loc_dep(Func, _), !, merge_loc1(Ls).
merge_loc1([Func|Ls]) :-
	loc(Func, LOC),
	collect(Func, Dependencies),
	% TODO: Collect all inner deps
	assertz_fact(loc_dep(Func, ~sum_list(~findall(Y1, (
							     member(Z, Dependencies),
							     ( loc(Z, Y0) -> Y1 = Y0
							     ; Y1 = 0
							     )
							  )), LOC))),
	merge_loc1(Ls).
merge_loc1([Func|Ls]) :-
	write_string(user_error, "Not able to get loc of "),
	write(user_error, Func), nl,
	merge_loc1(Ls).
merge_loc1([]).

collect(Func, Deps) :-
	functions_dependencies(Func, Deps0), !,
	findall(L,
	( member(X, Deps0),
	  L = [X|~collect(X)]
	), Deps).
collect(_Func, []).

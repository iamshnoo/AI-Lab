/*
Truth tables for logical expressions (3).
Generalize problem P2 in such a way that the logical expression may
contain any number of logical variables. Define table/2 in a way that
table(List,Expr) prints the truth table for the expression Expr, which
contains the logical variables enumerated in List.

Example:
?- table([A,B,C], A and (B or C) equ A and B or A and C).
true true true true
true true fail true
true fail true true
true fail fail true
fail true true true
fail true fail true
fail fail true true
fail fail fail true
*/

% -----------------------------------------------------------------
% and/2
% -----------------------------------------------------------------
and(A, B) :-
  A,
  B.
% -----------------------------------------------------------------
% or/2
% -----------------------------------------------------------------
or(A, _ ) :-
  A.

or( _ , B) :-
  B.
% -----------------------------------------------------------------
% equ/2
% logical equivalence
% (A <=> B) is logically equal to ((A and B) or (~A and ~B))
% -----------------------------------------------------------------
equ(A, B) :-
  or(and(A, B), and(not(A), not(B))).
% -----------------------------------------------------------------
% xor/2
% (A xor B) is logically equivalent to ~((A and B) or (~A and ~B))
% -----------------------------------------------------------------
xor(A, B) :-
  not(equ(A, B)).
% -----------------------------------------------------------------
% nor/2
% -----------------------------------------------------------------
nor(A, B) :-
  not(or(A, B)).
% -----------------------------------------------------------------
% nand/2
% -----------------------------------------------------------------
nand(A, B) :-
  not(and(A, B)).
% -----------------------------------------------------------------
% impl/2
% (A => B) is logically equal to (~A or B)
% -----------------------------------------------------------------
impl(A, B) :-
  or(not(A), B).
% -----------------------------------------------------------------
% bind(X) :-
% instantiate X to be true and false successively
% the two predicates below are translated into a
% single machine instruction.
% true/0 is predicate that is always true.
% fail/0 is a predicate that is always false.
% -----------------------------------------------------------------
bind(true).
bind(fail).
% -----------------------------------------------------------------
% table/3
% prints the truth table of a given logical expression in two variables.
% -----------------------------------------------------------------
table(A, B, Expr) :-
  bind(A),
  bind(B),
  do(A, B, Expr),
  fail.
% -----------------------------------------------------------------
% do/3
% -----------------------------------------------------------------
do(A, B, _ ) :-
  write(A),
  write('  '),
  write(B),
  write('  '),
  fail.

do( _ , _ , Expr) :-
  Expr,
  !,
  write(true),
  nl.

do( _ , _ , _ ) :-
  write(fail),
  nl.
% -----------------------------------------------------------------
% defining the predicates as operators
% precedence order : not > and = nand > or = nor > impl = equ > xor
% not has single argument, all other operations have 2 arguments
% -----------------------------------------------------------------
:- op(900, fy, not).
:- op(910, yfx, and).
:- op(910, yfx, nand).
:- op(920, yfx, or).
:- op(920, yfx, nor).
:- op(930, yfx, impl).
:- op(930, yfx, equ).
:- op(930, yfx, xor).
% -----------------------------------------------------------------
% table/2
% table(List,Expr) :-
% print the truth table for the expression Expr,
% which contains the logical variables enumerated in List.
% -----------------------------------------------------------------
table(VarList, Expr) :-
  bindList(VarList),
  do(VarList, Expr),
  fail.
% -----------------------------------------------------------------
% bindlist iterates the list of input logical variables
% and binds a value to each.
% -----------------------------------------------------------------
bindList([ ]).

bindList([V | Vs]) :-
  bind(V),
  bindList(Vs).
% -----------------------------------------------------------------
% -----------------------------------------------------------------
do(VarList, Expr) :-
  writeVarList(VarList),
  writeExpr(Expr),
  nl.
% -----------------------------------------------------------------
% writeVarList iterates the list of input logical variables and
% prints the binded value for each in the first n columns of output.
% -----------------------------------------------------------------
writeVarList([ ]).

writeVarList([V | Vs]) :-
  write(V),
  write('  '),
  writeVarList(Vs).
% -----------------------------------------------------------------
% the cut is red cut, because in the alternate case below
% we don't repeat any code
% -----------------------------------------------------------------
writeExpr(Expr) :-
  Expr,
  !,
  write(true).

writeExpr( _ ) :-
  write(fail).
% -----------------------------------------------------------------

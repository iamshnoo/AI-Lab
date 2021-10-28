/*
1. Truth tables for logical expressions (1).
Define predicates and/2, or/2, nand/2, nor/2, xor/2, impl/2 and equ/2 (for
logical equivalence) which succeed or fail according to the result of their
respective operations; e.g. and(A,B) will succeed, if and only if both A and
B succeed. Note that A and B can be Prolog goals (not only the constants
true and fail).
A logical expression in two variables can then be written in prefix notation,
as in the following example: and(or(A,B),nand(A,B)).
Now, write a predicate table/3 which prints the truth table of a given logical
expression in two variables.

Example:
?- table(A,B,and(A,or(A,B))).
true true true
true fail true
fail true fail
fail fail fail
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

% the cut is red cut, because in the alternate case below
% we don't repeat any code
do( _ , _ , Expr) :-
  Expr,
  !,
  write(true),
  nl.

do( _ , _ , _ ) :-
  write(fail),
  nl.
% -----------------------------------------------------------------

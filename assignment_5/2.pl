/*
Truth tables for logical expressions (2).
Continue problem P1 by defining and/2, or/2, etc as being operators. This
allows to write the logical expression in the more natural way, as in the
example: A and (A or not B). Define operator precedence as usual; i.e. as in
Java.

Example:
?- table(A,B, A and (A or not B)).
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
% precedene order has to be same as java
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

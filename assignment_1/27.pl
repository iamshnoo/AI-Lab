/*
To count numbers greater than 100.0 in a list.

?- greater(100, [101,102,99,98],X).
X = 2
*/

% worker predicate
% base case - if list is empty, answer is 0.
greater( _ , [ ], 0).

% inductive case 1
greater(N, [H | Q], X):-
    H > N,
    greater(N, Q, X1),
    X is X1 + 1.

% inductive case 2
greater(N, [H | Q], X):-
    H =< N,
    greater(N, Q, X).

% user function, calls the worker predicate with N = 100
greater([H | Q], X):-
    greater(100, [H | Q], X).

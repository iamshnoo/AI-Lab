/*
To find whether two elements are next to each other in a list.
*/

% base case 1 - Both elements present at start of list in orientation (X,Y)
adjacent(X, Y, [X, Y| _ ]).

% base case 2 (reverse orientation of above case - (Y,X))
adjacent(X, Y, [Y, X| _ ]).

% inductive case - check if elements are present in tail of list.
adjacent(X, Y, [ _ | Tail]) :-
    adjacent(X, Y, Tail).

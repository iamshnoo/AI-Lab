/*
To find the maximum number from a list.

*/

% define the max predicate to find the maximum of 2 numbers
max(X, Y, X):-
    X >= Y.

max(X, Y, Y):-
    Y > X.

% recursively find max of list using the max predicate.
% base case
list_max([X], X).

% inductive case
list_max([X | Rest], Max):-
    list_max(Rest, Max_Rest),
    max(X, Max_Rest, Max).

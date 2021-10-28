/*
To find the last element of a list.
*/

% base case - singleton
last([X], X).

% inductive case
last([ _ | Rest], X) :-
    last(Rest, X).

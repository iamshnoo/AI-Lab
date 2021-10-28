/*
To determine whether two lists are of same length.
*/

% base case - empty lists are equal in length
same_length([ ], [ ]).

% inductive case
same_length([ _ | Rest1], [ _ | Rest2]) :-
    same_length(Rest1, Rest2).

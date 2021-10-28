/*
To determine length of a list using your own number system,
that does not contain more than two symbols.

The number system is defined using 0 and the sucessor function.
*/

% base case - empty list has length of 0.
length1([ ], 0).

% inductive case
length1([ _ | Rest], s(N)) :-
    length1(Rest, N).

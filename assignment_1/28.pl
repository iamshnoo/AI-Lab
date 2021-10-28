/*
To split a list of numbers in two lists such that
one contains negative numbers
and other contains positive numbers.

?- split([-2,-3,2,3], L1, L2).
L1 = [2, 3],
L2 = [-2, -3].
*/

% base case, if list is empty, both outputs are empty.
split([ ], [ ], [ ]).

% inductive case 1 - store non-negative elements in list L1.
split([X | L], [X | L1], L2):-
        X >= 0,
        split(L, L1, L2),
        !.

% inductive case 2 - store negative elments in list L2.
split([X | L], L1, [X | L2]):-
        split(L, L1, L2).

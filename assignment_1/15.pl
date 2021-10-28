/*
To find the last but one element of a list.

[trace]  ?- second_last([1,2,3,4], X).
Call: (10) second_last([1, 2, 3, 4], _10436) ? creep
Call: (11) append(_10910, [_10436, _10852], [1, 2, 3, 4]) ? creep
Call: (12) append(_10904, [_10436, _10852], [2, 3, 4]) ? creep
Call: (13) append(_10954, [_10436, _10852], [3, 4]) ? creep
Exit: (13) append([], [3, 4], [3, 4]) ? creep
Exit: (12) append([2], [3, 4], [2, 3, 4]) ? creep
Exit: (11) append([1, 2], [3, 4], [1, 2, 3, 4]) ? creep
Exit: (10) second_last([1, 2, 3, 4], 3) ? creep
X = 3 .
*/

% define the append predicate
append([ ], L, L).
append([X | L1], L2, [X | L3]) :-
    append(L1, L2, L3).

% using append predicate to store second last element of L in X
second_last(L, X) :-
    append( _ , [X, _ ], L).

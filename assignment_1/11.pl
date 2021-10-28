/*
To find whether an element is a member of a list using append predicate
developed in 9.

[trace]  ?- is_member(4, [2,3,4]).
Call: (10) is_member(4, [2, 3, 4]) ? creep
Call: (11) append(_11696, [4|_11640], [2, 3, 4]) ? creep
Call: (12) append(_11690, [4|_11640], [3, 4]) ? creep
Call: (13) append(_11740, [4|_11640], [4]) ? creep
Exit: (13) append([], [4], [4]) ? creep
Exit: (12) append([3], [4], [3, 4]) ? creep
Exit: (11) append([2, 3], [4], [2, 3, 4]) ? creep
Exit: (10) is_member(4, [2, 3, 4]) ? creep
true
*/

% defining the append predicate.
append([ ], L, L).
append([X | L1], L2, [X | L3]) :-
    append(L1, L2, L3).

% use the append predicate to check if X is in L.
is_member(X, L) :-
    append( _ , [X | _ ], L).

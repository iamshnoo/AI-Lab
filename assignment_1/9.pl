/*
To append two lists in a third list.

[trace]  ?- append([2,3], [4], L).
Call: (10)  append([2, 3], [4], _16580) ? creep
Call: (11)  append([3], [4], _16990) ? creep
Call: (12)  append([], [4], _17040) ? creep
Exit: (12)  append([], [4], [4]) ? creep
Exit: (11)  append([3], [4], [3, 4]) ? creep
Exit: (10)  append([2, 3], [4], [2, 3, 4]) ? creep
L = [2, 3, 4].
*/

% base case - appending empty list and a list L, gives the list L.
append([ ], L, L).

% inductive case - if X is present at start of one of the lists,
% it will be present at the start of the combined list.
append([X | L1], L2, [X | L3]) :-
    append(L1, L2, L3).

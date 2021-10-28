/*
To find the last element of a list using append predicate developed in 9.

[trace]  ?- last(4, [2,3,4]).
Call: (10)  last(4, [2, 3, 4]) ? creep
Call: (11)  append(_4892, [4], [2, 3, 4]) ? creep
Call: (12)  append(_4886, [4], [3, 4]) ? creep
Call: (13)  append(_4936, [4], [4]) ? creep
Exit: (13)  append([], [4], [4]) ? creep
Exit: (12)  append([3], [4], [3, 4]) ? creep
Exit: (11)  append([2, 3], [4], [2, 3, 4]) ? creep
Exit: (10)  last(4, [2, 3, 4]) ? creep
true .

[trace]  ?- last(4, [2,3,5]).
Call: (10)  last(4, [2, 3, 5]) ? creep
Call: (11)  append(_8368, [4], [2, 3, 5]) ? creep
Call: (12)  append(_8362, [4], [3, 5]) ? creep
Call: (13)  append(_8412, [4], [5]) ? creep
Call: (14)  append(_8462, [4], []) ? creep
Fail: (14)  append(_8462, [4], []) ? creep
Fail: (13)  append(_8412, [4], [5]) ? creep
Fail: (12)  append(_8362, [4], [3, 5]) ? creep
Fail: (11)  append(_8694, [4], [2, 3, 5]) ? creep
Fail: (10)  last(4, [2, 3, 5]) ? creep
false.


*/

% define the append predicate
append([ ], L, L).
append([X | L1], L2, [X | L3]) :-
    append(L1, L2, L3).

% use the append predicate for finding last element
last(X, L) :-
    append( _ , [X], L).

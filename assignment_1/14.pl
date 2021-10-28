/*
To determine whether a list is a palindrome.
[the structure of predicate: palindrome(L)].

[trace]  ?- palindrome([1,2,2,1]).
Call: (10) palindrome([1, 2, 2, 1]) ? creep
Call: (11) append([_10554|_10556], [_10554], [1, 2, 2, 1]) ? creep
Call: (12) append(_10556, [1], [2, 2, 1]) ? creep
Call: (13) append(_10656, [1], [2, 1]) ? creep
Call: (14) append(_10706, [1], [1]) ? creep
Exit: (14) append([], [1], [1]) ? creep
Exit: (13) append([2], [1], [2, 1]) ? creep
Exit: (12) append([2, 2], [1], [2, 2, 1]) ? creep
Exit: (11) append([1, 2, 2], [1], [1, 2, 2, 1]) ? creep
Call: (11) palindrome([2, 2]) ? creep
Call: (12) append([_10974|_10976], [_10974], [2, 2]) ? creep
Call: (13) append(_10976, [2], [2]) ? creep
Exit: (13) append([], [2], [2]) ? creep
Exit: (12) append([2], [2], [2, 2]) ? creep
Call: (12) palindrome([]) ? creep
Exit: (12) palindrome([]) ? creep
Exit: (11) palindrome([2, 2]) ? creep
Exit: (10) palindrome([1, 2, 2, 1]) ? creep
true
*/

% defining the append() predicate.
append([ ], L, L).
append([X | L1], L2, [X | L3]) :-
    append(L1, L2, L3).

% empty list base case
palindrome([ ]).

% single element base case
palindrome([ _ ]).

% inductive case
palindrome(L) :-
    append([X | Rest], [X], L),
    palindrome(Rest).

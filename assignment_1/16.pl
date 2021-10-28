/*
To find the K'th element of a list.
The first element in the list is number 1. Example:
?- element_at(X,[a,b,c,d,e],3).
{X = c}

[trace]  ?- element_at(X,[1,2,3,4,5],4).
Call: (10) element_at(_10476, [1, 2, 3, 4, 5], 4) ? creep
Call: (11) 4>1 ? creep
Exit: (11) 4>1 ? creep
Call: (11) _11044 is 4+ -1 ? creep
Exit: (11) 3 is 4+ -1 ? creep
Call: (11) element_at(_10476, [2, 3, 4, 5], 3) ? creep
Call: (12) 3>1 ? creep
Exit: (12) 3>1 ? creep
Call: (12) _11270 is 3+ -1 ? creep
Exit: (12) 2 is 3+ -1 ? creep
Call: (12) element_at(_10476, [3, 4, 5], 2) ? creep
Call: (13) 2>1 ? creep
Exit: (13) 2>1 ? creep
Call: (13) _11496 is 2+ -1 ? creep
Exit: (13) 1 is 2+ -1 ? creep
Call: (13) element_at(_10476, [4, 5], 1) ? creep
Exit: (13) element_at(4, [4, 5], 1) ? creep
Exit: (12) element_at(4, [3, 4, 5], 2) ? creep
Exit: (11) element_at(4, [2, 3, 4, 5], 3) ? creep
Exit: (10) element_at(4, [1, 2, 3, 4, 5], 4) ? creep
X = 4 .
*/

% base case - element at K=1 is first element.
element_at(X, [X | _ ] , 1).

% inductive case
element_at(X, [ _ | L] , K) :-
    K > 1,
    K1 is K - 1,
    element_at(X, L, K1).

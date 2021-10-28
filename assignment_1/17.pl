/*
To find the sum of all elements of a list.

[trace]  ?- list_sum([1,2,3],X).
Call: (10) list_sum([1, 2, 3], _9792) ? creep
Call: (11) list_sum([2, 3], _10248) ? creep
Call: (12) list_sum([3], _10292) ? creep
Call: (13) list_sum([], _10336) ? creep
Exit: (13) list_sum([], 0) ? creep
Call: (13) _10428 is 3+0 ? creep
Exit: (13) 3 is 3+0 ? creep
Exit: (12) list_sum([3], 3) ? creep
Call: (12) _10566 is 2+3 ? creep
Exit: (12) 5 is 2+3 ? creep
Exit: (11) list_sum([2, 3], 5) ? creep
Call: (11) _9792 is 1+5 ? creep
Exit: (11) 6 is 1+5 ? creep
Exit: (10) list_sum([1, 2, 3], 6) ? creep
X = 6.

*/

% base case - sum of empty list is 0
list_sum([ ], 0).

% inductive case
list_sum([Head | Tail], TotalSum):-
    list_sum(Tail, Sum1),
    TotalSum is Head + Sum1.

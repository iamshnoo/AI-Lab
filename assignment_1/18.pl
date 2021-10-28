/*
To find the length of a list.

[trace]  ?- list_length([1,2,3], X).
Call: (10) list_length([1, 2, 3], _8836) ? creep
Call: (11) list_length([2, 3], _9294) ? creep
Call: (12) list_length([3], _9338) ? creep
Call: (13) list_length([], _9382) ? creep
Exit: (13) list_length([], 0) ? creep
Call: (13) _9474 is 0+1 ? creep
Exit: (13) 1 is 0+1 ? creep
Exit: (12) list_length([3], 1) ? creep
Call: (12) _9612 is 1+1 ? creep
Exit: (12) 2 is 1+1 ? creep
Exit: (11) list_length([2, 3], 2) ? creep
Call: (11) _8836 is 2+1 ? creep
Exit: (11) 3 is 2+1 ? creep
Exit: (10) list_length([1, 2, 3], 3) ? creep
X = 3.
*/

% base case - empty list has length 0
list_length([ ], 0).

% inductive case
list_length([ _ | Rest], Length):-
    list_length(Rest, Length1),
    Length is Length1 + 1.

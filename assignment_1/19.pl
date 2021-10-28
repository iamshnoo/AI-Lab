/*
To find the average of all elements of a list using sum and length
defined in  Problem 17 and 18.

[trace]  ?- average([1,2,3], X).
Call: (10) average([1, 2, 3], _8804) ? creep
Call: (11) list_sum([1, 2, 3], _9260) ? creep
Call: (12) list_sum([2, 3], _9304) ? creep
Call: (13) list_sum([3], _9348) ? creep
Call: (14) list_sum([], _9392) ? creep
Exit: (14) list_sum([], 0) ? creep
Call: (14) _9484 is 3+0 ? creep
Exit: (14) 3 is 3+0 ? creep
Exit: (13) list_sum([3], 3) ? creep
Call: (13) _9622 is 2+3 ? creep
Exit: (13) 5 is 2+3 ? creep
Exit: (12) list_sum([2, 3], 5) ? creep
Call: (12) _9760 is 1+5 ? creep
Exit: (12) 6 is 1+5 ? creep
Exit: (11) list_sum([1, 2, 3], 6) ? creep
Call: (11) list_length([1, 2, 3], _9894) ? creep
Call: (12) list_length([2, 3], _9938) ? creep
Call: (13) list_length([3], _9982) ? creep
Call: (14) list_length([], _10026) ? creep
Exit: (14) list_length([], 0) ? creep
Call: (14) _10118 is 0+1 ? creep
Exit: (14) 1 is 0+1 ? creep
Exit: (13) list_length([3], 1) ? creep
Call: (13) _10256 is 1+1 ? creep
Exit: (13) 2 is 1+1 ? creep
Exit: (12) list_length([2, 3], 2) ? creep
Call: (12) _10394 is 2+1 ? creep
Exit: (12) 3 is 2+1 ? creep
Exit: (11) list_length([1, 2, 3], 3) ? creep
Call: (11) 3>0 ? creep
Exit: (11) 3>0 ? creep
Call: (11) _8804 is 6/3 ? creep
Exit: (11) 2 is 6/3 ? creep
Exit: (10) average([1, 2, 3], 2) ? creep
X = 2.
*/

% define the predicate for sum of elements in a list
list_sum([ ], 0).
list_sum([Head | Tail], TotalSum):-
    list_sum(Tail, Sum1),
    TotalSum is Head + Sum1.

% define the predicate for number of elements in list
list_length([ ], 0).
list_length([ _ | Rest], Length):-
    list_length(Rest, Length1),
    Length is Length1 + 1.

% calculate average using the two predicates above
average(List, Average):-
    list_sum(List, Sum),
    list_length(List, Length),
    Length > 0,
    Average is Sum / Length.

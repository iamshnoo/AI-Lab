/*
To reverse a list in another list.

[trace]  ?- reverse([2,3,4],Z, []).
Call: (10) reverse([2, 3, 4], _8626, []) ? creep
Call: (11) reverse([3, 4], _8626, [2]) ? creep
Call: (12) reverse([4], _8626, [3, 2]) ? creep
Call: (13) reverse([], _8626, [4, 3, 2]) ? creep
Exit: (13) reverse([], [4, 3, 2], [4, 3, 2]) ? creep
Exit: (12) reverse([4], [4, 3, 2], [3, 2]) ? creep
Exit: (11) reverse([3, 4], [4, 3, 2], [2]) ? creep
Exit: (10) reverse([2, 3, 4], [4, 3, 2], []) ? creep
Z = [4, 3, 2].
*/

% define the user predicate.
reverse_list(L, Reverse):-
    reverse(L, Reverse, []).

% define the worker predicate.
% base case.
reverse([ ], L, L).

% L is an accumulator.
% the reversed list is stored in Z.
% inductive case.
reverse([X | Rest], Z, L) :-
    reverse(Rest, Z, [X | L]).

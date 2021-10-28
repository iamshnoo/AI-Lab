/*
To remove duplicate elements from a list without using accumulator.

?- remove_duplicates([1, 2, 2, 3, 2, 4], X).
X = [1, 3, 2, 4].
*/

% -----------------------------------------------------------------
% base case - X is the first element of the list.
check_member(X, [X | _ ]).

% inductive case - Check if X is present in the tail of the list.
check_member(X, [ _ | Rest]) :-
    check_member(X, Rest).
% -----------------------------------------------------------------

% stores the last occurence of the duplicate in the result.
remove_duplicates([ ], [ ]).

remove_duplicates([H | T], Res):-
    check_member(H, T),
    remove_duplicates(T, Res),
    !.

remove_duplicates([H | T], [H | Rest]):-
    \+(check_member(H, T)),
    remove_duplicates(T, Rest).

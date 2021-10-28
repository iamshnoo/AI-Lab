/*
To find whether an element is a member of a list.
*/

% base case - X is the first element of the list.
check_member(X, [X | _ ]).

% inductive case - Check if X is present in the tail of the list.
check_member(X, [ _ | Rest]) :-
    check_member(X, Rest).

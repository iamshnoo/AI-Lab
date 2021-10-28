/*
To remove duplicate elements from a list using accumulator.

?- remove_duplicates_using_acc([1, 2, 2, 3, 2, 4], X).
X = [1, 2, 3, 4].
*/

% -----------------------------------------------------------------
% base case - appending empty list and a list L, gives the list L.
my_append([ ], L, L).

% inductive case - if X is present at start of one of the lists,
% it will be present at the start of the combined list.
my_append([X | L1], L2, [X | L3]) :-
    my_append(L1, L2, L3).

% base case - X is the first element of the list.
check_member(X, [X | _ ]) :-
    !.

% inductive case - Check if X is present in the tail of the list.
check_member(X, [ _ | Rest]) :-
    check_member(X, Rest).

% -----------------------------------------------------------------

% let L = [1, 2, 2, 3, 2, 4], then
% Acc = [] -> Acc = [1] -> Acc = [1, 2] -> Acc = [1, 2] ->
% Acc = [1, 2, 3] -> Acc = [1, 2, 3] -> Acc = [1, 2, 3, 4]

% stores the first occurence of the duplicate in the result.
remove_duplicates_using_acc(L, Result) :-
    remove_duplicates_acc(L, [], Result).

remove_duplicates_acc([], Res, Res).

remove_duplicates_acc([X | Rest], Acc, Res) :-
    \+(check_member(X, Acc)),
    my_append(Acc, [X], Acc1),
    remove_duplicates_acc(Rest, Acc1, Res),
    !.

remove_duplicates_acc([ X | Rest], Acc, Res) :-
    check_member(X, Acc),
    remove_duplicates_acc(Rest, Acc, Res).

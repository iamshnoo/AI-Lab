/*

Implement Permutation Sort.
-> O(n!)
-> generates all permutations one by one till sorted.

Example:

?- permutation_sort([A,B,1,2],[1,2,3,4]).
A = 3,
B = 4.

?- permutation_sort([1,2,3,4], L).
L = [1, 2, 3, 4].

?- permutation_sort([4,3,2,1], L).
L = [1, 2, 3, 4].

?- permutation_sort([2,3,1,4], L).
L = [1, 2, 3, 4].

?- permutation_sort([1,1,1,1], L).
L = [1, 1, 1, 1].

?- permutation_sort([1,2,2,1], L).
L = [1, 1, 2, 2].
*/

% -----------------------------------------------------------------
% permutation_sort(input_list, result)
% -----------------------------------------------------------------
permutation_sort([ ], [ ]):-
    !.

permutation_sort(L, Res):-
    % generates permutation of L and stores it in Res.
    permutation(L, Res),
    % determines whether Res is ordered.
    ordered(Res),
    % If ordered permutation obtained, stop.
    !.
% -----------------------------------------------------------------
% ordered(list_to_be_checked)
% -----------------------------------------------------------------
ordered([ ]).

ordered([ _ ]).

ordered([X | [Y | Rest]]):-
    X =< Y,
    ordered([Y | Rest]).
% -----------------------------------------------------------------

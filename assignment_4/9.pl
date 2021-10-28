/*

Implement Insertion Sort.

Example:

?- insertion_sort([1,2,3,4], L).
L = [1, 2, 3, 4].

?- insertion_sort([4,3,2,1], L).
L = [1, 2, 3, 4].

?- insertion_sort([2,3,1,4], L).
L = [1, 2, 3, 4].

?- insertion_sort([1,1,1,1], L).
L = [1, 1, 1, 1].

?- insertion_sort([1,2,2,1], L).
L = [1, 1, 2, 2].
*/

% take first element, insert in answer at the correct place
% -----------------------------------------------------------------
% insertion_sort(input_list, result)
% -----------------------------------------------------------------
insertion_sort([ ], [ ]):-
    !.

insertion_sort([H | T], Res):-
    insertion_sort(T, Res1),
    insert(H, Res1, Res).
% -----------------------------------------------------------------
% insert(X, L, L1)
%
% inserts X to head of L, if X <= head of L. returns the result as L1.
% -----------------------------------------------------------------
insert(X, [ ], [X]):-
    !.

insert(X, [H | T], [X | [H | T]]):-
    X =< H,
    !.

insert(X, [H | T], [H | T1]):-
    insert(X, T, T1).
% -----------------------------------------------------------------

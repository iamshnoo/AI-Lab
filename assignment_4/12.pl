/*

Implement Quick Sort without Accumulator.

Example:

?- quick_sort([1,2,3,4], L).
L = [1, 2, 3, 4].

?- quick_sort([4,3,2,1], L).
L = [1, 2, 3, 4].

?- quick_sort([2,3,1,4], L).
L = [1, 2, 3, 4].

?- quick_sort([1,1,1,1], L).
L = [1, 1, 1, 1].

?- quick_sort([1,2,2,1], L).
L = [1, 1, 2, 2].
*/

% -----------------------------------------------------------------
% quick_sort(input_list, result)
% -----------------------------------------------------------------
quick_sort([ ], [ ]).

quick_sort([H | T], Res):-
    partition(T, Lt, H, Gt),
    quick_sort(Gt, GtSorted),
    quick_sort(Lt, LtSorted),
    append(LtSorted, [H | GtSorted], Res).
% -----------------------------------------------------------------
% partition(L1, L2, X, L3)
%
% partitions L1 into L2 and L3 based on all L2 <= X and all L3 > X
% -----------------------------------------------------------------
partition([ ], [ ], _, [ ]).

partition([H | T], [H | TLt], X, Gt):-
    H =< X,
    !,
    partition(T, TLt, X, Gt).

partition([H | T], Lt, X, [H | TGt]):-
    partition(T, Lt, X, TGt).
% -----------------------------------------------------------------

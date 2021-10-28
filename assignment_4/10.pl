/*

Implement Merge Sort.

Example:

?- merge_sort([1,2,3,4], L).
L = [1, 2, 3, 4].

?- merge_sort([4,3,2,1], L).
L = [1, 2, 3, 4].

?- merge_sort([2,3,1,4], L).
L = [1, 2, 3, 4].

?- merge_sort([1,1,1,1], L).
L = [1, 1, 1, 1].

?- merge_sort([1,2,2,1], L).
L = [1, 1, 2, 2].
*/

% -----------------------------------------------------------------
% merge_sort(input_list, result)
% -----------------------------------------------------------------
merge_sort([ ], [ ]):-
    !.

merge_sort([X], [X]):-
    !.

merge_sort(List, SortedList):-
    % divide list into two halves
    divide(List, List1, List2),
    % recursively call for each each half
    merge_sort(List1, SortedList1),
    merge_sort(List2, SortedList2),
    % O(n) - merging sorted arrays
    merge(SortedList1, SortedList2, SortedList).
% -----------------------------------------------------------------
% divide([X | [Y | Rest]], [X | Rest1], [Y | Rest2])
%
% first argument is original list
% second argument is first half.
% second argument is second half.
% -----------------------------------------------------------------
divide(Xs, Ys, Zs) :-
    % find length of original list
    length(Xs, N),
    % H stores half of length of list
    H is N - N // 2,
    % declaritively ensure list1 has length H
    length(Ys, H),
    % declaritively ensure that list1 + list2 gives list
    append(Ys, Zs, Xs).
% -----------------------------------------------------------------
% merge(L1, L2, L3)
%
% merges L1 and L2 into L3
% -----------------------------------------------------------------
merge(List, [ ], List):-
    !.

merge([ ], List, List):-
    !.

merge([X | Rest1], [Y | Rest2], [X | Rest]):-
    X =< Y,
    !,
    merge(Rest1, [Y | Rest2], Rest).

merge([X | Rest1], [Y | Rest2], [Y | Rest]):-
    merge([X | Rest1], Rest2, Rest).
% -----------------------------------------------------------------

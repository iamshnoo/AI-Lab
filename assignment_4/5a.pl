/*

Sorting a list of lists according to length of sublists :

a) We suppose that a list (InList) contains elements that are lists themselves.
The objective is to sort the elements of InList according to their length. E.g.
short lists first, longer lists later, or vice versa.

Example:

?- lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L) ; true.
L = [[o], [d, e], [d, e], [m, n], [a, b, c], [f, g, h], [i, j, k, l]].

This merge sort is thus stable.
*/

% -----------------------------------------------------------------
% lsort(input_list, result)
%
% using merge sort for custom sorting
% the only change is during comparison while merging two lists
% -----------------------------------------------------------------
lsort([ ], [ ]):-
    !.

lsort([X], [X]):-
    !.

lsort(List, SortedList):-
    divide(List, List1, List2),
    lsort(List1, SortedList1),
    lsort(List2, SortedList2),
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
% merges L1 and L2 into L3 based on lengths, instead of values
% -----------------------------------------------------------------
merge(List, [ ], List):-
    !.

merge([ ], List, List):-
    !.

merge([X | Rest1], [Y | Rest2], [X | Rest]):-
    % compare lengths instead of values
    length(X, Len1),
    length(Y, Len2),
    Len1 =< Len2,
    !,
    merge(Rest1, [Y | Rest2], Rest).

merge([X | Rest1], [Y | Rest2], [Y | Rest]):-
    merge([X | Rest1], Rest2, Rest).
% -----------------------------------------------------------------

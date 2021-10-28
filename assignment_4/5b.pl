/*

Sorting a list of lists according to length of sublists :

b) Again, we suppose that a list (InList) contains elements that are lists
themselves. But this time the objective is to sort the elements of InList
according to their length frequency; i.e. in the default, where sorting is
done ascendingly, lists with rare lengths are placed first, others with a more
frequent length come later.

Example:

?- lfsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
L = [[i, j, k, l], [o], [a, b, c], [f, g, h], [d, e], [d, e], [m, n]].

This merge sort is thus stable.

Note that in the above example, the first two lists in the result L have length
4 and 1, both lengths appear just once. The third and forth list have length 3
which appears, there are two list of this length. And finally, the last three
lists have length 2. This is the most frequent length.
*/

% -----------------------------------------------------------------
% lfsort(input_list, result)
% -----------------------------------------------------------------
lfsort(List, SortedList):-
    lfsort_util(List, SortedList, List).

% -----------------------------------------------------------------
% lfsort_util(input_list, result, L)
%
% Last argument L stores an immutable copy of the original input list.
% -----------------------------------------------------------------
lfsort_util([ ], [ ], _ ):-
    !.

lfsort_util([X], [X], _ ):-
    !.

lfsort_util(List, SortedList, L):-
    divide(List, List1, List2),
    lfsort_util(List1, SortedList1, L),
    lfsort_util(List2, SortedList2, L),
    merge(SortedList1, SortedList2, SortedList, L).
% -----------------------------------------------------------------
% length_freq(Len, [H|T], Freq)
%
% Len is the length whose Freq we want. Second argument is the list.
% finds the frequency of length Len in the list (second argument)
% -----------------------------------------------------------------
length_freq( _ , [ ], 0).

length_freq(Len, [H | T], Freq):-
    length(H, Len1),
    % check if Len1 is equal to Len
    Len1 = Len,
    !,
    length_freq(Len, T, Freq1),
    Freq is Freq1 + 1.

length_freq(Len, [ _ | T], Freq):-
    length_freq(Len, T, Freq).
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
% merge(L1, L2, L3, L)
%
% merges L1 and L2 into L3 based on frequencey of lengths, instead of values
% L is the original input list(immutable) passed as last argument.
% -----------------------------------------------------------------
merge(List, [ ], List, _ ):-
    !.

merge([ ], List, List, _ ):-
    !.

merge([X | Rest1], [Y | Rest2], [X | Rest], L):-
    % compare frequency of lengths instead of values
    length(X, Len1),
    length(Y, Len2),
    length_freq(Len1, L, Freq1),
    length_freq(Len2, L, Freq2),
    Freq1 =< Freq2,
    !,
    merge(Rest1, [Y | Rest2], Rest, L).

merge([X | Rest1], [Y | Rest2], [Y | Rest], L):-
    merge([X | Rest1], Rest2, Rest, L).
% -----------------------------------------------------------------

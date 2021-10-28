/*

Implement Bubble Sort.

Example:

?- bubble_sort([1,2,3,4], L).
L = [1, 2, 3, 4].

?- bubble_sort([4,3,2,1], L).
L = [1, 2, 3, 4].

?- bubble_sort([2,3,1,4], L).
L = [1, 2, 3, 4].

?- bubble_sort([1,1,1,1], L).
L = [1, 1, 1, 1].

?- bubble_sort([1,2,2,1], L).
L = [1, 1, 2, 2].
*/

% -----------------------------------------------------------------
% bubble_sort(input_list, result)
% -----------------------------------------------------------------
% if the list is ordered, no more passes required
bubble_sort(List, List):-
    ordered(List),
    !.

% otherwise pass the whole list once (swapping adjacent values if needed),
% and recursively call bubble_sort again for further passes if needed.
bubble_sort(List, Res):-
    bubble_sort_util(List, ResTemp),
    bubble_sort(ResTemp, Res).
% -----------------------------------------------------------------
% bubble_sort_util(input_list, result)
%
% utility for a single pass of bubble sort
% which considers adjacent values and swaps them if needed
% -----------------------------------------------------------------
bubble_sort_util([X], [X]):-
    !.

bubble_sort_util([X | [Y | Rest]], [X | RestNew]):-
    X =< Y,
    !,
    bubble_sort_util([Y | Rest], RestNew).

bubble_sort_util([X | [Y | Rest]], [Y | RestNew]):-
    bubble_sort_util([X | Rest], RestNew).
% -----------------------------------------------------------------
% ordered(list_to_be_checked)
% -----------------------------------------------------------------
ordered([ ]).

ordered([ _ ]).

ordered([X | [Y | Rest]]):-
    X =< Y,
    ordered([Y | Rest]).
% -----------------------------------------------------------------

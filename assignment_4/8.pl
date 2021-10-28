/*

Implement Selection Sort.

Example:

?- selection_sort([1,2,3,4], L).
L = [1, 2, 3, 4].

?- selection_sort([4,3,2,1], L).
L = [1, 2, 3, 4].

?- selection_sort([2,3,1,4], L).
L = [1, 2, 3, 4].

?- selection_sort([1,1,1,1], L).
L = [1, 1, 1, 1].

?- selection_sort([1,2,2,1], L).
L = [1, 1, 2, 2].

*/

% select the smallest and put it at the beginning
% -----------------------------------------------------------------
% selection_sort(input_list, result)
% -----------------------------------------------------------------
selection_sort([ ], [ ]):-
    !.

selection_sort(L, [Min | SortedRest]):-
    least(Min, L, Rest),
    selection_sort(Rest, SortedRest),
    !.
% -----------------------------------------------------------------
% least(X, input_list(L), rest_of_the_list(L1))
%
% selects the least element X from a list L with the remaining values in L1
% -----------------------------------------------------------------
least( _ ,[ ], [ ]).

least(X, L, L1):-
    select(X, L, L1),
    smaller(X, L1).
% -----------------------------------------------------------------
% smaller(X, list)
%
% checks if X is less than all the elements of the list (second argument)
% -----------------------------------------------------------------
smaller( _ , [ ]).

smaller(X, [H | T]):-
    X =< H,
    smaller(X, T).
% -----------------------------------------------------------------
% select(X, input_list(L), rest_of_the_list(L1))
%
% selects an element X from a list L with the remaining values in L1
% -----------------------------------------------------------------
select(X, [X | Rest], Rest).

select(X, [H | Rest], [H | Rest1]):-
    select(X, Rest, Rest1).
% -----------------------------------------------------------------

/*
To determine whether a set is a subset of another set.
(Order doesn't matter)

?- is_subset([2,3],[2,3,4]).
true.

?- is_subset([3,2],[2,3,4]).
true.

?- is_subset([5,2],[2,3,4]).
false.
*/

is_subset([ ], _ ).

is_subset([X | Rest], List) :-
    member(X, List),
    is_subset(Rest, List),
    !.

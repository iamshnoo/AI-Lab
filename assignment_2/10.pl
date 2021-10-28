/*
To determine intersection of two sets.

?- set_intersection([1,2,3],[2,3,4],X).
X = [2, 3].

?- set_intersection([1,2,3],[4],X).
X = [].
*/

set_intersection([ ], _ , [ ]) :-
    !.

set_intersection([X | Rest], L, [X | Result]) :-
    memberchk(X, L),
    set_intersection(Rest, L, Result),
    !.

set_intersection([ _ | Rest], L, Result) :-
    set_intersection(Rest, L, Result).

/*
To determine set_union of two sets.

?- set_union([1,2,3],[2,3,4],X).
X = [4, 1, 2, 3].

?- set_union([1,2,3],[2,3],X).
X = [1, 2, 3].

*/

set_union([ ], [ ], [ ]) :-
    !.

set_union(L, [ ], L) :-
    !.

set_union(L, [X | Rest], [X | Result]) :-
    not(member(X, L)),
    set_union(L, Rest, Result),
    !.

set_union(L, [ _ | Rest], Result) :-
    set_union(L, Rest, Result).

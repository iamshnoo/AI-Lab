/*
To determine difference of two sets.

a - b is everything in a that is not in b.

?- set_diff([1,2,3],[2,3,4],X).
X = [1].

?- set_diff([1,2,3],[2,3],X).
X = [1].

?- set_diff([2,3],[2,3,4],X).
X = [].

?- set_diff([2,3],[2,3],X).
X = [].

*/

set_diff([ ], _, [ ]).

set_diff([X | Rest], L, Result) :-
  memberchk(X, L),
  set_diff(Rest, L, Result),
  !.

set_diff([X | Rest], L, [X | Result]) :-
  set_diff(Rest, L, Result).

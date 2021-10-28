/*
has_duplicate(L), that determines whether list L has duplicate elements.

?- has_duplicate([2,3,2,4,2]).
true.

?- has_duplicate([1,2,3,4,5]).
false.
*/

% method 1
has_duplicate([X | Rest]) :-
  memberchk(X, Rest),
  !.

has_duplicate([ _ | Rest]) :-
  has_duplicate(Rest).

% method 2
has_duplicate_v2(L) :-
  not(is_set(L)).

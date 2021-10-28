/*
To delete first occurrence of an element from a list.

?- delete_first(2, [2,3,2,4,2], X).
X = [3, 2, 4, 2].

?- delete_first(1, [2,3,2,4,2], X).
X = [2, 3, 2, 4, 2].
*/

delete_first( _ , [ ], [ ]) :-
  !.

delete_first(X, [X | Rest], Rest) :-
  !.

delete_first(X, [Y | Rest], [Y | Result]) :-
  delete_first(X, Rest, Result).

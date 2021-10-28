/*
To delete all occurrences of an element from a list.

?- delete_all(2, [2,3,2,4,2], X).
X = [3, 4].

?- delete_all(1, [2,3,2,4,2], X).
X = [2, 3, 2, 4, 2].
*/

delete_all( _ , [ ], [ ]) :-
  !.

delete_all(X, [X | Xs], Y) :-
  delete_all(X, Xs, Y),
  !.

delete_all(X, [T | Xs], Y) :-
  delete_all(X, Xs, Y2),
  append([T], Y2, Y).

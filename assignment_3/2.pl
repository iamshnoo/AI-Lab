/*
To find length of a list using accumulator.

?- length_using_acc([1, 2, 3, 4, 5], X).
X = 5.
*/

length_using_acc(L, N):-
  length_acc(L, 0, N).

length_acc([ ], A, A).

% A = 0 -> A = 0 + 1 -> A = 1 + 1 -> ... -> A = (N-1) + 1 = N
length_acc([ _ | T], A, N):-
  A1 is A + 1,
  length_acc(T, A1, N).

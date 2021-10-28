/*
assume L and L1 is a list of terms.
trimlast (N, L, L1) that defines L1
to be obtained from L with last N elements removed.

?- trimlast(3, [2,3,4,5,6,7], X).
X = [2, 3, 4].

?- trimlast(3, [2,3,4,5,6], X).
X = [2, 3].

?- trimlast(-1, [2,3,4,5,6], X).
false.
*/

% removing last N elements is same as retaining first (length-N) elements.
trimlast(N, L, L1):-
  length(L, C),
  N1 is C - N,
  store(N1, L, L1).

% store(N, L, L1) stores first N elements of L in L1.
store(0, _ , [ ]):-
  !.

store(N, [H | T],[H | R]):-
  N1 is N - 1,
  store(N1, T, R).

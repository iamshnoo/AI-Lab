/*
assume L and L1 is a list of terms.
trim (N, L, L1) that defines L1 to be
obtained from L with first N elements removed.

?- trim(2, [1,2,3,4,5], X).
X = [3, 4, 5].

?- trim(2, [1,2,3,4], X).
X = [3, 4].

?- trim(-1, [1,2,3,4], X).
false.
*/

trim(0, [ ], [ ]) :-
  !.

trim(0, [H | T], [H | T] ) :-
  !.

trim(N, [ _ | T], L1):-
    N1 is N - 1,
    trim(N1, T, L1).

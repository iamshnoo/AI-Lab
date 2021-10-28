/*
assume L and L1 is a list of terms.
To delete the middle element from an
odd-numbered list L into a list L1.

?- delete_mid_odd([2,3,4,5,6],X).
X = [2, 3, 5, 6].

?- delete_mid_odd([2,3,4,5],X).
false.
*/

delete_at_index([ _ | Rest], 1, Rest) :-
  !.

delete_at_index([H | Rest], N, [H | R]) :-
    N1 is N - 1,
    delete_at_index(Rest, N1, R).

delete_mid_odd(L, L1):-
  length(L, K),
  K mod 2 =\= 0,
  K1 is K // 2 + 1,
  delete_at_index(L, K1, L1).

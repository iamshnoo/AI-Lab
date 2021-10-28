/*
assume L and L1 is a list of terms.
To delete two middle elements from an
even-numbered list L into a list L1.

?- delete_mid_even([2,3,4,5],X).
X = [2, 5].

?- delete_mid_even([2,3,4,5,6],X).
false.
*/

delete_at_index([ _ | Rest], 1, Rest) :-
  !.

delete_at_index([H | Rest], N, [H | R]) :-
    N1 is N - 1,
    delete_at_index(Rest, N1, R).

delete_mid_even(L, L1):-
  length(L, K),
  K mod 2 =:= 0,
  K1 is K / 2,
  delete_at_index(L, K1, L2),
  delete_at_index(L2, K1, L1).

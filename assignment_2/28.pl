
/*
assume L and L1 is a list of terms.
circular_right_shift(L, L1).
That is,
if L= [a, b, c, d, e, f]
then L1= [f, a, b, c, d, e]
[Try using circular_left_shift in 27 to implement circular_right_shift.]

?- circular_right_shift([a, b, c, d, e, f], X).
X = [f, a, b, c, d, e].
*/

circular_left_shift([H | T], Y) :-
  append(T, [H], Y).

circular_right_shift(X, L):-
  circular_left_shift(L, X),
  !.

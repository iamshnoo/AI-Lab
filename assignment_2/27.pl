/*
assume L and L1 is a list of terms.
circular_left_shift(L, L1).
That is,
if L= [a, b, c, d, e, f]
then L1= [b, c, d, e, f, a].

?- circular_left_shift([a, b, c, d, e, f], X).
X = [b, c, d, e, f, a].
*/

circular_left_shift([H | T], Y) :-
  append(T, [H], Y).

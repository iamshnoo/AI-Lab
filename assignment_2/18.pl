/*
assume L1, L2 and L denote lists of terms.
Transpose L1, L2 into L.
That is,
if L1= [a, b, c] and L2= [1, 2, 3],
then L= [(a, 1), (b, 2), (c,3)].

?- transpose([a, b, c], [1, 2, 3], X).
X = [(a, 1),  (b, 2),  (c, 3)].

?- transpose([a, b, c], [1, 2], X).
X = [(a, 1),  (b, 2), c].

?- transpose([a, b], [1, 2, 3], X).
X = [(a, 1),  (b, 2), 3].
*/

transpose([ ], [ ], [ ]) :-
    !.

transpose([X], [ ], [X]) :-
    !.

transpose([ ], [Y], [Y]) :-
    !.

transpose([X | List1], [Y | List2], [(X, Y) | List]):-
    transpose(List1, List2, List).

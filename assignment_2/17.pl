/*
assume L1, L2 and L denote lists of terms.
Interleave alternate elements of L1 and L2 into L.
For example,
if L1= [a, b, c] and L2= [1, 2],
then L= [a, 1, b, 2, c].

?- interleave([a, b, c], [1, 2], X).
X = [a, 1, b, 2, c].
*/

interleave([ ], [ ], [ ]) :-
    !.

interleave([X], [ ], [X]) :-
    !.

interleave([ ], [Y], [Y]) :-
    !.

interleave([X | List1], [Y | List2], [X, Y | List]):-
    interleave(List1, List2, List).

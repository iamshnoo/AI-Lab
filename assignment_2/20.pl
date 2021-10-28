/*
To extract a slice from a list.
Given two indices, I and K, the slice is the list
containing the elements between the
I'th and K'th element of the original list
(both limits included). Start counting the
elements with 1.

Example:
?- slice([a, b, c, d, e, f, g, h, i, k], 3, 7, L).
X = [c, d, e, f, g].

?- slice([a, b, c, d, e, f, g, h, i, k], 0, 7, L).
false.

*/

slice([X | _ ], 1, 1, [X]) :-
    !.

slice([X | Rest], 1, K, [X | Result]):-
    K1 is K - 1,
    slice(Rest, 1, K1, Result),
    !.

slice([ _ | Rest], I, K, Result):-
    I1 is I - 1,
    K1 is K - 1,
    slice(Rest, I1, K1, Result).

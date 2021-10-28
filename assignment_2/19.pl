/*
To split a list into two parts;
the length of the first part is given.
Do not use any predefined predicates.
Example:
?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
{L1 = [a,b,c], L2 = [d,e,f,g,h,i,k]}

?- split([a, b, c, d, e, f, g, h, i, k], 3, L1, L2).
L1 = [a, b, c],
L2 = [d, e, f, g, h, i, k].

?- split([a, b, c, d, e, f, g, h, i, k], -1, L1, L2).
false.
*/

split(L, 0, [ ], L) :-
    !.

split([X | Rest], N, [X | Result1], Result2):-
    N1 is N - 1,
    split(Rest, N1, Result1, Result2).

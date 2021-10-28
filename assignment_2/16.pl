/*
to remove every N'th element from a list.

Example:

?- remove([a,b,c,d,e,f,g,h,i,k], 3, X).
X = [a,b,d,e,g,h,k].

*/

% user predicate
remove(L, N, Result) :-
    remove(L, N, N, Result).

% worker predicate, seond argument is accumulator.
remove([ ], _ , _ , [ ]) :-
    !.

% resets the accumulator which stores the value of N, when one N'th element has
% been removed
remove([ _ | T], 1, N, Result) :-
    remove(T, N, N, Result),
    !.

remove([X | Y], P, N, [X | Rest]) :-
    P1 is P - 1,
    remove(Y, P1, N, Rest).

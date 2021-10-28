/*
To replace n th element by another element X in L,
leaving the resultant list in L1.

?- replace_at_index([2,3,4],2,5,X).
X = [2, 5, 4].

?- replace_at_index([2,3,4],1,5,X).
X = [5, 3, 4].

?- replace_at_index([2,3,4],0,5,X).
false.

*/

replace_at_index([ _ | T], 1, X, [X | T]) :-
    !.

replace_at_index([H | T], N, X, [H | R]):-
    N1 is N - 1,
    replace_at_index(T, N1, X, R).

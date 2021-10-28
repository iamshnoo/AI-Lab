/*
To replace the first occurrence of an element X in L with Y
giving the result in L1.

?- replace_first_occurence(2, 3, [2,3,2,4,2], X).
X = [3, 3, 2, 4, 2].

?- replace_first_occurence(1, 3, [2,3,2,4,2], X).
X = [2, 3, 2, 4, 2].
*/

replace_first_occurence( _ , _ , [ ], [ ]) :-
  !.

replace_first_occurence(X, Y, [X | Rest], [Y | Rest]) :-
  !.

replace_first_occurence(X, Y, [Z | Rest], [Z | Rest2]) :-
  replace_first_occurence(X, Y, Rest, Rest2).

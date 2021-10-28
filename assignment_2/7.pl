/*
To duplicate the elements of a list a given number of times.

Example:
?- duplicate2([a,b,c], 3, X).
X = [a,a,a,b,b,b,c,c,c].

What are the results of the goal:
?- duplicate2(X,3,Y).
X = Y, Y = [] ;
X = [_8446],
Y = [_8446, _8446, _8446];
...
*/

duplicate2([ ], _ , [ ]).

duplicate2([X | Rest], K, Res) :-
    repeat(X, K, List1),
    duplicate2(Rest, K, List2),
    append(List1, List2, Res).

% get a list containing K number of Xs
repeat( _ , 0, [ ]) :-
  !.

repeat(X, K, [X | Rest]) :-
    K1 is K - 1,
    repeat(X, K1, Rest).

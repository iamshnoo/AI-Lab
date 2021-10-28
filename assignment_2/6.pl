/*
To duplicate the elements of a list.

?- duplicate([a,b,c,c,d],X).
X = [a, a, b, b, c, c, c, c, d, d].

?- duplicate([],X).
X = [].

*/

duplicate([ ], [ ]).

duplicate([X | Rest], [X, X | Rest1]) :-
  duplicate(Rest, Rest1).

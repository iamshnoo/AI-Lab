/*
To reverse a list using accumulator.

?- reverse_using_acc([1, 2, 2, 3, 4, 5, 5], X).
X = [5, 5, 4, 3, 2, 2, 1].
*/

% let L = [1, 2, 2, 3, 4, 5, 5], then
% Acc = [] -> Acc = [5] -> Acc = [5, 5] -> Acc = [5, 5, 4] ->
% Acc = [5, 5, 4, 3] ->  Acc = [5, 5, 4, 3, 2] ->
% Acc = [5, 5, 4, 3, 2, 2] -> Acc = [5, 5, 4, 3, 2, 1]
reverse_using_acc(L, Res):-
  reverse_acc(L, [ ], Res).

reverse_acc([ ], Acc, Acc).

reverse_acc([H | T], Acc, Res):-
  reverse_acc(T, [H | Acc], Res).

/*
To determine whether a list is a sub list of another list.
A list is a sub list of another list if
it’s elements are present in another list consecutively
and in the same order.

?- is_sublist([2,3],[2,3,4]).
true.

?- is_sublist([3,2],[2,3,4]).
false.
*/

is_sublist([ ], _ ).

is_sublist([X | Rest1], [X | Rest2]) :-
  starts_with(Rest1, Rest2),
  !.

is_sublist(List1, [ _ | Rest2]) :-
  is_sublist(List1, Rest2).

% check if the list in second argument begins with the list in first argument
starts_with([ ], _ ).

starts_with([X | Rest1], [X | Rest2]):-
  starts_with(Rest1, Rest2).

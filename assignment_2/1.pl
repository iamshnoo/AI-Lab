/*
To add an element to a list provided it is not present in the list.

?- add_element(3, [2,3,4], X).
false.

?- add_element(5, [2,3,4], X).
X = [5, 2, 3, 4].
*/

add_element(X, L, R) :-
  not(member(X, L)),
  append([X], L, R).

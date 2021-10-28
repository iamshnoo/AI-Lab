/*
To insert an element at a given position into a list.

Example:
?- insert_at(alfa, [a, b, c, d], 2, L).
L = [a, alfa, b, c, d].

?- insert_at(alfa, [a, b, c, d], 0, L).
false.

*/

insert_at(Element, L, 1, [Element | L]) :-
    !.

insert_at(Element, [H | L], Pos, [H | Result]):-
    Pos1 is Pos - 1,
    insert_at(Element, L, Pos1, Result).

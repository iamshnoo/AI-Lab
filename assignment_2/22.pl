/*
assume L and L1 is a list of terms.
To remove_every_other (L, L1). List L1 is
just list L with every other element removed
(the two lists should have the same first element).

?- remove_every_other([],X).
X = [].

?- remove_every_other([2,3,4],X).
X = [2, 4].

?- remove_every_other([2,3,4,5],X).
X = [2, 4].

?- remove_every_other([2,3,4,5,6],X).
X = [2, 4, 6].
*/

remove_every_other([ ], [ ]) :-
    !.

remove_every_other([X], [X]) :-
    !.

remove_every_other([H, _ | T], [H | R]) :-
    remove_every_other(T, R).

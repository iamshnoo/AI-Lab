/*
assume L and L1 is a list of terms.
cutlast (L, L1) that defines L1 to be
obtained from L with last element removed.

?- cutlast([2,3,4],L).
L = [2, 3].

?- cutlast([2,3,4,5],L).
L = [2, 3, 4].
*/

cutlast([ _ ], [ ]) :-
  !.

cutlast([X | Rest], [X | Result]) :-
  cutlast(Rest, Result).

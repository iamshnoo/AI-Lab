/*
To determine symmetric difference of two sets.

all the elements that are exactly in 1 set

?- symmetric_difference([1,2,3],[2,3,4],X).
X = [1, 4].

?- symmetric_difference([1,2,3],[2,3],X).
X = [1].

?- symmetric_difference([2,3],[2,3,4],X).
X = [4].

?- symmetric_difference([2,3],[2,3],X).
X = [].

*/

% predicate to find elements in L1 = [H1 | T1] which are not present in L2
not_common([ ], _ , [ ]).

not_common([H1 | T1], L2, [H1 | Diffs]) :-
  not(member(H1, L2)),
  not_common(T1, L2, Diffs),
  !.

not_common([ _ | T1], L2, Diffs) :-
  not_common(T1, L2, Diffs).

symmetric_difference(L1, L2, All_diffs) :-
  not_common(L1, L2, Set_one),      % Set_one is set of all elements in L1, which are not in L2.
  not_common(L2, L1, Set_two),      % Set_two is set of all elements in L2, which are not in L1.
  append(Set_one, Set_two, All_diffs),
  !.

% set difference predicate defined previously
set_diff([], _, []).
set_diff([X | Rest], L, Result) :-
  memberchk(X, L),
  set_diff(Rest, L, Result),
  !.
set_diff([X | Rest], L, [X | Result]) :-
  set_diff(Rest, L, Result).

% set intersection predicate defined previously
intersect([ ], _ , [ ]).
intersect([X | Rest], L, [X | Result]):-
    member(X, L),
    intersect(Rest, L, Result),
    !.
intersect([ _ | Rest], L, Result):-
    intersect(Rest, L, Result).

% symmetric difference using set intersecion , set difference and append
symmetric_difference_v2(L1, L2, Result) :-
  intersect(L1, L2, Intersection),
  append(L1, L2, All_items),
  set_diff(All_items, Intersection, Result).

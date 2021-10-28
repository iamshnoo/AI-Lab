/*
To determine whether two lists are of same length using the length predicate
developed in 4 (previous problem).
*/

% defining the length1() predicate
length1([ ], 0).
length1([ _ | Rest], s(N)) :-
    length1(Rest, N).

% use the length1() predicate
same_length_using_length(List1, List2) :-
    length1(List1, X),
    length1(List2, X).

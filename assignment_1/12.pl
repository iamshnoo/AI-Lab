/*
To find whether two elements are next to each other in a list using
append predicate developed in 9.

[trace]  ?- next_to(2,3,[1,2,3,4]).
Call: (10) next_to(2, 3, [1, 2, 3, 4]) ? creep
Call: (11) append(_4916, [2, 3|_4860], [1, 2, 3, 4]) ? creep
Call: (12) append(_4910, [2, 3|_4860], [2, 3, 4]) ? creep
Exit: (12) append([], [2, 3, 4], [2, 3, 4]) ? creep
Exit: (11) append([1], [2, 3, 4], [1, 2, 3, 4]) ? creep
Exit: (10) next_to(2, 3, [1, 2, 3, 4]) ? creep
true
*/


% defining the append predicate.
append([ ], L, L).
append([X | L1], L2, [X | L3]) :-
    append(L1, L2, L3).

% check if X and Y are present in L in the orientation (X,Y)
next_to(X, Y, L) :-
    append( _ ,[X | [Y | _ ]], L).

% 'OR' case, performed if the above rule fails,
% checks the other possible alignment (Y,X)
next_to(X, Y, L) :-
    append( _ ,[Y | [X | _ ]], L).

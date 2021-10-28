/*
Eight Queens’ Problem.
Eight Queens are to be placed in an 8x8 chess board such that no queen
attack each other.
Write a Prolog program to obtain solution(s) of Eight Queen Problem.

?- equeens([1/Y1, 2/Y2, 3/Y3, 4/Y4, 5/Y5, 6/Y6, 7/Y7, 8/Y8]).
Y1 = 1,
Y2 = 5,
Y3 = 8,
Y4 = 6,
Y5 = 3,
Y6 = 7,
Y7 = 2,
Y8 = 4 ;
...

% total 92 solutions, unique 12 solutions
*/

% -----------------------------------------------------------------
% UTILITY FUNCTIONS
% -----------------------------------------------------------------
% base case - X is the first element of the list.
check_member(X, [X | _ ]).

% inductive case - Check if X is present in the tail of the list.
check_member(X, [ _ | Rest]) :-
    check_member(X, Rest).
% -----------------------------------------------------------------

equeens([ ]).

equeens([X/Y | Others]):-
    check_member(Y, [1, 2, 3, 4, 5, 6, 7, 8]),
    equeens(Others),
    no_attack(X/Y, Others).

no_attack( _ ,[ ]).

no_attack(X/Y, [X1/Y1 | Others]):-
    % same column
    Y =\= Y1,
    % diagonal bottom
    (X - X1) =\= (Y - Y1),
    % diagonal top
    (X - X1) =\= (Y1 - Y),
    no_attack(X/Y, Others).

% -----------------------------------------------------------------

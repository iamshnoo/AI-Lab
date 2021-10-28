/*
To find N!
*/

% user function - stores factorial of N and stores it in R.
factorial(N, R) :-
    factorial(N, 1, R).

% worker predicate.
% base case
factorial(0, R, R) :-
    !.

% inductive case.
factorial(N, Temp, R) :-
    N1 is N - 1,
    Temp1 is Temp * N,
    factorial(N1, Temp1, R).

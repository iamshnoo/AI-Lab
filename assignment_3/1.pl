/*
To find factorial N using accumulator.

?- factorial_using_acc(5, X).
X = 120.
*/

% user function - calculates factorial of N and stores it in R.
factorial_using_acc(N, R) :-
  N >= 0,
  factorial_acc(N, 1, R).

% worker predicate (accumulator)
% base case
factorial_acc(0, R, R) :-
  !.

% inductive case.
% Temp =  1 * N *(N-1) * (N-2) * ... 1
factorial_acc(N, Temp, R) :-
  N > 0,
  N1 is N - 1,
  Temp1 is Temp * N,
  factorial_acc(N1, Temp1, R).

/*
To determine whether a given integer number is prime. [Example:
?- is_prime(7). true]

*/

% helper predicate to find all factors of N from 3 to sqrt(N)
has_factor(N, L) :-
    N mod L =:= 0.

has_factor(N, L) :-
    L * L < N,
    L2 is L + 2,
    has_factor(N, L2).

% base case - 2 is a prime
is_prime(2).

% base case - 3 is a prime
is_prime(3).

% other primes are integers > 3, not divisible by 2,
% and not having any prime factors till sqrt(P)
is_prime(P) :-
    integer(P),
    P > 3,
    P mod 2 =\= 0,
    not(has_factor(P, 3)).

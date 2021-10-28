/*
Goldbach's conjecture.
Goldbach's conjecture says that every positive even number greater than 2
is the sum of two prime numbers. Example: 28 = 5 + 23.
It is one of the most famous facts in number theory that has not been proved
to be correct in the general case. It has been numerically confirmed up to
very large numbers (much larger than we can go with our Prolog system).
Write a predicate to find the two prime numbers that sum up to a given
even integer.

Example:
?- goldbach(28, L).
{L = [5,23]}
*/

% Predicate for primality test
is_prime(2).

is_prime(3).

is_prime(P) :-
    integer(P),
    P > 3,
    P mod 2 =\= 0,
    not(has_factor(P, 3)).

% helper predicate for primality test
has_factor(N, L) :-
    N mod L =:= 0.

has_factor(N, L) :-
    L * L < N,
    L2 is L + 2,
    has_factor(N, L2).

% base case for goldbach
goldbach(4, [2, 2]) :-
    !.

% goldbach user function
goldbach(N, L) :-
    N mod 2 =:= 0,
    N > 4,
    goldbach(N, L, 3).

% goldbach worker function case 1
goldbach(N, [P, Q], P) :-
    Q is N - P,
    is_prime(Q),
    !.

% goldbach worker function case 2
goldbach(N, L, P) :-
    P < N,
    next_prime(P, P1),
    goldbach(N, L, P1).

% helper predicate for finding the next prime number after P
next_prime(P, P1) :-
    P1 is P + 2,
    is_prime(P1),
    !.

next_prime(P, P1) :-
    P2 is P + 2,
    next_prime(P2, P1).

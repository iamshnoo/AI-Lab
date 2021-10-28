/*
To determine the prime factors of a given positive integer.
Construct a flat list containing the prime factors in ascending order.

Example:
?- prime_factors(315, L).
{L = [3,3,5,7]}
*/


prime_factors(N, L) :-
    N > 0,
    prime_factors(N, L, 2).

% prime_factors(N, L, K)
% L is the list of prime factors of N.
% N does not have any prime factors less than K.
prime_factors(1, [], _) :-
    !.

% N is multiple of F
prime_factors(N, [F | L], F) :-
    R is N // F,
    N is R * F,
    prime_factors(R, L, F),
    !.

% N is not multiple of F
prime_factors(N, L, F) :-
    next_factor(N, F, NF),
    prime_factors(N, L, NF).

% when calculating the prime factors of N,
% if F does not divide N,
% then NF is the next larger candidate to be a factor of N.
next_factor( _ , 2, 3) :-
    !.

next_factor(N, F, NF) :-
    F * F < N,
    !,
    NF is F + 2.

% F > sqrt(N)
next_factor(N, _ , N).

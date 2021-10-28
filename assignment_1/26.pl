/*
To generate all integers between two integers N1 and N2,
both N1 and N2 included and N2>N1.

?- range(2,5,X).
X = [2, 3, 4, 5]
*/

% base case - integers between I and I is only I.
range(I, I, [I]).

% inductive case.
range(I, K, [I | L]) :-
    I < K,
    I1 is I + 1,
    range(I1, K, L).

/*
To determine whether two positive integer numbers are coprime.
Two numbers are coprime if their greatest common divisor equals 1.

Example:
?- coprime(35, 64).
true
*/

% defining the gcd predicate
gcd(0, X, X):-
    X > 0,
    !.

gcd(X, Y, Z):-
    X >= Y,
    X1 is X - Y,
    gcd(X1, Y, Z).

gcd(X, Y, Z):-
    X < Y,
    X1 is Y - X,
    gcd(X1, X, Z).

% coprime numbers have a gcd of 1
is_coprime(X, Y):-
    gcd(X, Y, Z),
    Z is 1.

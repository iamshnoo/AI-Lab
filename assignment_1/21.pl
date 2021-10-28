/*
To find gcd of two integers.

[trace]  ?- gcd(2,4,X).
Call: (10) gcd(2, 4, _4444) ? creep
Call: (11) 2>=4 ? creep
Fail: (11) 2>=4 ? creep
Redo: (10) gcd(2, 4, _4444) ? creep
Call: (11) 2<4 ? creep
Exit: (11) 2<4 ? creep
Call: (11) _5106 is 4-2 ? creep
Exit: (11) 2 is 4-2 ? creep
Call: (11) gcd(2, 2, _4444) ? creep
Call: (12) 2>=2 ? creep
Exit: (12) 2>=2 ? creep
Call: (12) _5332 is 2-2 ? creep
Exit: (12) 0 is 2-2 ? creep
Call: (12) gcd(0, 2, _4444) ? creep
Call: (13) 2>0 ? creep
Exit: (13) 2>0 ? creep
Exit: (12) gcd(0, 2, 2) ? creep
Exit: (11) gcd(2, 2, 2) ? creep
Exit: (10) gcd(2, 4, 2) ? creep
X = 2 .
*/

% Euclidean GCD algorithm
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

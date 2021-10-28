/*
One way of representing the positive whole numbers is a Prolog terms
involving the integer 0 and the successor functor s with one argument.
Thus, we represent 0 by itself, 1 by s (0), 2 by s (s (0)) and so on. Write
definitions of standard arithmetic operations addition, multiplication and
diffion, given the above representation of numbers. For example, the
predicate add may be defined to exhibit the following behavior.
? - add (s (s (0)), s (s (s (0))), X).
{X= s (s (s (s (s (0)))))}
that is, 2+3 = 5. Also define the predicate “less than”, “greater than”,
“less than equal to” and “greater than equal to”. Further define arithmetic
operations, like integer division, remainder of integer division, and
square root.

?- add(s(0), s(0), X).
X = s(s(0)).

?- diff(s(s(0)), s(0), X).
X = s(0).

?- multiply(s(s(0)), s(0), X).
X = s(s(0)).

?- is_less_eq(s(s(0)), s(0)).
false.

?- is_greater_eq(s(s(0)), s(0)).
true.

?- is_greater(s(s(0)), s(0)).
true.

?- divide(s(s(0)), s(0), X).
X = s(s(0)).

?- mod(s(s(0)), s(0), X).
X = 0.

?- sqrt(s(s(s(s(0)))), X).
X = s(s(0))
*/

% -----------------------------------------------------------------
% plus operator
% -----------------------------------------------------------------
add(0, X, X).

% (X+1) + Y = (Res+1)
add(s(X), Y, s(Res)):-
    add(X, Y, Res).
% -----------------------------------------------------------------
% minus operator
% -----------------------------------------------------------------
diff(X, 0, X) :-
    !.

% X - (Y+1) = Res
diff(X, s(Y), Res):-
    diff(X, Y, s(Res)).
% -----------------------------------------------------------------
% multiplication
% -----------------------------------------------------------------
multiply(0, _ , 0).

% X*Y = (X-1)*Y + Y
% Decreases X and calls recursively. if X=1, returns Y
multiply(s(X), Y, Res):-
    multiply(X, Y, Temp_Prod),
    add(Temp_Prod, Y, Res).
% -----------------------------------------------------------------
% comparison operators -> ==, =<, <, >=, >
% -----------------------------------------------------------------
equal_to(0, 0).

equal_to(s(X), s(Y)):-
    equal_to(X, Y).

is_less_eq(0, _ ).

is_less_eq(s(X), s(Y)):-
    is_less_eq(X, Y).

is_less(0, s( _ )).

is_less(s(X), s(Y)):-
    is_less(X, Y).

is_greater_eq( _ , 0) :-
    !.

is_greater_eq(s(X), s(Y)):-
    is_greater_eq(X, Y).

is_greater(s( _ ), 0).

is_greater(s(X), s(Y)):-
    is_greater(X, Y).
% -----------------------------------------------------------------
% division
% -----------------------------------------------------------------
divide(0, _ , 0):-
    !.

divide(X, Y, Res):-
    is_greater(Y, 0),
    diff_util(X, Y, Res).

diff_util(X, Y, 0):-
    is_less(X, Y),
    !.

diff_util(X, Y, s(Count)):-
    diff(X, Y, Res_Temp),
    diff_util(Res_Temp, Y, Count).
% -----------------------------------------------------------------
% modulo
% dividend = quotient * divisor + remainder
% res = remainder
% -----------------------------------------------------------------
mod(X, Y, Res):-
    divide(X, Y, Quotient),
    multiply(Y, Quotient, Temp),
    diff(X, Temp, Res).
% -----------------------------------------------------------------
% square_root
% -----------------------------------------------------------------
sqrt(0, 0):-
    !.

sqrt(X, Res):-
    sqrt_acc(X, s(0), Res).

sqrt_acc(X, Y, Res):-
    multiply(Y, Y, Y1),
    is_less(Y1, X),
    add(Y, s(0), Y2),
    sqrt_acc(X, Y2, Res),
    !.

sqrt_acc(X, Y, Res):-
    multiply(Y, Y, Y1),
    equal_to(Y1, X),
    Y is Res.
% -----------------------------------------------------------------

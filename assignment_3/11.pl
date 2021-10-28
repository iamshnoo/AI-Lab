/*
Three musicians of a multinational band take turns playing solo in a piece
of music: each plays only once. The pianist plays first. John plays
saxophone plays before the Australian. Mark comes from the United States
and plays before the violinist. One soloist comes from Japan and one is
Sam.
Write a PROLOG program to find out who comes from which country,
plays what instrument, and in which order

?- musician_solution(L).
L = band(soloist(mark, us, piano), soloist(john, japan, saxophone), soloist(sam, australia, violin)).
*/

% pianist mark us
% saxophone john japan
% violinist sam australian

musician_solution(S):-
    band_soloist(S),
    first(X, S), plays(X, piano),
    ordered_members(Y, Z, S), name(Y, john), plays(Y, saxophone), country(Z, australia),
    ordered_members(Y1, Z1, S), name(Y1, mark), country(Y1, us), plays(Z1, violin),
    member(U, S), name(U, sam),
    member(V, S), country(V, japan),
    !.

band_soloist(band(soloist(N1, C1, I1), soloist(N2, C2, I2), soloist(N3, C3, I3))).

first(X, band(X, _ , _ )).

name(soloist(N, _ , _ ), N).

country(soloist( _ , C, _ ), C).

plays(soloist( _ , _ , I), I).

ordered_members(X, Y, band(X, Y, _ )).
ordered_members(X, Z, band(X, _ , Z)).
ordered_members(Y, Z, band( _ , Y, Z)).

member(X, band(X, _ , _ )).
member(Y, band( _ , Y, _ )).
member(Z, band( _ , _ , Z)).

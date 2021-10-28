/*
In a lost-world language, a poem can have any number of verses, each of
which takes the following form:
A B B C
D E E C
F F G
H I I C
where the same letter represents rhymed words. For example,
anun kura tama su
unuri bimo co kuru
sonen ariten sicom
kana te shime xanadu.
Design a database to store a number of lost-world words and write a Prolog
program to produce a poem for a given number of verses.

?- poem(3).

smun kura tama moju
zemi letro bimo xanadu
heden ariten jhom
grana labe kire kolu

pralun gema kura kolu
ligdi bilo letro su
fen dhen bekom
gana shime kire konu

qibun mira wufra milu
zemi crego debo kuru
fen chinen sicom
duana pize labe miku
true
*/

% -----------------------------------------------------------------

% in the order C B E F I A D G H
rhyme([kolu,hidu,milu,konu,moju]).
rhyme([mia,jura,wufra,gema,bhitma]).
rhyme([vijo,letro,crego,gordo]).
rhyme([fen,ghen,chinen,dhen,wen]).
rhyme([vuge,klade,pize,nebre]).
rhyme([tojun,pazun,hadun,wadun,qibun]).
rhyme([baski,merti,ligdi,zemi,nusli]).
rhyme([dhom,suom,dvom,bekom,zom]).
rhyme([lana,kyana,mana,plana,huana]).

% -----------------------------------------------------------------
% /*
% A B1 B2 C1
% D E1 E2 C2
% F1 F2 G
% H I1 I2 C3
% */

% -----------------------------------------------------------------

poem(0) :-
    !.

% -----------------------------------------------------------------
poem(N) :-
    do_rhyme([C1, C2, C3]), distinct([C1,C2,C3]),

    do_rhyme([B1, B2]), distinct([B1, B2]),
    no_rhyme([B1, C1]),

    do_rhyme([E1, E2]), distinct([E1, E2]),
    no_rhyme([E1, B1, C1]),

    do_rhyme([F1, F2]), distinct([F1, F2]),
    no_rhyme([F1, E1, B1, C1]),

    do_rhyme([I1, I2]), distinct([I1, I2]),
    no_rhyme([I1, F1, E1, B1, C1]),

    belongs(A), no_rhyme([A, I1, F1, E1, B1, C1]),
    belongs(D), no_rhyme([D, A, I1, F1, E1, B1, C1]),
    belongs(G), no_rhyme([G, D, A, I1, F1, E1, B1, C1]),
    belongs(H), no_rhyme([H, G, D, A, I1, F1, E1, B1, C1]),

    nl, write(A), write(" "), write(B1), write(" "), write(B2), write(" "), write(C1),
    nl, write(D), write(" "), write(E1), write(" "), write(E2), write(" "), write(C2),
    nl, write(F1), write(" "), write(F2), write(" "), write(G),
    nl, write(H), write(" "), write(I1), write(" "), write(I2), write(" "), write(C3), nl,

    N > 0,
    N1 is N - 1,
    poem(N1).

% -----------------------------------------------------------------
% ensure that a word actually belongs to the database
% note that we have used random_member instead of member
% for randomness while generating more than 1 stanzas
belongs(X) :-
    rhyme(L),
    random_member(X, L).

% check if all the words of the list passed rhyme
% note that we have used random_member instead of member
% for randomness while generating more than 1 stanzas
do_rhyme(List) :-
    rhyme(L),
    all_members(List, L).

% utility to check if all elements of the first list are members of the second list
all_members([ ], _ ) :-
    !.

all_members([X | Rest], L) :-
    random_member(X, L),
    all_members(Rest, L).

% check if all elements of a list are distinct
distinct([ ]) :-
    !.

distinct([X | Rest]) :-
    \+(member(X, Rest)),
    distinct(Rest).

% check if first element of the list does not rhyme with any other element
no_rhyme([ _ ]) :-
    !.

no_rhyme([X | [Y | Rest]]) :-
    \+(do_rhyme([X, Y])),
    no_rhyme([X | Rest]).

% utility to select a member randomly from a list
random_member(X, L) :-
    random_permutation(L, L1),
    member(X, L1).
% -----------------------------------------------------------------

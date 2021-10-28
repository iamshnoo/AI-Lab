/*
assume L and L1 is a list of terms.
exchange_first_last(L, L1), defines
that L1 to be obtained from L with first and last
elements exchanged.

Example:
?- exchange_first_last([a, b, c, d, e], X).
X= [e, b, c, d, a].

[trace]  ?- exchange_first_last([a, b, c, d, e], X).
Call: (10) exchange_first_last([a, b, c, d, e], _9072) ? creep
Call: (11) lists:append([_9492|_9494], [_9498], [a, b, c, d, e]) ? creep
Exit: (11) lists:append([a, b, c, d], [e], [a, b, c, d, e]) ? creep
Call: (11) lists:append([e, b, c, d], [a], _9072) ? creep
Exit: (11) lists:append([e, b, c, d], [a], [e, b, c, d, a]) ? creep
Exit: (10) exchange_first_last([a, b, c, d, e], [e, b, c, d, a]) ? creep
X = [e, b, c, d, a] .
*/

exchange_first_last([ ], [ ]).

exchange_first_last([X], [X]).

exchange_first_last(A, B) :-
    append([First | Mid], [Last], A),
    append([Last | Mid], [First], B),
    !.

/*
To generate first N Fibonacci numbers.

fibonacci - element is sum of last 2 elements
*/

% define the user predicate for reversing a list L and storing it in Reverse.
reverse_list(L, Reverse):-
   reverse(L, Reverse, []).

% define the worker predicate.
% base case.
reverse([ ], L, L).

% L is an accumulator.
% the reversed list is stored in Z.
% inductive case.
reverse([X | Rest], Z, L) :-
   reverse(Rest, Z, [X | L]).

% user function
% base case 1 - fib(0)
fib_seq(0, [0]).

% base case 2 - fib(1)
fib_seq(1, [0, 1]).

% inductive case
fib_seq(N, Seq) :-
   N > 1,
   fib_seq_(N, SeqR, 1, [1, 0]),
   reverse_list(SeqR, Seq).

% worker predicate
% fib_seq(Number, Reverse_Fib_Seq, Accumulator1, Accumulator2)
% base case - when Accumulator1 = Number, store Accumulator2 in Reverse_Fib_Seq
fib_seq_(N, Seq, N, Seq).

% inductive case
fib_seq_(N, Seq, N0, [B, A | Fs]) :-
   N > N0,
   N1 is N0 + 1,
   C is A + B,
   fib_seq_(N, Seq, N1, [C, B, A | Fs]).

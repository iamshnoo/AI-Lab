/*
Next Higher Permutation.
A positive integer is represented by a list of decimal digits. Its next
higher permutation is defined to be the next greater integer composed of
exactly the same digits. For example, the next higher permutation of
123542 is 124235.
Write
a) a declarative Prolog program
b) an efficient procedural Prolog program
that receive a list of decimal digits and return its next higher permutation
in a list.

Example 1 : Random permutation, returns next higher
?- next_higher_permutation_6a([1,2,3,5,4,2],X).
X = [1, 2, 4, 2, 3, 5].

?- next_higher_permutation_6b([1,2,3,5,4,2],X).
X = [1, 2, 4, 2, 3, 5].

Example 2: Highest permutation, no higher permutation
?- next_higher_permutation_6a([5,4,3,2,1],L).
false.

?- next_higher_permutation_6b([5,4,3,2,1],L).
false.
*/

% -----------------------------------------------------------------
% UTILITY FUNCTIONS
% -----------------------------------------------------------------
% base case - empty list has length 0
list_length([ ], 0).

% inductive case
list_length([ _ | Rest], Length) :-
  list_length(Rest, Length1),
  Length is Length1 + 1.

% define the user predicate.
reverse_list(L, Reverse) :-
  reverse(L, Reverse, []).

% define the worker predicate.
% base case.
reverse([ ], L, L).

% L is an accumulator.
% the reversed list is stored in Z.
% inductive case.
reverse([X | Rest], Z, L) :-
  reverse(Rest, Z, [X | L]).


% generates different combinations and returns it in [X | R].
takeout(X, [X | R], R).

takeout(X, [F | R], [F | S]) :-
  takeout(X, R, S).

% recursive function to call the takeout utility above
my_permutation([ ], [ ]).

my_permutation([X | Y], Z) :-
  % this recurses down to my_permutation([], []). Thus, initially W = []
  my_permutation(Y, W),
  % We use takeout to generate a permutation of X and W, storing it in Z.
  takeout(X, Z, W).

% -----------------------------------------------------------------
% 6a
% -----------------------------------------------------------------
% red cut - if we remove this, we get another answer (which is same as current)
next_higher_permutation_6a(L, L1) :-
  higher_permutation(L1, L),
  \+(far_higher_permutation(L1, L)),
  !.

higher_permutation(L1, L) :-
  % checks if L is a permutation of L1 (inbuilt function)
  my_permutation(L, L1),
  % checks if L1 is numerically greater than L
  higher(L1, L).

higher([H1 | _ ], [H | _ ]) :-
  H1 > H.

higher([H | T1], [H | T]) :-
  higher(T1, T).

% L < L2 < L1
far_higher_permutation(L1, L) :-
  higher_permutation(L2, L),
  higher(L1, L2).

% -----------------------------------------------------------------
% 6b
% -----------------------------------------------------------------

% from assignment 2 question 15.
replace_at_index([ _ | T], 1, X, [X | T]) :-
  !.

replace_at_index([H | T], N, X, [H | R]) :-
  N1 is N - 1,
  replace_at_index(T, N1, X, R).
% -----------------------------------------------------------------

% if it is the highest permutation, there is no higher permutation
next_higher_permutation_6b(L, L) :-
  reverse(L, ReversedL),
  ordered(ReversedL),
  false.

% consider the example : 1 2 3 5 4 2
next_higher_permutation_6b(L, Res) :-
  % STEP 1 : reverse the list : 2 4 5 3 2 1
  reverse_list(L, ReversedL),
  % STEP 2 : find the first Value(3) at Index(4) which is less than its previous digit
  find(ReversedL, Value, Index),
  % STEP 3 : find a digit greater than Value, and put Value at its position : 2 3 5 3 2 1
  % the digit found is stored in OldValue(4)
  find_and_replace(ReversedL, ReversedLMod, Value, OldValue),
  % STEP 4 :replace value at Index with OldValue : 2 3 5 4 2 1
  replace_at_index(ReversedLMod, Index, OldValue, ReversedLMod1),
  % STEP 5 :reverse the whole list : 1 2 4 5 3 2
  reverse_list(ReversedLMod1, LMod),
  % STEP 6 : reverse the part of list after Index
  K is Index - 1,
  list_length(L, Len),
  reverse_last_k(K, LMod, Len, Res).

% required element found (base case; Index is 2)
find([X | [Y | _ ]], Y, 2) :-
  Y < X,
  !.

% Y >= X
find([X | [Y | Rest ]], Z, Index) :-
  Y >= X,
  find([Y | Rest], Z, Index1),
  Index is Index1 + 1.

find_and_replace([X | Rest], [Value | Rest], Value, X) :-
  X > Value,
  !.

% X =< Value
find_and_replace([X | Rest], [X | Rest1], Value, OldValue) :-
  X =< Value,
  find_and_replace(Rest, Rest1, Value, OldValue).

reverse_last_k(K, L, Len, Res) :-
  K =:= Len,
  reverse(L, Res),
  !.

% K < Len
reverse_last_k(K, [X | Rest], Len, [X | Rest1]) :-
  K < Len,
  Len1 is Len - 1,
  reverse_last_k(K, Rest, Len1, Rest1).

ordered([ ]).

ordered([ _ ]).

ordered([X | [Y | Rest]]) :-
  X =< Y,
  ordered([Y | Rest]).

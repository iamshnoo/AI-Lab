/*

Generate the combinations of K distinct objects chosen from the N
elements of a list
In how many ways can a committee of 3 be chosen from a group of 12
people? We all know that there are C(12,3) = 220 possibilities (C(N,K)
denotes the well-known binomial coefficients). For pure mathematicians,
this result may be great. But we want to really generate all the possibilities
(via backtracking).

Example:

?- combination(3, [a,b,c,d,e,f], L).
{L = [a,b,c]} ;
{L = [a,b,d]} ;
{L = [a,b,e]} ;
...

C(6,3) = 20 (therefore this should have 20 answers)

?- combination(5, [a,b,c,d,e,f], L).
L = [a, b, c, d, e] ;
L = [a, b, c, d, f] ;
L = [a, b, c, e, f] ;
L = [a, b, d, e, f] ;
L = [a, c, d, e, f] ;
L = [b, c, d, e, f] ;
false.

C(6,5) = 5 (therefore this should have 5 answers)

?- combination(6, [a,b,c,d,e,f], L).
L = [a, b, c, d, e, f] ;
false.

C(6,6) = 1 (therefore this should have 1 answer)

?- combination(7, [a,b,c,d,e,f], L).
false.

Not possible to select 7 elements froma  6 element list.
*/

% -----------------------------------------------------------------
% combination(k, input_list, result_list)
%
% select a member X from L and also get the part of list after X
% we need to select the elements 'after' X so that combinations are not repeated
% for instance, in [1,2,3,4], if [1,2] is a combination, [2,1] need not be selected
% -----------------------------------------------------------------
combination(0, _ , [ ]).

combination(K, L, [X | Rest1]):-
    % choose X
    get_member_and_suffix_list(X, L, LRest),
    K1 is K - 1,
    % from Lrest, find Rest1, of length K-1 and append after X.
    combination(K1, LRest, Rest1).
% -----------------------------------------------------------------
% get_member_and_suffix_list(member_to_be_selected, input_list, rest_of_list)
% -----------------------------------------------------------------
get_member_and_suffix_list(X, [X | Rest], Rest).

get_member_and_suffix_list(X, [ _ | Rest], Rest1):-
    get_member_and_suffix_list(X, Rest, Rest1).
% -----------------------------------------------------------------

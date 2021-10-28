/*

Remove the K'th element from a list.

Example:

?- remove_at(X, [a, b, c, d], -1, R).
false.

?- remove_at(X, [a, b, c, d], 2, R).
{X = b, R = [a, c, d]}
*/

% -----------------------------------------------------------------
% remove_at(removed_element, input_list, k, remaining_list)
% -----------------------------------------------------------------
remove_at(X, [X | Rest], 1, Rest):-
    !.

remove_at(Rem, [X | Rest], N, [X | Rest1]):-
    N1 is N - 1,
    remove_at(Rem, Rest, N1, Rest1).
% -----------------------------------------------------------------

/*

Extract a given number of randomly selected elements from a list.
The selected items shall be put into a result list.

Example:

?- rnd_select([a, b, c, d, e, f, g, h], 3, L).
{L = [e, d, a]}

Hint: Use the built-in random number generator random/2 and the result of
problem P1.
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
% rnd_select(input_list, number_of_elements_to_remove, result_list)
% -----------------------------------------------------------------
rnd_select( _ , 0,[ ]):-
    !.

% K is the number of random elements to be generated.
rnd_select(L, K, [Removed | Rest]):-
    % stores length of list in Len
    length(L, Len),
    Len1 is Len + 1,
    % generates a random integer RandIndex between (1, Len1).
    random(1, Len1, RandIndex),
    % remove the RandIndex-th element and store it in Removed.
    remove_at(Removed, L, RandIndex, LRest),
    % all the steps above happen K times.
    K1 is K - 1,
    rnd_select(LRest, K1, Rest).
% -----------------------------------------------------------------

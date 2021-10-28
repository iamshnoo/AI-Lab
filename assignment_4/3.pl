/*

Generate a random permutation of the elements of a list.

Example:

?- rnd_permu([a, b, c, d, e, f], L).
{L = [b, a, d, c, e, f]}

Hint: Use the solution of problem P2.
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
    K1 is K - 1,
    rnd_select(LRest, K1, Rest).
% -----------------------------------------------------------------
% rnd_permu(input_list, result_list)
% -----------------------------------------------------------------
rnd_permu(L, Res):-
    length(L, Len),
    % select Len elements at random from Len elements, causing a shuffle
    rnd_select(L, Len, Res).
% -----------------------------------------------------------------

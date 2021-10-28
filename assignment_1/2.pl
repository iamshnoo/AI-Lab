/*
To determine whether a list is not a two-element list.
*/

% case 1 - empty list
no_doubleton([ ]).

% case 2- single element list
no_doubleton([ _ ]).

% case 3 - three or more elements in list.
no_doubleton([ _ | [ _ | [ _ | _ ]]]).

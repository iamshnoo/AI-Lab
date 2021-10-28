/*
Tower of Hanoi Problem.
The tower of Hanoi is a game played with three poles and a set of N discs.
The discs are graded in diameter, and fit onto the poles by means of a
hole cut through the center of each disc. Initially all the discs are on the
left-hand pole. The object of the game is to move all the discs onto the
center pole. The right-hand pole can be used as a “spare” pole, temporary
resting place for discs. Each time a disc is moved from one pole to

another, two constraints must be observed: only the top disc on a pole can
be moved, and no disc may be placed on top of a smaller one.
Write Prolog program to enumerate the moves to transfer N discs from
the left-hand pole to the center pole.

?- tower_of_hanoi(3).
Move from left to center
Move from left to right
Move from center to right
Move from left to center
Move from right to left
Move from right to center
Move from left to center
true.
*/

% -----------------------------------------------------------------
tower_of_hanoi(N):-
  N > 0,
  % format - num_discs,source,destination,aux.
  toh_util(N, left, center, right).
% -----------------------------------------------------------------

toh_util(1, Src, Dest, _ ):-
  move_disc(Src, Dest),
  !.

toh_util(N, Src, Dest, Aux):-
  N > 1,
  N1 is N - 1,
  % move top N-1 discs recursively from Src to Aux
  toh_util(N1, Src, Aux, Dest),
  % move bottom-most disc from Src to Dest
  move_disc(Src, Dest),
  % move the top N-1 discs recursively from Aux to Dest
  toh_util(N1, Aux, Dest, Src).

move_disc(Src, Dest):-
  format("Move from ~w to ~w\n", [Src, Dest]).

% -----------------------------------------------------------------

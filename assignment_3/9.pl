/*
There is an old song that goes as follows:
99 bottles of coke on the wall
99 bottles of coke
You take one down and pass it around
98 bottles of coke on the wall
and so on, until the last verse
1 bottle of coke on the wall
1 bottle of coke
You take one down and pass it around
No bottle of coke on the wall.
Write a Prolog program cola that receives a positive integer and prints
the Lyrics of the song. The program should print all the verses, and when
it gets to the last verse, it must print 1 bottle, not 1 bottles and no bottle
rather than 0 bottles.

?- cola(3).
3 bottles of coke on the wall
3 bottles of coke
You take one down and pass it around
2 bottles of coke on the wall
2 bottles of coke
You take one down and pass it around
1 bottle of coke on the wall
1 bottle of coke
You take one down and pass it around
No bottle of coke on the wall
true.
*/

% -----------------------------------------------------------------
cola(0):-
  !,
  write("No bottle of coke on the wall").

cola(1):-
  !,
  write("1 bottle of coke on the wall"), nl,
  write("1 bottle of coke"), nl,
  write("You take one down and pass it around"), nl,
  cola(0).
% -----------------------------------------------------------------

cola(N):-
  N > 1,
  write(N), write(" bottles of coke on the wall"), nl,
  write(N), write(" bottles of coke"), nl,
  write("You take one down and pass it around"), nl,
  N1 is N - 1,
  cola(N1).
% -----------------------------------------------------------------

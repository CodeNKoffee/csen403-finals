% Exercise 6
% a)
count([], _, 0).
count([X|T], X, C):-
  count(T, X, C1),
  C is C1 + 1.
count([H|T], X, C):-
  H \= X,
  count(T, X, C).
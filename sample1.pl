% Exercise 1
edge(a,b).
edge(b,c).
edge(b,d).
edge(c,e).
edge(d,e).
edge(e,f).
edge(g,h).
edge(f,a).

path_connects(X, Y, [X, Y]):-
	edge(X, Y).

path_connects(X, Y, [X|Path]):-
  edge(X, N),
  path_connects(N, Y, Path).


% Exercise 2
% a)
member(A, [A|_]).
member(A, [_|As]):-
  member(A, As).

difference(List, Diff):-
  member(E1, List),
  member(E2, List),
  E1 > E2,
  Diff is E1 - E2.


% b)
all_diffs(NumList, DiffList):-
  bagof(D, difference(NumList, D), DiffList).


% c)
all_diffs_differ(NumList):-
  % bagof(D, difference(NumList,D), DiffBag),
  all_diffs(NumList, DiffBag), 
  setof(D, difference(NumList, D), DiffSet),
  length(DiffBag, L),
  length(DiffSet, L).
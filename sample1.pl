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
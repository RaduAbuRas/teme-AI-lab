2.
sublist(X,Y):-append(X,_,Y).
sublist(X,Y):-append(_,X,Y).
sublist(X,Y):-append(X,_,Z),append(_,Z,Y).

/** <examples>
?- sublist([c, d, e], [a, b, c, d, e, f]).
?- sublist([b, c, e], [a, b, c, d, e, f]).
*/

4.
factor(1,_,[]).
factor(N, F, [F|Lista]):-
    0 is mod(N,F),
    N1 is N/F,
    factor(N1, F, Lista),
    !.
factor(N, F, Lista):-
    F1 is F+1,
    factor(N, F1, Lista),
    !.
descomp(N, Lista):-
    F is 2,
    factor(N, F, Lista),
    !.
/** <examples>
?- descomp(10, L).
?- descomp(100, L).
?- descomp(102, L).
*/

7.
alternativ([],L,L).
alternativ(L,[],L).
alternativ([X|L1],[Y|L2],[X,Y|ListaRez]):-
alternativ(L1,L2,ListaRez).


8.
stanga(st).
dreapta(dr).
rotirest([E|T], R) :-append(T,[E],R).
rotiredr(L, R) :-rotirest(R, L).
rotire(Lista,_,0,Lista).
rotire(Lista,Directie,Nr,ListaRez):-
    stanga(Directie),
	rotirest(Lista,L),Nr1 is Nr-1,rotire(L,st,Nr1,ListaRez).
rotire(Lista,Directie,Nr,ListaRez):-
    dreapta(Directie),
	rotiredr(Lista,L),Nr1 is Nr-1,rotire(L,dr,Nr1,ListaRez).

12.
even_odd([], [], []).
even_odd([H|T], [H|Even1], Odd) :-
    length([H|T], X),
    0 is X mod 2,
    even_odd(T, Even1, Odd),
    !.
even_odd([H|T], Even, [H|Odd1]) :-
    length([H|T], X),
    1 is X mod 2,
    even_odd(T, Even, Odd1),
    !.

/** <examples>
?- even_odd([1,2,3,4,5],L2,L3).
?- even_odd([a,b,c,d,e,f],L2,L3).
?- even_odd([1],L2,L3).
*/

2.
sublist(X,Y):-append(X,_,Y).
sublist(X,Y):-append(_,X,Y).
sublist(X,Y):-append(X,_,Z),append(_,Z,Y).

4.
%  descomp(N, Lista)
%  factp(N, Lista, Divizor).

descomp(N, L) :- factp(N, L, 2). %orice numar are 2 divizori (1 si pe el insusi).
 factp(1, [ ], _ ). %cazul de baza
factp(N, [Divizor | Lista], Divizor) :-
N > 1, 0 is N mod Divizor, N1 is N // Divizor,
factp(N1, Lista, Divizor). %este cazul cand numarul se imparte exact iar restul este 0
factp(N,Lista,Divizor) :-
 N > 1, not(0 is N mod Divizor), D1 is Divizor + 1,
 factp(N, Lista, D1).%este cazul cand numarul nu se imparte exact la 0, se va incrementa pentru a verifica in continuare


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
    even_odd(T, Even1, Odd).
even_odd([H|T], Even, [H|Odd1]) :-
    length([H|T], X),
    1 is X mod 2,
    even_odd(T, Even, Odd1).

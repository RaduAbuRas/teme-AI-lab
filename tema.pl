2.
sublist(X,Y):-append(X,_,Y).
sublist(X,Y):-append(_,X,Y).
sublist(X,Y):-append(X,_,Z),append(_,Z,Y).

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

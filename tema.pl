sublist(X,Y):-append(X,_,Y).
sublist(X,Y):-append(_,X,Y).
sublist(X,Y):-append(X,_,Z),append(_,Z,Y).
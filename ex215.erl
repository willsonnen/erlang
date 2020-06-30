-module(ex215).
-export([product/1,productT/1,maximum/1,maximumT/1]).

product([])->1;
product([X|Xs])->X*product(Xs).


productT(X)->productT(X,1).

productT([],P)->P;
productT([X|Xs],P) -> productT(Xs,X*P).


%max(X,Y) when X>=Y -> X;
%max(_,Y)->Y.

maximum([X])->X;
maximum([X|Xs]) -> max(X,maximum(Xs)).


maximumT([X])->X;
maximumT([X|Xs])->maximumT(Xs,X).

maximumT([],M)->M;
maximumT([X|Xs],M)->maximumT(Xs,max(X,M)).



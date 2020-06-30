-module(exw2).
-export([double/1,doubleT/1,reverseT/1,palindrome/1,evensT/1,take/2,takeN/2,sortPass/1,member/2,nub/1,removeAll/2,nub2/1,perm/1,len/1,shunt/1]).

double([])->[];
double([X|Xs]) ->[2*X|double(Xs)].


doubleT(X) ->doubleT(X,[]).

doubleT([],D)->D;
doubleT([X|Xs],D)->doubleT(Xs,[2*X|D]).


reverseT(X)->reverseT(X,[]).

reverseT([],R)->R;
reverseT([X|Xs],R)->reverseT(Xs,[X|R]).


palindrome([])->true;
palindrome(X) ->X==reverseT(X).


evensT(X)->evensT(X,[]).

evensT([],E)->E;
evensT([X|Xs],E) when X rem 2 == 0 -> evensT(Xs,[X|E]);
evensT([_|Xs],E)->evensT(Xs,E).


takeN(X,N)->reverseT(takeN(X,N,[])).

takeN([],_,T)->T;
takeN(_,0,T)->T;
takeN([X|Xs],N,T) ->takeN(Xs,N-1,[X|T]).

take([],_)->[];
take(_Xs,0)->[];
take([X|Xs],N) when N>0 ->[X|take(Xs,N-1)].

swap(X,Y) when X<Y ->[Y,X];
swap(X,Y) ->[X,Y].

sortPass(X)->reverseT(sortPassT(X,[])).

sortPassT([],T)->T;
sortPassT([X],T)->[X|T];   
sortPassT([X|[Y|Zs]],T) when X<Y -> sortPassT(Zs,[Y|[X|T]]);
sortPassT([X|[Y|Zs]],T) -> sortPassT(Zs,[X|[Y|T]]).

member(_X,[]) -> false;
member(X,[Y|_Ys]) when X==Y -> true;
member(X,[_Y|Ys]) -> member(X,Ys).

nub(X) -> nubT(X,[]).

nubT([],N) -> N;
nubT([X|Xs],N)  ->
    case member(X,Xs) of
	true -> nubT(Xs,N);
	false-> nubT(Xs,[X|N])
     end.

removeAll(_X,[])->[];
removeAll(X,[X|Xs]) ->removeAll(X,Xs);
removeAll(X,[Y|Xs]) ->[Y|removeAll(X,Xs)].

nub2([])->[];
nub2([X|Xs]) ->[X|nub2(removeAll(X,Xs))].

perm(X)->perm(X,len(X),[]).

perm(_,0,P)->P;
perm(X,L,P) -> perm(shunt(X), L-1 ,[shunt(X)|P]).

shunt([])->[];
shunt([X|Xs]) ->reverseT([X|reverseT(Xs)]). 

len(X)->len(X,0).

len([],L)->L;
len([_X|Xs],L) ->len(Xs,L+1).

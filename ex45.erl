-module(ex45).
-export([zip/2,doubleAll/1,evens/1,product/1,zip_with/3,zipWith/3,zip2/2]).

doubleAll(L)->lists:map(fun F(X)->2*X end,L).

evens(L)->lists:filter(fun F(X)->X rem 2==0 end,L).

product(L)->lists:foldr(fun F(X,Y)->X*Y end,1,L).

zip(X,Y)->exw2:reverseT(zip(X,Y,[])).

zip([],_Y,Z)->Z;
zip(_X,[],Z)->Z;
zip([X|Xs],[Y|Ys],Z) ->zip(Xs,Ys,[{X,Y}|Z]).

zip_with(F,X,Y)->exw2:reverseT(zip_with(F,X,Y,[])).

zip_with(F,[],_Y,Z)->Z;
zip_with(F,_X,[],Z) ->Z;
zip_with(F,[X|Xs],[Y|Ys],Z) ->zip_with(F,Xs,Ys,[F(X,Y)|Z]).

sum(X,Y)->X+Y.

zipWith(F,L1,L2)->lists:map(F,zip(L1,L2)).

zip2(L1,L2)->zipWith(fun F({X,Y})->{X,Y}end ,L1,L2).

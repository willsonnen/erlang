-module(hof).
-export([add/1,times/1,compose/2,id/1,iterate/1]).

add(X) ->
    fun(Y) -> X+Y end.
%In the shell write this as:
%Add=fun(X)->fun(Y)->X+Y end end.
%To obtain a function which adds 1 to its argument enter Add(1)
%To apply it to an argument enter (Add(1))(7).
%Or assign to another variable Add1=Add(1).
%Then Add1(7). is the same as before

times(X) ->
    fun(Y) ->
	     X*Y end.

compose(F,G) ->
    fun(X) -> G(F(X)) end.

%In the shell write this as:
%Compose = fun(F,G)->fun(X)->G(F(X)) end end.                

composeMany(L) ->
	fun(X)->
		lists:foldr(fun compose/2,fun id/1,L) end.
		
%In the shell write this as:
%ComposeMany=fun([F|Fs])->lists:foldr(Compose,Id,[F|Fs]) end.

twice(F) ->
	fun(X)
		F(F(X)) end.

%In the shell write this as:		
%Twice = fun(F)->fun(X)->F(F(X)) end end.
%or
%Twice = fun(F)->fun(X)->(Compose(F,F))(X) end end.
		
id(X) ->
    X.

iterate(0) ->
    fun(_F)->
		fun id/1 end;
		
iterate(N) ->
    fun(F) ->
		fun(X)->((iterate(N-1))(F))(F(X)).
		
%iterate(N) ->
%	fun(F) ->
%		compose(F,(iterate(N-1))(F)) end.
%Try to define with lists:map, lists:foldr and compose
      
	     


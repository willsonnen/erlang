-module(exercise115).
-export([xor1/2,xor2/2,xor3/2,xor4/2,xor5/2,maxThree/3,howManyEqual/3,test1/0,test3/0]).

xor1(true,false)->
    true;
xor1(false,true)->
    true;
xor1(_,_) ->
    false.

xor2(X,X)->
    false;
xor2(_,_) -> true.


xor3(X,Y)->
    if X==Y ->
	    false;
       true ->true
    end.


xor4(X,Y)->
    if X =/= Y ->
	    true;
       true -> false
    end.

xor5(X,Y)->
    if (X or Y) and not(X and Y)-> 
	    true;
       true -> false
		   end.



maxThree(X,Y,Z)->
    max(max(X,Y),Z).

howManyEqual(X,X,X) ->3;
howManyEqual(X,X,_) ->2;
howManyEqual(X,_,X) ->2;
howManyEqual(_,X,X) ->2;
howManyEqual(_,_,_) ->0.


test1()->
    howManyEqual(27,31,5) == 0.

test2()->
    howManyEqual(16,11,16) == 2.

test3()->
    test2().

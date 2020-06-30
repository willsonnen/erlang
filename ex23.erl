-module(ex23).
-export([fib/1,pieces/1,fibT/1,perfect/1]).

fib(1)->
    0;
fib(2) ->1;
fib(N) ->fib(N-1)+fib(N-2).


pieces(1)->
    2;
pieces(N) ->N*2 + (pieces(N-1)-N).

fibT(1)->0;
fibT(2)->1;
fibT(N)->fib(N-1,1,0).

fib(0,_,P)->P;
fib(N,C,P)->fib(N-1,C+P,C).

perfect(N)->
    sumDivisors(N,N-1,0).   
 

sumDivisors(N,0,N) -> true;
sumDivisors(N,0,_) -> false;
sumDivisors(N,D,S) when N rem D =:= 0 -> sumDivisors(N,D-1,S+D);
sumDivisors(N,D,S) -> sumDivisors(N,D-1,S).


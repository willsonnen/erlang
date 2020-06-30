-module(ex28).
-export([perimeter/1,area/1,sumBitsT/1,sumBits/1]).

perimeter({circle,{X,Y}, R})-> 2 * math:pi() * R;
perimeter({rectangle, {X,Y}, W, H}) -> 2 * (W + H);
perimeter({triangle, A, B, C}) -> A + B + C.

area({circle,{X,Y}, R})-> math:pi() * R * R;
area({rectangle, {X,Y}, W, H}) -> W * H;
area({triangle, A, B, C}) ->
    S=(A + B + C)/2.0,
    math:sqrt(S * (S - A) * (S - B) * (S - C)).

sumBitsT(N)->
    sumBitsT(N, 0).
    
sumBitsT(0, S)->
    S;

sumBitsT(N, S)->
    P = N rem 2,
    sumBitsT(N div 2, S + P).

sumBits(1)->1;
sumBits(N)->N rem 2 + sumBits(N div 2).

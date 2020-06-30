-module(second).
-export([hyp/2,perim/2,area/2]).

%Length of hypotenuse of a right-angled triangle given lengths of shorter sides
hyp(X,Y)->
	math:sqrt(first:square(X)+first:square(Y)).

perim(X,Y)->
	X+Y+hyp(X,Y).

area(X,Y)->
	first:area(X,Y,hyp(X,Y)).


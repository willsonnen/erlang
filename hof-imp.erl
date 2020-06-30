-module('hof-imp').
-export([map/2,filter/2]).

%Implement map and filter using reduce

map(_F,[])->[];
map(F,[X|Xs]) ->lists:foldr(fun(Y,L)->[F(Y)|L] end, [], [X|Xs]).

filter(_F,[])->[];
filter(F,[X|Xs]) ->lists:foldr(fun(Y,L)->
				       case F(Y) of
					   true->[Y|L];
					   false->L
				       end
			       end, [], [X|Xs]).

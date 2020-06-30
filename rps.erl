-module(rps).
-export([result/1]).

beat(rock)->paper;
beat(paper)->scissors;
beat(scissors)->rock.

lose(rock)->scissors;
lose(scissors)->paper;
lose(paper)->rock.

result({C1,C2})->
    case {C1,C2} of
	{C1,beat(C1)} -> 1;
	{C1,lose(C1)} -> -1;
	{C2,C1} when C2==C1 -> 0
    end.

%tourn(L1,L2)->lists:foldr(fun f(X,Y)->X+Y end,0,lists:map(result,zip(L1,L2))).

    

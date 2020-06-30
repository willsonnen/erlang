-module(palin).
-export([palindrome/1,to_lower/1,remove_punc/1,remove_punc/2,server/1]).

to_lower([])->[];
to_lower([X|Xs]) when $A =< X andalso X =< $Z -> [X+32|to_lower(Xs)];
to_lower([X|Xs])->[X|to_lower(Xs)].
    
remove_punc([])->[];
remove_punc([X|Xs]) -> case lists:member(X,".' ,") of
			   true->remove_punc(Xs);
			   false ->[X|remove_punc(Xs)]
		       end.

remove_punc([],_)->[];
remove_punc(String,L) -> lists:filter(fun(Ch) ->
					    not(lists:member(Ch, L)) end,
				      String).
palindrome([])->true;
palindrome(X) ->to_lower(remove_punc(X))==lists:reverse(to_lower(remove_punc(X))).

server(Pid)->
    receive
	{check,String}->
	    case palindrome(String) of
		true -> Pid ! {result, io:format("~s is a palindrome-n", [String])};
		false -> Pid !  {result, io:format("~s is not a palindrome-n", [String])}
	    end,

	    server(Pid);
		
	_ ->
	    io:format("Stopped-n")

    end.


%Useful in hackerrank challenges

main() ->
    { ok, [N]} = io:fread("", "~d"),
    io:format("~p~n", [N]),
    Nums = read_data([]),
    io:format("~p~n", [Nums]).

read_data(Numbers) -> 
   case io:fread("", "~d") of
       eof ->
           lists:reverse(Numbers);
       {error, _} ->
           lists:reverse(Numbers);
       {ok, [X]} ->
           read_data([X|Numbers])
   end.

main() ->

        { ok, [N]} = io:fread("", "~d"),
            A = read_2darray(N,N,"~d"),
                true.

read_array(0,D) -> [];
read_array(N,D) ->
       {ok, [X]} = io:fread("", D),
          [X | read_array(N-1,D)].

read_2darray(0,M,D) -> [];
read_2darray(N,M,D) ->
       Q=read_array(M,D),
          [Q | read_2darray(N-1,M,D)].


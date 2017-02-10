-module(concurrent_template).
-compile(export_all).

start() ->
    spawn(?MODULE, loop, []).

rpc(Pid, Request) ->
    Pid ! {self(), Request),
    receive
        {Pid, Response} ->
            Response
    end.

loop() ->
    receive
        Any ->
            io:format("Receive:~p~n", [Any]),
            loop()
    end.

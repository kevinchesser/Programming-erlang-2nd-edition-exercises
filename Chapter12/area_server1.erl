-module(area_server1).
-export([loop/0, rpc/2]).

rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
        {Pid, Response} ->
            Response
    end.

loop() ->
    receive
        {From, {rectangle, Width, Height}} ->
            From ! {self(), Width * Height},
            loop();
        {From, {circle, R}} ->
            From ! {self(), R * R * 3.1459},
            loop();
        {From, Other} ->
            From ! {self(), {error, Other}},
            loop()
    end.

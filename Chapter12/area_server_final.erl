-module(area_server_final).
-export([loop/0, start/0, area/2]).


start() -> spawn(area_server_final, loop, []).
%We can now hide the spawn and rpc inside of the module this way

area(Pid, What) ->
    rpc(Pid, What).

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

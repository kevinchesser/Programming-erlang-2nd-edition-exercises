-module(area_server0).
-export([loop/0]).

loop() ->
    receive
        {From, {rectangle, Width, Height}} ->
            From ! Width * Height,
            loop();
        {From, {square, Side}} ->
            From ! Side * Side,
            loop
    end.

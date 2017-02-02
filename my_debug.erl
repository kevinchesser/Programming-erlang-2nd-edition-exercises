-module(my_debug).
-export([loop/1]).

%to enable the macro we compile with the debug_flag - c(m1, {d, debug_flag}).
-ifdef(debug_flag).
-define(DEBUG(X), io:format("DEBUG ~p:~p ~p~n",[?MODULE, ?LINE, X])).
-else.
-define(DEBUG(X), void).
-endif.

loop(0) ->
    done;
loop(N) ->
    ?DEBUG(N),
    loop(N-1).

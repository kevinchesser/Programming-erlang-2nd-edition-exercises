-module(lib_misc).

sleep(T) ->
    receive
    after T ->
        true
    end.

flush_buffer() ->
    receive
        _Any ->
            flush_buffer()
    after 0 ->
        true
    end.

priority_receive() ->
    receive
        {alarm, X}
    after 0 ->
        receive
            Any ->
                Any
        end
    end.

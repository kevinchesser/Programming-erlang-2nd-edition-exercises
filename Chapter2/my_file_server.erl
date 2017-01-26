-module(my_file_server).
-export([start/1, loop/1]).

start(Dir) -> spawn(my_file_server, loop, [Dir]). %%Module, function, List of arguments

loop(Dir) ->
    receive
        {Client, list_dir} -> %%From, Message - Client gets the pid the message is from, list_dir is the message
            Client ! {self(), file:list_dir(Dir)}; 
            %%Pid ! Msg - Send message to the Pid - self() argument identified the process sending the message
        {Client, {get_file, File}} ->
            Full = filename:join(Dir, File),
            Client ! {self(), file:read_file(Full)};
        {Client, {put_file, File}} ->
            Client ! {self(), file:open(File, write)}
    end,
    loop(Dir).

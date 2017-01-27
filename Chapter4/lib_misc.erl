-module(lib_misc).
-export([for/3]).

for(Max, Max, F) ->
    [F(Max)];
for(I, Max, F) ->
    [F(I)|for(I+1, Max, F)].

quicksort([]) ->
    [];
quicksort([Pivot|T]) ->
    quicksort([X || X <- T, X < Pivot])
    ++ [Pivot] ++
    quicksort([X || X <- T, X >= Pivot]).

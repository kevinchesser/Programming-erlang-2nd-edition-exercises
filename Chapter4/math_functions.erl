-module(math_functions).
-export([even/1, odd/1, filter/2, split/1]).

even(X) when X rem 2 =:= 0 ->
    true;
even(X) ->
    false.

odd(X) when X rem 2 =:= 1 ->
    true;
odd(X) ->
    false.

filter(F, L) ->
    [X || X <- L, F(X) =:= true].

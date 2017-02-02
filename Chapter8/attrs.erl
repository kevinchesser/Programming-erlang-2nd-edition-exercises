-module(attrs).
-vsn(1234).
-author({kevin,chesser}).
-purpose("examples of attributes").
-export([fac/1]).

fac(1) ->
    1;
fac(N) -> N * fac(N-1).



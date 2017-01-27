-module(geometry).
-export([test/0, area/1]).

test() ->
    50 = area({rectangle, 10, 5}),
    169 = area({square, 13}),
    tests_worked.

area({rectangle, Width, Height}) ->
    Width * Height;
area({circle, Radius}) ->
    3.14159 * Radius * Radius;
area({square, Side}) ->
    Side * Side.
